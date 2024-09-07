import 'package:nose_touch/backend/models/database.dart';

class DbController {
  final AppDatabase database;

  DbController(this.database);

  Future<void> delete() async {
    await database.deleteEverything();
  }
}
