import 'package:drift/drift.dart';
import 'package:nose_touch/domain/entities/pet_info.dart';
import 'package:nose_touch/domain/repo/pet.dart';
import 'package:nose_touch/infra/database.dart';
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

    return PetInfo(
        basicInfo: PetBasicInfo.fromModel(rows.first.readTable(database.pets)),
        hospitalInfo: PetHospitalInfo.fromModel(
            rows.first.readTable(database.hospitalInfos)),
        vaccinations: vaccinations);
  }

  PetInfo getDefaultPetInfo() {
    return PetInfo(
      basicInfo: PetBasicInfo(
        id: 1,
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
        hospitalName: 'Hospital Name',
        hospitalPhoneNumber: 'Hospital Phone Number',
        createdAt: DateTime.now().millisecondsSinceEpoch,
        updatedAt: DateTime.now().millisecondsSinceEpoch,
        medicalHistory: 'Medical History',
        medicalCondition: 'Medical Condition',
      ),
      vaccinations: [
        PetVaccination(
          id: 1,
          petId: 1,
          createdAt: DateTime.now().millisecondsSinceEpoch,
          updatedAt: DateTime.now().millisecondsSinceEpoch,
          vaccinationName: 'Vaccination Name',
          vaccinationDate: '',
        ),
      ],
    );
  }

  @override
  Future<void> updatePet(PetInfo petInfo) async {
    final database = ref.read(databaseProvider);
  }
}
