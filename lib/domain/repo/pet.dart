import 'dart:async';

import 'package:nose_touch/domain/entities/pet_info.dart';

abstract class IPetRepo {
  Future<PetInfo?> getPetInfo();
  Future<void> updatePet(PetInfo petInfo);
}
