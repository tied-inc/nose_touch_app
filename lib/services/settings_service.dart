import 'package:nose_touch/infra/database.dart';

class SettingsService {
  final AppDatabase database;

  SettingsService(this.database);

  Future<void> reset() async {
    await database.deleteEverything();
  }
}
