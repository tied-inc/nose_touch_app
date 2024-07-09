import 'package:path/path.dart';
import 'package:pet_safety/models/needs_checklist_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'needs_checklist_service.g.dart';

@riverpod
class NeedsChecklistService extends _$NeedsChecklistService {
  @override
  Future<List<NeedsChecklistItem>> build() {
    return getNeedsChecklistItems();
  }

  Future<Database> get database async {
    return await _initDatabase();
  }

  Future<Database> _initDatabase() async {
    // final baseRoot = await getDatabasesPath();
    const baseRoot = "/Users/hayata.yamamoto/work/pet_safety";
    final p = join(baseRoot, 'pet_safety.db');
    print(p);

    // Open the database and store the reference.
    final database = openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      p,
      onCreate: (db, version) {
        return _onCreate(db);
      },
      version: 1,
    );

    _onCreate(await database);
    return database;
  }

  Future<void> _onCreate(Database database) {
    // Run the CREATE TABLE statement on the database.
    return database.execute(
      """
CREATE TABLE IF NOT EXISTS needs_checklist_items (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  column TEXT NOT NULL,
  value INTEGER NOT NULL,
  created_at INTEGER NOT NULL,
  updated_at INTEGER NOT NULL
);
""",
    );
  }

  Future<List<NeedsChecklistItem>> getNeedsChecklistItems() async {
    final db = await database;
    final List<Map<String, dynamic>> maps =
        await db.query('needs_checklist_items');

    return List.generate(maps.length, (i) {
      return NeedsChecklistItem(
        id: maps[i]['id'],
        column: NeedsChecklistColumn.values
            .firstWhere((e) => e.toString() == maps[i]['column']),
        value: maps[i]['value'] == 1,
        createdAt: maps[i]['created_at'],
        updatedAt: maps[i]['updated_at'],
      );
    });
  }
}
