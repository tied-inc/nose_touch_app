import 'package:flutter/material.dart';

class Health extends StatefulWidget {
  const Health({super.key});

  @override
  State<Health> createState() => _HealthState();
}

class _HealthState extends State<Health> {
  final data = [
    {'when': '2024-01-01'},
    {'what': "3種混合ワクチン"},
    {'rabiesVaccination': 'テスト病院'},
    {'parasitePrevention': '1234-5678-9012'},
  ];
  final Map<String, String> titleMap = {
    'when': '接種日',
    'what': '種類',
    'rabiesVaccination': '狂犬病予防接種',
    'parasitePrevention': '寄生虫予防',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final key = data[index].keys.first;
              final value = data[index].values.first;
              if (key == 'divider') {
                return const Divider();
              }

              return ListTile(
                title: Text(titleMap[key]!),
                trailing: Text(value),
              );
            },
            itemCount: data.length));
  }
}
