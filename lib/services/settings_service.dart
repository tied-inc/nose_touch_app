import 'package:nose_touch/infra/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_service.g.dart';

@riverpod
class SettingsService extends _$SettingsService {
  @override
  Future<void> build() async {}

  Future<void> reset() async {
    final database = ref.read(databaseProvider);
    await database.deleteEverything();
  }
}
