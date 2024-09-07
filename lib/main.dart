import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nose_touch/backend/main.dart';
import 'package:nose_touch/backend/models/database.dart';

import 'presentations/home.dart';

void main() {
// Avoid errors caused by flutter upgrade.
// Importing 'package:flutter/widgets.dart' is required.
  WidgetsFlutterBinding.ensureInitialized();

  final database = AppDatabase();

  runApp(MyApp(
    database: database,
  ));
}

class MyApp extends HookWidget {
  final AppDatabase database;

  const MyApp({super.key, required this.database});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final backendApp = BackendApp(database);

    return MaterialApp(
      title: 'ノーズタッチ',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: MyHomePage(backendApp: backendApp),
    );
  }
}
