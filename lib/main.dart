import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nose_touch/infra/database.dart';

import 'presentations/home.dart';

void main() {
// Avoid errors caused by flutter upgrade.
// Importing 'package:flutter/widgets.dart' is required.
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends HookWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final database = AppDatabase();

    return MaterialApp(
      title: 'ノーズタッチ',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: MyHomePage(database: database),
    );
  }
}
