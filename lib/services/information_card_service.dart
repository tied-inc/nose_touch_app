import 'package:nose_touch/domain/repo/pet.dart';
import 'package:nose_touch/presentations/information_card/schema.dart';

class InformationCardService {
  final IPetRepo petRepo;

  InformationCardService(this.petRepo);

  Future<BasicInfoSchema> getBasicInfo() async {
    final ret = await petRepo.getPetBasicInfo();

    if (ret == null) {
      final data = petRepo.getDefaultPetInfo();
      return BasicInfoSchema.fromEntity(data);
    }
    return BasicInfoSchema.fromEntity(ret);
  }

  Future<BasicInfoSchema> upsertBasicInfo(BasicInfoSchema data) async {
    await petRepo.upsertPetBasicInfo(data.toEntity());

    final newItem = await petRepo.getPetBasicInfo();
    if (newItem == null) {
      throw Exception('Failed to get pet info');
    }
    return BasicInfoSchema.fromEntity(newItem);
  }
}
