import 'package:nose_touch/infra/dto/pet.dart';

class PetBasicInfo {
  int? id;
  String name;
  String species;
  String breed;
  String color;
  String microchipNumber;
  String dogRegistrationNumber;
  String weight;
  String characteristics;
  String temper;

  String medicalHistory;
  String medicalCondition;
  String hospitalName;
  String hospitalPhoneNumber;

  final int createdAt;
  int updatedAt;

  PetBasicInfo({
    this.id,
    required this.name,
    required this.species,
    required this.breed,
    required this.color,
    required this.microchipNumber,
    required this.dogRegistrationNumber,
    required this.weight,
    required this.characteristics,
    required this.temper,
    required this.medicalHistory,
    required this.medicalCondition,
    required this.hospitalName,
    required this.hospitalPhoneNumber,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PetBasicInfo.fromModel(Pet model) {
    return PetBasicInfo(
      id: model.id,
      name: model.name,
      species: model.species,
      breed: model.breed,
      color: model.color,
      microchipNumber: model.microchipNumber,
      dogRegistrationNumber: model.dogRegistrationNumber,
      weight: model.weight,
      characteristics: model.characteristics,
      temper: model.temper,
      medicalHistory: model.medicalHistory,
      medicalCondition: model.medicalCondition,
      hospitalName: model.hospitalName,
      hospitalPhoneNumber: model.hospitalPhoneNumber,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  Pet toModel() => Pet(
        id: id,
        name: name,
        species: species,
        breed: breed,
        color: color,
        microchipNumber: microchipNumber,
        dogRegistrationNumber: dogRegistrationNumber,
        weight: weight,
        characteristics: characteristics,
        temper: temper,
        medicalHistory: medicalHistory,
        medicalCondition: medicalCondition,
        hospitalName: hospitalName,
        hospitalPhoneNumber: hospitalPhoneNumber,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}

class PetVaccination {
  int? id;
  int? petId;
  String vaccinationName;
  String vaccinationDate;
  final int createdAt;
  int updatedAt;

  PetVaccination({
    this.id,
    this.petId,
    required this.vaccinationName,
    required this.vaccinationDate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PetVaccination.fromModel(Vaccination model) {
    return PetVaccination(
      id: model.id,
      petId: model.petId,
      vaccinationName: model.vaccinationName,
      vaccinationDate: model.vaccinationDate,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  Vaccination toModel() => Vaccination(
        id: id,
        petId: petId,
        vaccinationName: vaccinationName,
        vaccinationDate: vaccinationDate,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}
