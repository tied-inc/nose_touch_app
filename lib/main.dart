import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:pet_safety/domain/repo/needs_checklist.dart';
import 'package:sqflite/sqflite.dart';

import 'presentation/information_card/main.dart';
import 'presentation/needs_checklist/main.dart';

void main() async {
// Avoid errors caused by flutter upgrade.
// Importing 'package:flutter/widgets.dart' is required.
  WidgetsFlutterBinding.ensureInitialized();
// Open the database and store the reference.
  final database = await openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), 'doggie_database.db'),
      onCreate: (db, version) {
    NeedsChecklistRepo(db).createTable();
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Safety App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final NeedsChecklistRepo repo;
  final _title = ['情報カード', 'チェックリスト'];

  _MyHomePageState(this.repo);

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> get _options => [
        const InformationCard(),
        NeedsChecklist(repo: repo),
      ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(_title.elementAt(_selectedIndex)),
          ),
          body: _options.elementAt(_selectedIndex),
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
        ));
  }
}
