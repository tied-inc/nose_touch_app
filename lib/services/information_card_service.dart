import 'package:nose_touch/infra/repo/pet.dart';
import 'package:nose_touch/presentations/information_card/schema.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'information_card_service.g.dart';

@riverpod
class InformationCardService extends _$InformationCardService {
  @override
  Future<BasicInfoSchema> build() async {
    final notifier = ref.read(petRepoProvider.notifier);

    final ret = await notifier.getPetBasicInfo();
    if (ret == null) {
      final data = notifier.getDefaultPetInfo();
      return BasicInfoSchema.fromEntity(data);
    }
    return BasicInfoSchema.fromEntity(ret);
  }

  Future<BasicInfoSchema> upsertBasicInfo(BasicInfoSchema data) async {
    final notifier = ref.read(petRepoProvider.notifier);
    await notifier.upsertPetBasicInfo(data.toEntity());
    print('called');

    final newItem = await notifier.getPetBasicInfo();
    if (newItem == null) {
      throw Exception('Failed to get pet info');
    }
    return BasicInfoSchema.fromEntity(newItem);
  }
}
