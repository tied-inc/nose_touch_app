import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nose_touch/infra/database.dart';
import 'package:nose_touch/presentations/settings/main.dart';
import 'package:nose_touch/services/settings_service.dart';

import 'information_card/main.dart';
import 'needs_checklist/main.dart';

class MyHomePage extends HookWidget {
  final AppDatabase database;

  const MyHomePage({super.key, required this.database});

  static const _title = ['情報カード', 'チェックリスト', '設定'];

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState(0);
    final settingsService = SettingsService(database);

    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text(_title.elementAt(selectedIndex.value)),
          ),
          body: [
            InformationCardView(database: database),
            NeedsChecklistView(database: database),
            SettingsView(
              settingsService: settingsService,
            ),
          ].elementAt(selectedIndex.value),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.info),
                label: "情報カード",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.checklist),
                label: 'チェックリスト',
              ),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: '設定'),
            ],
            currentIndex: selectedIndex.value,
            selectedItemColor: Colors.amber[800],
            onTap: (index) {
              selectedIndex.value = index;
            },
          ),
        ));
  }
}
