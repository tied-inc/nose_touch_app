import 'package:flutter/material.dart';

class NeedsChecklist extends StatefulWidget {
  const NeedsChecklist({super.key});

  @override
  State<NeedsChecklist> createState() => _NeedsChecklistState();
}

class CheckListContent {
  final String title;
  final String subtitle;
  bool value;

  CheckListContent(this.title, this.subtitle, this.value);
}

class _NeedsChecklistState extends State<NeedsChecklist> {
  final Map<String, CheckListContent> data = {
    "food": CheckListContent('食べ物', '最低５日分できれば７日分', false),
    "water": CheckListContent('水', '最低５日分できれば７日分', false),
    "medicine": CheckListContent('常備薬・療法食', '医師の指示があるものをお使いください', false),
    "tableware": CheckListContent('食器', 'ラップなどあると尚よし', false),
    'toiletries': CheckListContent('トイレ用品', 'ペットシーツ、排泄物用ビニール、トイレ用の箱など', false),
    "carryBugOrCage": CheckListContent('避難用バッグ・ケージ', 'ペットの大きさに合ったもの', false),
    'collarAndLeashOrHarness':
        CheckListContent('首輪・リード・ハーネス', '伸びないものが好ましい', false),
    "laundryNet": CheckListContent('洗濯ネット', '猫のみ。避難先でのストレス軽減のため', false),
    "towelOrBlanket": CheckListContent('タオル・毛布', '避難先でのストレス軽減のため', false),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        for (var key in data.keys)
          CheckboxListTile(
            value: data[key]!.value,
            onChanged: (bool? value) {
              setState(() {
                data[key]!.value = value!;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            title: Text(data[key]!.title),
            subtitle: Text(data[key]!.subtitle),
          ),
      ],
    ));
  }
}
