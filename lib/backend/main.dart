import 'package:nose_touch/backend/controllers/checklist.dart';
import 'package:nose_touch/backend/controllers/db.dart';
import 'package:nose_touch/backend/controllers/pets.dart';
import 'package:nose_touch/backend/models/database.dart';

class BackendApp {
  final AppDatabase database;

  final ChecklistController checklistController;
  final PetController petController;
  final DbController dbController;

  BackendApp(this.database)
      : checklistController = ChecklistController(database),
        petController = PetController(database),
        dbController = DbController(database);
}
