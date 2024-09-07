import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:nose_touch/backend/models/dto/checklist_item.dart';
import 'package:nose_touch/backend/models/dto/pet.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

part 'database.g.dart';

@UseRowClass(ChecklistItem)
class ChecklistItems extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();

  TextColumn get col => text().withLength(min: 1, max: 50)();

  TextColumn get label => text().withLength(min: 1, max: 50)();

  TextColumn get description => text().withLength(min: 1, max: 100)();

  BoolColumn get value => boolean().withDefault(const Constant(false))();

  IntColumn get createdAt => integer()();

  IntColumn get updatedAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

@UseRowClass(Pet)
class Pets extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();

  TextColumn get name =>
      text().withLength(max: 50).withDefault(const Constant(''))();

  TextColumn get species =>
      text().withLength(max: 50).withDefault(const Constant(''))();

  TextColumn get breed =>
      text().withLength(max: 50).withDefault(const Constant(''))();

  TextColumn get color =>
      text().withLength(max: 50).withDefault(const Constant(''))();

  TextColumn get microchipNumber =>
      text().withLength(max: 100).withDefault(const Constant(''))();

  TextColumn get dogRegistrationNumber =>
      text().withLength(max: 100).withDefault(const Constant(''))();

  TextColumn get weight =>
      text().withLength(max: 50).withDefault(const Constant(''))();

  TextColumn get characteristics =>
      text().withLength(max: 100).withDefault(const Constant(''))();

  TextColumn get temper =>
      text().withLength(max: 100).withDefault(const Constant(''))();

  TextColumn get medicalHistory =>
      text().withLength(max: 200).withDefault(const Constant(''))();

  TextColumn get medicalCondition =>
      text().withLength(max: 200).withDefault(const Constant(''))();

  TextColumn get hospitalName =>
      text().withLength(max: 100).withDefault(const Constant(''))();

  TextColumn get hospitalPhoneNumber =>
      text().withLength(max: 50).withDefault(const Constant(''))();

  IntColumn get createdAt => integer()();

  IntColumn get updatedAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

@UseRowClass(Vaccination)
class Vaccinations extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();

  TextColumn get petId => text().references(Pets, #id)();

  TextColumn get vaccinationName =>
      text().withLength(max: 50).withDefault(const Constant(''))();

  TextColumn get vaccinationDate =>
      text().withLength(max: 50).withDefault(const Constant(''))();

  IntColumn get createdAt => integer()();

  IntColumn get updatedAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [
  ChecklistItems,
  Pets,
  Vaccinations,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<void> deleteEverything() {
    return transaction(() async {
      for (final table in allTables) {
        await delete(table).go();
      }
    });
  }

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (migrator) async {
          migrator.createAll();
        },
      );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
