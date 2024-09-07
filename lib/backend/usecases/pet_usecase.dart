import 'package:drift/drift.dart';
import 'package:nose_touch/backend/models/database.dart';
import 'package:nose_touch/backend/models/dto/pet.dart';
import 'package:nose_touch/schema/pet/entities.dart';

class PetUsecase {
  final AppDatabase database;

  PetUsecase(this.database);

  Future<Pet> getPet(String id) async {
    return await (database.select(database.pets)
          ..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  Future<List<Pet>> getPets() async {
    return await database.select(database.pets).get();
  }

  Future<Pet> upsertPet(PetBasicInfo item) async {
    final companion = PetsCompanion(
      id: Value(item.id),
      name: Value(item.name),
      species: Value(item.species),
      breed: Value(item.breed),
      color: Value(item.color),
      microchipNumber: Value(item.microchipNumber),
      dogRegistrationNumber: Value(item.dogRegistrationNumber),
      weight: Value(item.weight),
      characteristics: Value(item.characteristics),
      temper: Value(item.temper),
      medicalHistory: Value(item.medicalHistory),
      medicalCondition: Value(item.medicalCondition),
      hospitalName: Value(item.hospitalName),
      hospitalPhoneNumber: Value(item.hospitalPhoneNumber),
      createdAt: Value(item.createdAt),
      updatedAt: Value(item.updatedAt),
    );

    await database.into(database.pets).insertOnConflictUpdate(companion);
    final newItem = await getPet(item.id);
    return newItem;
  }
}
