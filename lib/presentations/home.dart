import 'package:flutter/material.dart';
import 'package:nose_touch/infra/database.dart';
import 'package:nose_touch/presentations/settings/main.dart';
import 'package:nose_touch/services/settings_service.dart';

import 'information_card/main.dart';
import 'needs_checklist/main.dart';

class MyHomePage extends StatefulWidget {
  final AppDatabase database;

  const MyHomePage({super.key, required this.database});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const _title = ['情報カード', 'チェックリスト', '設定'];

  _MyHomePageState();

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final settingsService = SettingsService(widget.database);

    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text(_title.elementAt(_selectedIndex)),
          ),
          body: [
            const InformationCardView(),
            const NeedsChecklistView(),
            SettingsView(
              settingsService: settingsService,
            ),
          ].elementAt(_selectedIndex),
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
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped,
          ),
        ));
  }
}
