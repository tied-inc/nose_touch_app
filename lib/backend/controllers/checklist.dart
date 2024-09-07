import 'package:nose_touch/backend/models/database.dart';
import 'package:nose_touch/backend/usecases/checklist.dart';
import 'package:nose_touch/schema/checklist/entities.dart';
import 'package:nose_touch/schema/checklist/requests.dart';

class ChecklistController {
  final AppDatabase database;
  final ChecklistUsecase usecase;

  ChecklistController(this.database) : usecase = ChecklistUsecase(database);

  Future<NeedsChecklist> index() async {
    final records = await usecase.getItems();
    if (records.isEmpty()) {
      return usecase.createDefaultChecklist();
    }
    return records;
  }

  Future<NeedsChecklistItem> update(UpdateChecklistRequest req) async {
    final item = await usecase.getItem(req.id);
    final newItem = item.copyWith(value: req.value);
    return await usecase.updateItem(newItem);
  }
}
