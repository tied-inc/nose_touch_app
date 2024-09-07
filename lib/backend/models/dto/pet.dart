class Pet {
  final String id;
  final String name;
  final String species;
  final String breed;
  final String color;
  final String microchipNumber;
  final String dogRegistrationNumber;
  final String weight;
  final String characteristics;
  final String temper;
  final String medicalHistory;
  final String medicalCondition;
  final String hospitalName;
  final String hospitalPhoneNumber;
  final int createdAt;
  final int updatedAt;

  Pet({
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
    required this.medicalHistory,
    required this.medicalCondition,
    required this.hospitalName,
    required this.hospitalPhoneNumber,
    required this.createdAt,
    required this.updatedAt,
  });
}

class Vaccination {
  final String id;
  final String petId;
  final String vaccinationName;
  final String vaccinationDate;
  final int createdAt;
  final int updatedAt;

  Vaccination({
    required this.id,
    required this.petId,
    required this.vaccinationName,
    required this.vaccinationDate,
    required this.createdAt,
    required this.updatedAt,
  });
}
