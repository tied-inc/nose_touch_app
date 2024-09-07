import 'package:drift/drift.dart';
import 'package:nose_touch/backend/models/database.dart';
import 'package:nose_touch/backend/models/dto/pet.dart';

class VaccinationUsecase {
  final AppDatabase database;

  VaccinationUsecase(this.database);

  Future<List<Vaccination>> getPetVaccines(String petId) async {
    final rows = await (database.select(database.vaccinations)
          ..where((tbl) => tbl.petId.equals(petId)))
        .get();
    return rows;
  }

  Future<Vaccination> getPetVaccine(String id) async {
    return await (database.select(database.vaccinations)
          ..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  Future<Vaccination> upsertPetVaccine(Vaccination item) async {
    final companion = VaccinationsCompanion(
      id: Value(item.id),
      petId: Value(item.petId),
      vaccinationName: Value(item.vaccinationName),
      vaccinationDate: Value(item.vaccinationDate),
      createdAt: Value(item.createdAt),
      updatedAt: Value(item.updatedAt),
    );

    await database
        .into(database.vaccinations)
        .insertOnConflictUpdate(companion);
    return await getPetVaccine(item.id);
  }
}
