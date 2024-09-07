import 'package:drift/drift.dart';
import 'package:nose_touch/backend/models/database.dart';
import 'package:nose_touch/schema/checklist/entities.dart';
import 'package:uuid/uuid.dart';

class ChecklistUsecase {
  final AppDatabase database;

  ChecklistUsecase(this.database);

  Future<NeedsChecklistItem> getItem(String id) async {
    final item = await (database.select(database.checklistItems)
          ..where((tbl) => tbl.id.equals(id)))
        .getSingle();

    return NeedsChecklistItem.fromModel(item);
  }

  NeedsChecklist getDefaultItems() {
    const uuid = Uuid();
    return NeedsChecklist(items: [
      NeedsChecklistItem(
          id: uuid.v4(),
          col: 'food',
          label: 'フード',
          description: '最低5日分、できれば7日分',
          value: false,
          createdAt: DateTime.now().millisecondsSinceEpoch,
          updatedAt: DateTime.now().millisecondsSinceEpoch),
      NeedsChecklistItem(
          id: uuid.v4(),
          col: 'water',
          label: '水',
          description: '最低5日分、できれば7日分',
          value: false,
          createdAt: DateTime.now().millisecondsSinceEpoch,
          updatedAt: DateTime.now().millisecondsSinceEpoch),
      NeedsChecklistItem(
          id: uuid.v4(),
          col: 'medication',
          label: '常備薬・療養食',
          description: '普段使用しているもの',
          value: false,
          createdAt: DateTime.now().millisecondsSinceEpoch,
          updatedAt: DateTime.now().millisecondsSinceEpoch),
      NeedsChecklistItem(
          id: uuid.v4(),
          col: 'tableware',
          label: '食器',
          description: 'ラップなどあるとなおよい',
          value: false,
          createdAt: DateTime.now().millisecondsSinceEpoch,
          updatedAt: DateTime.now().millisecondsSinceEpoch),
      NeedsChecklistItem(
          id: uuid.v4(),
          col: 'toilet',
          label: 'トイレ',
          description: 'ペットシート、排泄物用ビニール袋、トイレ用の箱など',
          value: false,
          createdAt: DateTime.now().millisecondsSinceEpoch,
          updatedAt: DateTime.now().millisecondsSinceEpoch),
      NeedsChecklistItem(
          id: uuid.v4(),
          col: 'carrier',
          label: 'キャリーバック・ケージ',
          description: '普段使用しているものが望ましい',
          value: false,
          createdAt: DateTime.now().millisecondsSinceEpoch,
          updatedAt: DateTime.now().millisecondsSinceEpoch),
    ]);
  }

  Future<NeedsChecklist> getItems() async {
    final items = database.select(database.checklistItems)
      ..orderBy([(t) => OrderingTerm(expression: t.id)]);
    return NeedsChecklist.fromModel(await items.get());
  }

  Future<NeedsChecklist> createDefaultChecklist() async {
    final rows = getDefaultItems().items.map((item) {
      return ChecklistItemsCompanion.insert(
        id: Value(item.id),
        col: item.col,
        label: item.label,
        description: item.description,
        value: Value(item.value),
        createdAt: item.createdAt,
        updatedAt: item.updatedAt,
      );
    }).toList();

    await database.batch((batch) async {
      batch.insertAll(database.checklistItems, rows);
    });

    return getDefaultItems();
  }

  Future<NeedsChecklistItem> updateItem(NeedsChecklistItem item) async {
    final ret = await (database.update(database.checklistItems)
          ..where((t) => t.id.equals(item.id)))
        .writeReturning(ChecklistItemsCompanion(
      value: Value(item.value),
      updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
    ));
    return NeedsChecklistItem.fromModel(ret.single);
  }
}
