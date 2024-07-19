import 'dart:async';

import 'package:pet_safety/domain/entities/pet_info.dart';

abstract class IPetRepo {
  Future<PetInfo?> getPetInfo();
  Future<void> updatePet(PetInfo petInfo);
}
