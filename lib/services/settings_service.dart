import 'package:nose_touch/infra/database.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SettingsService {
  final AppDatabase database;

  SettingsService(this.database);

  Future<String> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  Future<void> reset() async {
    await database.deleteEverything();
  }
}
