import 'package:flutter/material.dart';

class NeedsChecklist extends StatefulWidget {
  const NeedsChecklist({super.key});

  @override
  State<NeedsChecklist> createState() => _NeedsChecklistState();
}

class CheckListContent {
  final String title;
  final String subtitle;

  CheckListContent(this.title, this.subtitle);
}

class _NeedsChecklistState extends State<NeedsChecklist> {
  final data = [
    {"food": false},
    {"water": false},
    {"medicine": false},
    {"tableware": false},
    {"toiletries": false},
    {"carryBugOrCage": false},
    {"collarAndLeashOrHarness": false},
    {"laundryNet": false},
    {"towelOrBlanket": false}
  ];

  final Map<String, CheckListContent> titleMap = {
    "food": CheckListContent('食べ物', '最低５日分できれば７日分'),
    "water": CheckListContent('水', '最低５日分できれば７日分'),
    "medicine": CheckListContent('常備薬・療法食', '医師の指示があるものをお使いください'),
    "tableware": CheckListContent('食器', 'ラップなどあると尚よし'),
    'toiletries': CheckListContent('トイレ用品', 'ペットシーツ、排泄物用ビニール、トイレ用の箱など'),
    "carryBugOrCage": CheckListContent('避難用バッグ・ケージ', 'ペットの大きさに合ったもの'),
    'collarAndLeashOrHarness': CheckListContent('首輪・リード・ハーネス', '伸びないものが好ましい'),
    "laundryNet": CheckListContent('洗濯ネット', '猫のみ。避難先でのストレス軽減のため'),
    "towelOrBlanket": CheckListContent('タオル・毛布', '避難先でのストレス軽減のため'),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        for (var item in data)
          CheckboxListTile(
            title: Text(titleMap[item.keys.first]!.title),
            subtitle: Text(titleMap[item.keys.first]!.subtitle),
            value: item.values.first,
            onChanged: (bool? value) {
              setState(() {
                item[titleMap.keys.first] = value!;
              });
            },
          )
      ],
    ));
  }
}
