import 'package:nose_touch/backend/models/dto/pet.dart';

class PetVaccination {
  final String id;
  final String petId;
  String vaccinationName;
  String vaccinationDate;
  final int createdAt;
  int updatedAt;

  PetVaccination({
    required this.id,
    required this.petId,
    required this.vaccinationName,
    required this.vaccinationDate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PetVaccination.getDefault(String petId) {
    return PetVaccination(
      id: '',
      petId: petId,
      vaccinationName: '',
      vaccinationDate: '',
      createdAt: DateTime.now().millisecondsSinceEpoch,
      updatedAt: DateTime.now().millisecondsSinceEpoch,
    );
  }

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

  PetVaccination copyWith({
    String? id,
    String? petId,
    String? vaccinationName,
    String? vaccinationDate,
    int? createdAt,
    int? updatedAt,
  }) {
    return PetVaccination(
      id: id ?? this.id,
      petId: petId ?? this.petId,
      vaccinationName: vaccinationName ?? this.vaccinationName,
      vaccinationDate: vaccinationDate ?? this.vaccinationDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
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
