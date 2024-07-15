import 'package:pet_safety/infra/dto/pet.dart';

class PetInfo {
  final PetBasicInfo basicInfo;
  final PetHospitalInfo hospitalInfo;
  final List<PetVaccination> vaccinations;

  PetInfo({
    required this.basicInfo,
    required this.hospitalInfo,
    required this.vaccinations,
  });
}

class PetBasicInfo {
  final int id;
  final String name;
  final String species;
  final String breed;
  final String color;
  final String microchipNumber;
  final String dogRegistrationNumber;
  final String weight;
  final String characteristics;
  final String temper;
  final int createdAt;
  final int updatedAt;

  PetBasicInfo({
    required this.id,
    required this.name,
    required this.species,
    required this.breed,
    required this.color,
    required this.microchipNumber,
    required this.dogRegistrationNumber,
    required this.weight,
    required this.characteristics,
    required this.temper,
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
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }
}

class PetHospitalInfo {
  final int id;
  final int petId;
  final String medicalHistory;
  final String medicalCondition;
  final String hospitalName;
  final String hospitalPhoneNumber;
  final int createdAt;
  final int updatedAt;

  PetHospitalInfo({
    required this.id,
    required this.petId,
    required this.medicalHistory,
    required this.medicalCondition,
    required this.hospitalName,
    required this.hospitalPhoneNumber,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PetHospitalInfo.fromModel(HospitalInfo model) {
    return PetHospitalInfo(
      id: model.id,
      petId: model.petId,
      medicalHistory: model.medicalHistory,
      medicalCondition: model.medicalCondition,
      hospitalName: model.hospitalName,
      hospitalPhoneNumber: model.hospitalPhoneNumber,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }
}

class PetVaccination {
  final int id;
  final int petId;
  final String vaccinationName;
  final String vaccinationDate;
  final int createdAt;
  final int updatedAt;

  PetVaccination({
    required this.id,
    required this.petId,
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
}
