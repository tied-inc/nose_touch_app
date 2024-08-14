import 'package:drift/drift.dart';
import 'package:nose_touch/domain/entities/pet_info.dart';
import 'package:nose_touch/domain/repo/pet.dart';
import 'package:nose_touch/infra/database.dart';

class PetRepo implements IPetRepo {
  final AppDatabase database;

  PetRepo(this.database);

  @override
  Future<PetBasicInfo?> getPetBasicInfo() async {
    final rows = await database.select(database.pets).get();

    if (rows.isEmpty) {
      return null;
    }
    final firstRow = rows.first;

    return PetBasicInfo(
      id: firstRow.id,
      name: firstRow.name,
      species: firstRow.species,
      breed: firstRow.breed,
      color: firstRow.color,
      microchipNumber: firstRow.microchipNumber,
      dogRegistrationNumber: firstRow.dogRegistrationNumber,
      weight: firstRow.weight,
      characteristics: firstRow.characteristics,
      temper: firstRow.temper,
      medicalHistory: firstRow.medicalHistory,
      medicalCondition: firstRow.medicalCondition,
      hospitalName: firstRow.hospitalName,
      hospitalPhoneNumber: firstRow.hospitalPhoneNumber,
      createdAt: firstRow.createdAt,
      updatedAt: firstRow.updatedAt,
    );
  }

  @override
  PetBasicInfo getDefaultPetInfo() {
    return PetBasicInfo(
      name: '',
      species: '',
      breed: '',
      color: '',
      microchipNumber: '',
      dogRegistrationNumber: '',
      weight: '',
      characteristics: '',
      temper: '',
      medicalHistory: '',
      medicalCondition: '',
      hospitalName: '',
      hospitalPhoneNumber: '',
      createdAt: DateTime.now().millisecondsSinceEpoch,
      updatedAt: DateTime.now().millisecondsSinceEpoch,
    );
  }

  @override
  Future<PetBasicInfo> upsertPetBasicInfo(PetBasicInfo petInfo) async {
    PetsCompanion companion;
    if (petInfo.id == null) {
      companion = PetsCompanion(
        name: Value(petInfo.name),
        species: Value(petInfo.species),
        breed: Value(petInfo.breed),
        color: Value(petInfo.color),
        microchipNumber: Value(petInfo.microchipNumber),
        dogRegistrationNumber: Value(petInfo.dogRegistrationNumber),
        weight: Value(petInfo.weight),
        characteristics: Value(petInfo.characteristics),
        temper: Value(petInfo.temper),
        medicalHistory: Value(petInfo.medicalHistory),
        medicalCondition: Value(petInfo.medicalCondition),
        hospitalName: Value(petInfo.hospitalName),
        hospitalPhoneNumber: Value(petInfo.hospitalPhoneNumber),
        createdAt: Value(petInfo.createdAt),
        updatedAt: Value(petInfo.updatedAt),
      );
    } else {
      companion = PetsCompanion(
        id: Value(petInfo.id ?? 0),
        name: Value(petInfo.name),
        species: Value(petInfo.species),
        breed: Value(petInfo.breed),
        color: Value(petInfo.color),
        microchipNumber: Value(petInfo.microchipNumber),
        dogRegistrationNumber: Value(petInfo.dogRegistrationNumber),
        weight: Value(petInfo.weight),
        characteristics: Value(petInfo.characteristics),
        temper: Value(petInfo.temper),
        medicalHistory: Value(petInfo.medicalHistory),
        medicalCondition: Value(petInfo.medicalCondition),
        hospitalName: Value(petInfo.hospitalName),
        hospitalPhoneNumber: Value(petInfo.hospitalPhoneNumber),
        createdAt: Value(petInfo.createdAt),
        updatedAt: Value(petInfo.updatedAt),
      );
    }

    await database.into(database.pets).insertOnConflictUpdate(companion);
    final newItem = await getPetBasicInfo();
    if (newItem == null) {
      throw Exception('Failed to get pet info');
    }
    return newItem;
  }
}
