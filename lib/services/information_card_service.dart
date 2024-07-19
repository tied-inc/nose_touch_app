import 'package:pet_safety/domain/entities/pet_info.dart';
import 'package:pet_safety/infra/repo/pet.dart';
import 'package:pet_safety/presentations/information_card/schema.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'information_card_service.g.dart';

@riverpod
class InformationCardService extends _$InformationCardService {
  @override
  Future<InformationCardSchema> build() async {
    return await show();
  }

  Future<InformationCardSchema> show() async {
    final notifier = ref.read(petRepoProvider.notifier);

    final ret = await notifier.getPetInfo();
    if (ret == null) {
      final data = notifier.getDefaultPetInfo();
      return InformationCardSchema.fromEntity(data);
    }
    return InformationCardSchema.fromEntity(ret);
  }
}
