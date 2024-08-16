import 'package:nose_touch/domain/entities/needs_checklist.dart';

abstract class IChecklistRepo {
  NeedsChecklist getDefaultItems();

  Future<NeedsChecklist> createDefaultChecklist();

  Future<NeedsChecklist> getItems();

  Future<NeedsChecklistItem> updateItem(NeedsChecklistItem item);
}
