import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:path/path.dart';
import 'package:pet_safety/models/needs_checklist_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'needs_checklist_service.g.dart';

@riverpod
class NeedsChecklistService extends _$NeedsChecklistService {
  @override
  Future<List<NeedsChecklistItem>> build() async {
    // TODO
    // - add insert checklist item data at first opening moment

    return await getNeedsChecklistItems();
  }

  Future<Database> get database async {
    return await _initDatabase();
  }

  Future<Database> _initDatabase() async {
    final String p;
    if (kDebugMode) {
      const baseRoot = ".";
      p = join(baseRoot, 'pet_safety.db');
    } else {
      final baseRoot = await getDatabasesPath();
      p = join(baseRoot, 'pet_safety.db');
    }

    // Open the database and store the reference.
    final database = openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      p,
      onOpen: (db) {
        // Run the CREATE TABLE statement on the database.
        // db.execute(
        //   "CREATE TABLE needs_checklist_items(id INTEGER PRIMARY KEY, col TEXT, label TEXT, value BOOL, created_at INTEGER, updated_at INTEGER)",
        // );
        return _onCreate(db);
      },
      version: 1,
    );
    return database;
  }

  Future<void> _onCreate(Database database) async {
    // Run the CREATE TABLE statement on the database.
    await database.execute(
      """
CREATE TABLE IF NOT EXISTS needs_checklist_items (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  col TEXT NOT NULL,
  label TEXT NOT NULL,
  description TEXT NOT NULL,
  value BOOL NOT NULL,
  created_at INTEGER NOT NULL,
  updated_at INTEGER NOT NULL
);
""",
    );

    final ret = await database.query('needs_checklist_items');
    if (ret.length == 0) {
      await database.transaction((txn) async {
        for (var item in NeedsChecklistItem.defaultItems) {
          await txn.insert(
            'needs_checklist_items',
            {
              'id': item.id,
              'col': item.col,
              'label': item.label,
              'description': item.description,
              'value': item.value ? 1 : 0,
              'created_at': item.createdAt,
              'updated_at': item.updatedAt,
            },
          );
        }
      });
    }
  }

  Future<List<NeedsChecklistItem>> getNeedsChecklistItems() async {
    final db = await database;
    final List<Map<String, dynamic>> records =
        await db.query('needs_checklist_items');

    List<NeedsChecklistItem> data = [];
    for (var item in records) {
      data.add(NeedsChecklistItem(
        id: item['id'],
        col: item['col'],
        label: item['label'],
        description: item['description'],
        value: item['value'] == 1 ? true : false,
        createdAt: item['created_at'],
        updatedAt: item['updated_at'],
      ));
    }
    return data;
  }

  Future<NeedsChecklistItem> updateNeedsChecklistItem(
      NeedsChecklistItem item) async {
    final db = await database;
    await db.update(
      'needs_checklist_items',
      {
        'value': item.value ? 1 : 0,
        'updated_at': DateTime.now().millisecondsSinceEpoch,
      },
      where: 'id = ?',
      whereArgs: [item.id],
    );
    return item;
  }
}
