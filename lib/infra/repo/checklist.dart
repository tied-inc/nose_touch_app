import 'package:drift/drift.dart';
import 'package:pet_safety/domain/entities/needs_checklist.dart';
import 'package:pet_safety/domain/repo/checklist.dart';
import 'package:pet_safety/infra/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'checklist.g.dart';

@riverpod
class ChecklistRepo extends _$ChecklistRepo implements IChecklistRepo {
  @override
  Future<NeedsChecklist> build() async {
    final records = await getItems();
    if (records.items.isEmpty) {
      return await createDefaultChecklist();
    }
    return records;
  }

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
    final database = ref.read(databaseProvider);

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
  Future<NeedsChecklist> getItems() {
    final database = ref.read(databaseProvider);

    return (database.select(database.checklistItems)
          ..orderBy([(t) => OrderingTerm(expression: t.id)]))
        .get()
        .then((items) => NeedsChecklist.fromModel(items));
  }

  @override
  Future<void> updateItem(NeedsChecklistItem item) async {
    final database = ref.read(databaseProvider);

    await (database.update(database.checklistItems)
          ..where((t) => t.id.equals(item.id)))
        .write(ChecklistItemsCompanion(
      value: Value(item.value),
      updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
    ));
  }
}
