import 'package:nose_touch/domain/entities/needs_checklist.dart';
import 'package:nose_touch/infra/repo/checklist.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'needs_checklist_service.g.dart';

@riverpod
class NeedsChecklistService extends _$NeedsChecklistService {
  @override
  Future<NeedsChecklist> build() {
    return showChecklist();
  }

  Future<NeedsChecklist> showChecklist() async {
    final notifier = ref.watch(checklistRepoProvider.notifier);

    final records = await notifier.getItems();
    if (records.isEmpty()) {
      return await notifier.createDefaultChecklist();
    }
    return records;
  }

  Future<void> toggleItemValue(NeedsChecklistItem item, bool value) async {
    final notifier = ref.watch(checklistRepoProvider.notifier);

    final newItem = item.copyWith(value: value);
    await notifier.updateItem(newItem);
  }
}
