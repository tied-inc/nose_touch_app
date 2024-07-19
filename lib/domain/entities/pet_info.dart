import 'package:nose_touch/infra/dto/pet.dart';

class PetInfo {
  PetBasicInfo basicInfo;
  PetHospitalInfo hospitalInfo;
  List<PetVaccination> vaccinations;

  PetInfo({
    required this.basicInfo,
    required this.hospitalInfo,
    required this.vaccinations,
  });

  static Map<String, String> getTitleMap() => {
        'name': '名前',
        'breed': '性別',
        'species': '種類',
        'color': '毛色',
        'microchipNumber': 'マイクロチップ番号',
        'dogRegistrationNumber': '犬の登録番号',
        'weight': '体重',
        'characteristics': '特徴',
        'temper': '性格',
        'medicalHistory': '病歴',
        'medicalCondition': '服薬状況',
        'hospitalName': 'かかりつけ病院',
        'hospitalPhoneNumber': 'かかりつけ病院電話番号',
      };
}

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
  int? id;
  int? petId;
  String medicalHistory;
  String medicalCondition;
  String hospitalName;
  String hospitalPhoneNumber;
  final int createdAt;
  int updatedAt;

  PetHospitalInfo({
    this.id,
    this.petId,
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
}
