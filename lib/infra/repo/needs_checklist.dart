import 'package:pet_safety/domain/entities/needs_checklist.dart';
import 'package:pet_safety/domain/repo/needs_checklist.dart';
import 'package:pet_safety/infra/dto/needs_checklist_item.dart';

class NeedsChecklistRepoImpl extends NeedsChecklistRepo {
  NeedsChecklistRepoImpl(super.db);

  void createTable() async {
    final stmt = NeedsChecklistItem.createTableStmt();
    await db.execute(stmt);
  }

  Future<NeedsChecklistEntity> getNeedsChecklist() async {
    final items = await db.query('needs_checklist_items');
    final data = NeedsChecklistEntity(
        data: items
            .map((item) => NeedsChecklistItemEntity.fromMap(item))
            .toList());
    return NeedsChecklistEntity(data: [
      NeedsChecklistItemEntity(
        label: 'food',
        title: '食べ物',
        subtitle: '最低５日分できれば７日分',
        value: false,
      ),
      NeedsChecklistItemEntity(
        label: 'water',
        title: '水',
        subtitle: '最低５日分できれば７日分',
        value: false,
      ),
      NeedsChecklistItemEntity(
        label: 'medicine',
        title: '常備薬・療法食',
        subtitle: '医師の指示があるものをお使いください',
        value: false,
      ),
      NeedsChecklistItemEntity(
        label: 'tableware',
        title: '食器',
        subtitle: 'ラップなどあると尚よし',
        value: false,
      ),
      NeedsChecklistItemEntity(
        label: 'toiletries',
        title: 'トイレ用品',
        subtitle: 'ペットシーツ、排泄物用ビニール、トイレ用の箱など',
        value: false,
      ),
      NeedsChecklistItemEntity(
        label: 'carryBugOrCage',
        title: '避難用バッグ・ケージ',
        subtitle: 'ペットの大きさに合ったもの',
        value: false,
      ),
      NeedsChecklistItemEntity(
        label: 'collarAndLeashOrHarness',
        title: '首輪・リード・ハーネス',
        subtitle: '伸びないものが好ましい',
        value: false,
      ),
      NeedsChecklistItemEntity(
        label: 'laundryNet',
        title: '洗濯ネット',
        subtitle: '猫のみ。避難先でのストレス軽減のため',
        value: false,
      ),
      NeedsChecklistItemEntity(
        label: 'towelOrBlanket',
        title: 'タオル・毛布',
        subtitle: '避難先でのストレス軽減のため',
        value: false,
      )
    ]);
  }
}
