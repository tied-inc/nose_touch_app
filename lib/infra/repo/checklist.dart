import 'package:drift/drift.dart';
import 'package:nose_touch/domain/entities/needs_checklist.dart';
import 'package:nose_touch/domain/repo/checklist.dart';
import 'package:nose_touch/infra/database.dart';

class ChecklistRepo implements IChecklistRepo {
  final AppDatabase database;

  ChecklistRepo(this.database);

  @override
  NeedsChecklist getDefaultItems() {
    return NeedsChecklist(items: [
      NeedsChecklistItem(
          id: 1,
          col: 'food',
          label: 'フード',
          description: '最低5日分、できれば7日分',
          value: false,
          createdAt: DateTime.now().millisecondsSinceEpoch,
          updatedAt: DateTime.now().millisecondsSinceEpoch),
      NeedsChecklistItem(
          id: 2,
          col: 'water',
          label: '水',
          description: '最低5日分、できれば7日分',
          value: false,
          createdAt: DateTime.now().millisecondsSinceEpoch,
          updatedAt: DateTime.now().millisecondsSinceEpoch),
      NeedsChecklistItem(
          id: 3,
          col: 'medication',
          label: '常備薬・療養食',
          description: '普段使用しているもの',
          value: false,
          createdAt: DateTime.now().millisecondsSinceEpoch,
          updatedAt: DateTime.now().millisecondsSinceEpoch),
      NeedsChecklistItem(
          id: 4,
          col: 'tableware',
          label: '食器',
          description: 'ラップなどあるとなおよい',
          value: false,
          createdAt: DateTime.now().millisecondsSinceEpoch,
          updatedAt: DateTime.now().millisecondsSinceEpoch),
      NeedsChecklistItem(
          id: 5,
          col: 'toilet',
          label: 'トイレ',
          description: 'ペットシート、排泄物用ビニール袋、トイレ用の箱など',
          value: false,
          createdAt: DateTime.now().millisecondsSinceEpoch,
          updatedAt: DateTime.now().millisecondsSinceEpoch),
      NeedsChecklistItem(
          id: 6,
          col: 'carrier',
          label: 'キャリーバック・ケージ',
          description: '普段使用しているものが望ましい',
          value: false,
          createdAt: DateTime.now().millisecondsSinceEpoch,
          updatedAt: DateTime.now().millisecondsSinceEpoch),
      NeedsChecklistItem(
          id: 7,
          col: 'leash',
          label: 'リード・ハーネス',
          description: '伸びないものが好ましい',
          value: false,
          createdAt: DateTime.now().millisecondsSinceEpoch,
          updatedAt: DateTime.now().millisecondsSinceEpoch),
      NeedsChecklistItem(
          id: 8,
          col: 'laundryNet',
          label: '洗濯ネット',
          description: '猫のみ。爪切りなどに使う',
          value: false,
          createdAt: DateTime.now().millisecondsSinceEpoch,
          updatedAt: DateTime.now().millisecondsSinceEpoch),
      NeedsChecklistItem(
          id: 9,
          col: 'towelOrBlanket',
          label: 'タオル・毛布',
          description: '寒さや雨対策',
          value: false,
          createdAt: DateTime.now().millisecondsSinceEpoch,
          updatedAt: DateTime.now().millisecondsSinceEpoch),
    ]);
  }

  @override
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

    database.batch((batch) async {
      batch.insertAll(database.checklistItems, rows);
    });

    return getDefaultItems();
  }

  @override
  Future<NeedsChecklist> getItems() async {
    final items = database.select(database.checklistItems)
      ..orderBy([(t) => OrderingTerm(expression: t.id)]);
    return NeedsChecklist.fromModel(await items.get());
  }

  @override
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
