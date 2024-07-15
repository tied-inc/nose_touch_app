import 'package:drift/drift.dart';
import 'package:pet_safety/domain/entities/pet_info.dart';
import 'package:pet_safety/domain/repo/pet.dart';
import 'package:pet_safety/infra/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pet.g.dart';

@riverpod
class PetRepo extends _$PetRepo implements IPetRepo {
  Future<void> build() async {}

  @override
  Future<PetInfo> getPetInfo() async {
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

  @override
  Future<void> updatePet(PetInfo petInfo) async {
    final database = ref.read(databaseProvider);
  }
}
