import 'package:drift/drift.dart';
import 'package:nose_touch/domain/entities/pet_info.dart';
import 'package:nose_touch/domain/repo/pet.dart';
import 'package:nose_touch/infra/database.dart';
import 'package:nose_touch/infra/dto/pet.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pet.g.dart';

@riverpod
class PetRepo extends _$PetRepo implements IPetRepo {
  @override
  Future<PetInfo?> build() async => await getPetInfo();

  @override
  Future<PetInfo?> getPetInfo() async {
    final database = ref.read(databaseProvider);

    final vaccinations_ = database.alias(database.vaccinations, 'vaccinations');
    final rows = await database.select(database.pets).join([
      innerJoin(
        database.hospitalInfos,
        database.hospitalInfos.petId.equalsExp(database.pets.id),
      ),
      innerJoin(
        database.vaccinations,
        database.vaccinations.petId.equalsExp(database.pets.id),
      ),
    ]).get();

    if (rows.isEmpty) {
      return null;
    }

    List<PetVaccination> vaccinations = [];
    rows.map((row) {
      vaccinations.add(PetVaccination.fromModel(row.readTable(vaccinations_)));
    });

    final firstRow = rows.first;

    return PetInfo(
        basicInfo: PetBasicInfo.fromModel(firstRow.readTable(database.pets)),
        hospitalInfo: PetHospitalInfo.fromModel(
            firstRow.readTable(database.hospitalInfos)),
        vaccinations: vaccinations);
  }

  PetInfo getDefaultPetInfo() {
    return PetInfo(
      basicInfo: PetBasicInfo(
        name: 'Pet Name',
        species: 'Species',
        breed: 'Breed',
        color: 'Color',
        microchipNumber: 'Microchip Number',
        dogRegistrationNumber: 'Dog Registration Number',
        weight: 'Weight',
        characteristics: 'Characteristics',
        temper: 'Temper',
        createdAt: DateTime.now().millisecondsSinceEpoch,
        updatedAt: DateTime.now().millisecondsSinceEpoch,
      ),
      hospitalInfo: PetHospitalInfo(
        hospitalName: '病院名',
        hospitalPhoneNumber: '電話番号',
        createdAt: DateTime.now().millisecondsSinceEpoch,
        updatedAt: DateTime.now().millisecondsSinceEpoch,
        medicalHistory: '',
        medicalCondition: '',
      ),
      vaccinations: [
        PetVaccination(
          createdAt: DateTime.now().millisecondsSinceEpoch,
          updatedAt: DateTime.now().millisecondsSinceEpoch,
          vaccinationName: 'Vaccination Name',
          vaccinationDate: '',
        ),
      ],
    );
  }

  @override
  Future<void> upsertPetInfo(PetInfo petInfo) async {
    final database = ref.read(databaseProvider);

    final pets = database.pets;
    final hospitalInfos = database.hospitalInfos;
    final vaccinations = database.vaccinations;

    await database.transaction(() async {
      await database.into(pets).insertOnConflictUpdate(
          petInfo.basicInfo.toModel() as Insertable<Pet>);
      await database.into(hospitalInfos).insertOnConflictUpdate(
          petInfo.hospitalInfo.toModel() as Insertable<HospitalInfo>);
      await database.batch((b) {
        for (var v in petInfo.vaccinations) {
          b.insertAllOnConflictUpdate(
              vaccinations, v.toModel() as Iterable<Insertable<Vaccination>>);
        }
      });
    });
  }
}
