import 'package:nose_touch/domain/entities/needs_checklist.dart';
import 'package:nose_touch/domain/repo/checklist.dart';

class NeedsChecklistService {
  final IChecklistRepo checklistRepo;

  NeedsChecklistService(this.checklistRepo);

  Future<NeedsChecklist> showChecklist() async {
    final records = await checklistRepo.getItems();
    if (records.isEmpty()) {
      return await checklistRepo.createDefaultChecklist();
    }
    return records;
  }

  Future<NeedsChecklistItem> toggleItemValue(
      NeedsChecklistItem item, bool value) async {
    final newItem = item.copyWith(value: value);
    return await checklistRepo.updateItem(newItem);
  }
}
