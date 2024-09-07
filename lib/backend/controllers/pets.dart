import 'package:nose_touch/backend/models/database.dart';
import 'package:nose_touch/backend/usecases/pet_usecase.dart';
import 'package:nose_touch/schema/pet/entities.dart';

class PetController {
  final AppDatabase database;
  final PetUsecase usecase;

  PetController(this.database) : usecase = PetUsecase(database);

  Future<PetBasicInfo> detail() async {
    try {
      final row = await usecase.getPets();
      return PetBasicInfo.fromModel(row.first);
    } catch (e) {
      return PetBasicInfo.getDefault();
    }
  }

  Future<PetBasicInfo> upsert(PetBasicInfo item) async {
    final ret = await usecase.upsertPet(item);

    return PetBasicInfo.fromModel(ret);
  }
}
