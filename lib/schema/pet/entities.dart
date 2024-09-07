import 'package:nose_touch/backend/models/dto/pet.dart';
import 'package:uuid/uuid.dart';

class PetBasicInfo {
  String id;
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

  factory PetBasicInfo.getDefault() {
    const uuid = Uuid();
    return PetBasicInfo(
      id: uuid.v4(),
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

  PetBasicInfo copyWith({
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
    int? createdAt,
    int? updatedAt,
  }) {
    return PetBasicInfo(
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
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
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
