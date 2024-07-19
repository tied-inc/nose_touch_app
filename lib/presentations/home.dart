import 'package:flutter/material.dart';

import 'information_card/main.dart';
import 'needs_checklist/main.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const _title = ['情報カード', 'チェックリスト'];

  _MyHomePageState();

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(_title.elementAt(_selectedIndex)),
          ),
          body: [
            const InformationCardView(),
            const NeedsChecklistView(),
          ].elementAt(_selectedIndex),
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
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped,
          ),
          drawer: _selectedIndex == 0
              ? Drawer(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      const SizedBox(
                          height: 120,
                          child: DrawerHeader(
                            child: Text('ペット'),
                          )),
                      ListTile(
                        title: const Text('ベル'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: const Text('ジル'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                )
              : null,
        ));
  }
}
