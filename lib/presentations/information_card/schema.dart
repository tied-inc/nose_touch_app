import 'package:nose_touch/schema/pet/entities.dart';

class BasicInfoSchema {
  String id;
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
  int updatedAt;

  BasicInfoSchema({
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

  factory BasicInfoSchema.fromEntity(PetBasicInfo petInfo) {
    return BasicInfoSchema(
      id: petInfo.id,
      name: petInfo.name,
      species: petInfo.species,
      breed: petInfo.breed,
      color: petInfo.color,
      microchipNumber: petInfo.microchipNumber,
      dogRegistrationNumber: petInfo.dogRegistrationNumber,
      weight: petInfo.weight,
      characteristics: petInfo.characteristics,
      temper: petInfo.temper,
      medicalHistory: petInfo.medicalHistory,
      medicalCondition: petInfo.medicalCondition,
      hospitalName: petInfo.hospitalName,
      hospitalPhoneNumber: petInfo.hospitalPhoneNumber,
      createdAt: petInfo.createdAt,
      updatedAt: petInfo.updatedAt,
    );
  }

  PetBasicInfo toEntity() {
    return PetBasicInfo(
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
      updatedAt: DateTime.now().millisecondsSinceEpoch,
    );
  }

  BasicInfoSchema copyWith({
    String? id,
    String? name,
    String? species,
    String? breed,
    String? color,
    String? microchipNumber,
    String? dogRegistrationNumber,
    String? weight,
    String? characteristics,
    String? temper,
    String? medicalHistory,
    String? medicalCondition,
    String? hospitalName,
    String? hospitalPhoneNumber,
  }) {
    return BasicInfoSchema(
      id: id ?? this.id,
      name: name ?? this.name,
      species: species ?? this.species,
      breed: breed ?? this.breed,
      color: color ?? this.color,
      microchipNumber: microchipNumber ?? this.microchipNumber,
      dogRegistrationNumber:
          dogRegistrationNumber ?? this.dogRegistrationNumber,
      weight: weight ?? this.weight,
      characteristics: characteristics ?? this.characteristics,
      temper: temper ?? this.temper,
      medicalHistory: medicalHistory ?? this.medicalHistory,
      medicalCondition: medicalCondition ?? this.medicalCondition,
      hospitalName: hospitalName ?? this.hospitalName,
      hospitalPhoneNumber: hospitalPhoneNumber ?? this.hospitalPhoneNumber,
      createdAt: createdAt,
      updatedAt: DateTime.now().millisecondsSinceEpoch,
    );
  }
}
