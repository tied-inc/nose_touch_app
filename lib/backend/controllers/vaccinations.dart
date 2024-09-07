import 'package:nose_touch/backend/models/database.dart';
import 'package:nose_touch/backend/usecases/vaccinations.dart';
import 'package:nose_touch/schema/vaccinations/entities.dart';

class VaccinationsController {
  final AppDatabase database;
  final VaccinationUsecase usecase;

  VaccinationsController(this.database)
      : usecase = VaccinationUsecase(database);

  Future<List<PetVaccination>> index(String petId) async {
    final ret = await usecase.getPetVaccines(petId);
    if (ret.isEmpty) {
      return [PetVaccination.getDefault(petId)];
    }
    return ret.map((e) => PetVaccination.fromModel(e)).toList();
  }

  Future<PetVaccination> upsert(PetVaccination item) async {
    final newItem = await usecase.upsertPetVaccine(item.toModel());
    return PetVaccination.fromModel(newItem);
  }
}
