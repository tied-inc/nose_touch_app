import 'package:pet_safety/domain/entities/pet_info.dart';

enum ListVariant {
  basic,
  expanded,
}

class BasicListTileSchema {
  final String col;
  final String title;
  String trailing;
  final ListVariant variant;

  BasicListTileSchema({
    required this.col,
    required this.title,
    required this.trailing,
    this.variant = ListVariant.basic,
  });
}

class InformationCardSchema {
  List<BasicListTileSchema> rows;

  InformationCardSchema({
    required this.rows,
  });

  factory InformationCardSchema.fromEntity(PetInfo petInfo) {
    final titleMap = PetInfo.getTitleMap();

    return InformationCardSchema(
      rows: [
        BasicListTileSchema(
          col: 'name',
          title: titleMap['name']!,
          trailing: petInfo.basicInfo.name,
        ),
        BasicListTileSchema(
          col: 'breed',
          title: titleMap['breed']!,
          trailing: petInfo.basicInfo.breed,
        ),
        BasicListTileSchema(
          col: 'species',
          title: titleMap['species']!,
          trailing: petInfo.basicInfo.species,
        ),
        BasicListTileSchema(
          col: 'color',
          title: titleMap['color']!,
          trailing: petInfo.basicInfo.color,
        ),
        BasicListTileSchema(
          col: 'microchipNumber',
          title: titleMap['microchipNumber']!,
          trailing: petInfo.basicInfo.microchipNumber,
        ),
        BasicListTileSchema(
          col: 'dogRegistrationNumber',
          title: titleMap['dogRegistrationNumber']!,
          trailing: petInfo.basicInfo.dogRegistrationNumber,
        ),
        BasicListTileSchema(
          col: 'weight',
          title: titleMap['weight']!,
          trailing: petInfo.basicInfo.weight,
        ),
        BasicListTileSchema(
          col: 'characteristics',
          title: titleMap['characteristics']!,
          trailing: petInfo.basicInfo.characteristics,
        ),
        BasicListTileSchema(
          col: 'temper',
          title: titleMap['temper']!,
          trailing: petInfo.basicInfo.temper,
        ),
        BasicListTileSchema(
          col: 'medicalHistory',
          title: titleMap['medicalHistory']!,
          trailing: petInfo.hospitalInfo.medicalHistory,
        ),
        BasicListTileSchema(
          col: 'medicalCondition',
          title: titleMap['medicalCondition']!,
          trailing: petInfo.hospitalInfo.medicalCondition,
        ),
        BasicListTileSchema(
          col: 'hospitalName',
          title: titleMap['hospitalName']!,
          trailing: petInfo.hospitalInfo.hospitalName,
        ),
        BasicListTileSchema(
          col: 'hospitalPhoneNumber',
          title: titleMap['hospitalPhoneNumber']!,
          trailing: petInfo.hospitalInfo.hospitalPhoneNumber,
        ),
      ],
    );
  }
}
