import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nose_touch/backend/main.dart';
import 'package:nose_touch/presentations/settings/main.dart';

import 'information_card/main.dart';
import 'needs_checklist/main.dart';

class MyHomePage extends HookWidget {
  final BackendApp backendApp;

  const MyHomePage({super.key, required this.backendApp});

  static const petId = 'testId';

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState(0);
    const title = ['情報カード', 'チェックリスト', '設定'];

    return DefaultTabController(
        length: title.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text(title.elementAt(selectedIndex.value)),
          ),
          body: [
            InformationCardView(petId: petId, backendApp: backendApp),
            NeedsChecklistView(backendApp: backendApp),
            SettingsView(
              backendApp: backendApp,
            ),
          ].elementAt(selectedIndex.value),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.info),
                label: '情報カード',
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
