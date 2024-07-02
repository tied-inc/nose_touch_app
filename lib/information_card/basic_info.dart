import 'package:flutter/material.dart';

class BasicInfo extends StatefulWidget {
  const BasicInfo({super.key});

  @override
  State<BasicInfo> createState() => _BasicInfoState();
}

class _BasicInfoState extends State<BasicInfo> {
  final data = [
    {'name': 'ベル'},
    {'gender': 'メス・避妊済'},
    {'species': 'ラガマフィン'},
    {'coatColor': 'ブラウンタビーアンドホワイト'},
    {'microchipNumber': 'XXXXX'},
    {'dogLicenseNumber': 'XXXXX'},
    {'weight': '4.2kg'},
    {'characteristics': '鼻の近くにそばかす'},
    {'temper': '人懐っこいが臆病'},
  ];

  final Map<String, String> titleMap = {
    'name': '名前',
    'gender': '性別',
    'species': '種類',
    'coatColor': '毛色',
    'microchipNumber': 'マイクロチップ番号',
    'dogLicenseNumber': '犬の登録番号',
    'weight': '体重',
    'characteristics': '特徴',
    'temper': '性格',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final key = data[index].keys.first;
              final value = data[index].values.first;

              return ListTile(
                title: Text(titleMap[key]!),
                trailing: Text(value),
              );
            },
            itemCount: data.length));
  }
}
