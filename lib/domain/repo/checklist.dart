import 'package:pet_safety/domain/entities/needs_checklist.dart';

abstract class IChecklistRepo {
  NeedsChecklist getDefaultItems();
  Future<NeedsChecklist> createDefaultChecklist();

  Future<NeedsChecklist> getItems();
  Future<void> updateItem(NeedsChecklistItem item);
}
