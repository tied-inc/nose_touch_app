import 'dart:async';

import 'package:nose_touch/domain/entities/pet_info.dart';

abstract class IPetRepo {
  Future<PetBasicInfo?> getPetBasicInfo();
  Future<void> upsertPetBasicInfo(PetBasicInfo petInfo);
}
