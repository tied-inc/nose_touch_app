import 'package:nose_touch/backend/models/database.dart';
import 'package:nose_touch/backend/usecases/pet.dart';
import 'package:nose_touch/schema/pet/entities.dart';

class PetController {
  final AppDatabase database;
  final PetUsecase usecase;

  PetController(this.database) : usecase = PetUsecase(database);

  Future<PetBasicInfo> detail(String id) async {
    try {
      final row = await usecase.getPet(id);
      return PetBasicInfo.fromModel(row);
    } catch (e) {
      return PetBasicInfo.getDefault();
    }
  }

  Future<PetBasicInfo> upsert(PetBasicInfo item) async {
    final ret = await usecase.upsertPet(item);

    return PetBasicInfo.fromModel(ret);
  }
}
