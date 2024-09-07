// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ChecklistItemsTable extends ChecklistItems
    with TableInfo<$ChecklistItemsTable, ChecklistItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChecklistItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => const Uuid().v4());
  static const VerificationMeta _colMeta = const VerificationMeta('col');
  @override
  late final GeneratedColumn<String> col = GeneratedColumn<String>(
      'col', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
      'label', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<bool> value = GeneratedColumn<bool>(
      'value', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("value" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
      'created_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, col, label, description, value, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'checklist_items';
  @override
  VerificationContext validateIntegrity(Insertable<ChecklistItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('col')) {
      context.handle(
          _colMeta, col.isAcceptableOrUnknown(data['col']!, _colMeta));
    } else if (isInserting) {
      context.missing(_colMeta);
    }
    if (data.containsKey('label')) {
      context.handle(
          _labelMeta, label.isAcceptableOrUnknown(data['label']!, _labelMeta));
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChecklistItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChecklistItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      col: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}col'])!,
      label: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}label'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}value'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $ChecklistItemsTable createAlias(String alias) {
    return $ChecklistItemsTable(attachedDatabase, alias);
  }
}

class ChecklistItemsCompanion extends UpdateCompanion<ChecklistItem> {
  final Value<String> id;
  final Value<String> col;
  final Value<String> label;
  final Value<String> description;
  final Value<bool> value;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int> rowid;
  const ChecklistItemsCompanion({
    this.id = const Value.absent(),
    this.col = const Value.absent(),
    this.label = const Value.absent(),
    this.description = const Value.absent(),
    this.value = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ChecklistItemsCompanion.insert({
    this.id = const Value.absent(),
    required String col,
    required String label,
    required String description,
    this.value = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.rowid = const Value.absent(),
  })  : col = Value(col),
        label = Value(label),
        description = Value(description),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<ChecklistItem> custom({
    Expression<String>? id,
    Expression<String>? col,
    Expression<String>? label,
    Expression<String>? description,
    Expression<bool>? value,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (col != null) 'col': col,
      if (label != null) 'label': label,
      if (description != null) 'description': description,
      if (value != null) 'value': value,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ChecklistItemsCompanion copyWith(
      {Value<String>? id,
      Value<String>? col,
      Value<String>? label,
      Value<String>? description,
      Value<bool>? value,
      Value<int>? createdAt,
      Value<int>? updatedAt,
      Value<int>? rowid}) {
    return ChecklistItemsCompanion(
      id: id ?? this.id,
      col: col ?? this.col,
      label: label ?? this.label,
      description: description ?? this.description,
      value: value ?? this.value,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (col.present) {
      map['col'] = Variable<String>(col.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (value.present) {
      map['value'] = Variable<bool>(value.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChecklistItemsCompanion(')
          ..write('id: $id, ')
          ..write('col: $col, ')
          ..write('label: $label, ')
          ..write('description: $description, ')
          ..write('value: $value, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PetsTable extends Pets with TableInfo<$PetsTable, Pet> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PetsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => const Uuid().v4());
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _speciesMeta =
      const VerificationMeta('species');
  @override
  late final GeneratedColumn<String> species = GeneratedColumn<String>(
      'species', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _breedMeta = const VerificationMeta('breed');
  @override
  late final GeneratedColumn<String> breed = GeneratedColumn<String>(
      'breed', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
      'color', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _microchipNumberMeta =
      const VerificationMeta('microchipNumber');
  @override
  late final GeneratedColumn<String> microchipNumber = GeneratedColumn<String>(
      'microchip_number', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _dogRegistrationNumberMeta =
      const VerificationMeta('dogRegistrationNumber');
  @override
  late final GeneratedColumn<String> dogRegistrationNumber =
      GeneratedColumn<String>('dog_registration_number', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultValue: const Constant(''));
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<String> weight = GeneratedColumn<String>(
      'weight', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _characteristicsMeta =
      const VerificationMeta('characteristics');
  @override
  late final GeneratedColumn<String> characteristics = GeneratedColumn<String>(
      'characteristics', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _temperMeta = const VerificationMeta('temper');
  @override
  late final GeneratedColumn<String> temper = GeneratedColumn<String>(
      'temper', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _medicalHistoryMeta =
      const VerificationMeta('medicalHistory');
  @override
  late final GeneratedColumn<String> medicalHistory = GeneratedColumn<String>(
      'medical_history', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 200),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _medicalConditionMeta =
      const VerificationMeta('medicalCondition');
  @override
  late final GeneratedColumn<String> medicalCondition = GeneratedColumn<String>(
      'medical_condition', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 200),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _hospitalNameMeta =
      const VerificationMeta('hospitalName');
  @override
  late final GeneratedColumn<String> hospitalName = GeneratedColumn<String>(
      'hospital_name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _hospitalPhoneNumberMeta =
      const VerificationMeta('hospitalPhoneNumber');
  @override
  late final GeneratedColumn<String> hospitalPhoneNumber =
      GeneratedColumn<String>('hospital_phone_number', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultValue: const Constant(''));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
      'created_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        species,
        breed,
        color,
        microchipNumber,
        dogRegistrationNumber,
        weight,
        characteristics,
        temper,
        medicalHistory,
        medicalCondition,
        hospitalName,
        hospitalPhoneNumber,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pets';
  @override
  VerificationContext validateIntegrity(Insertable<Pet> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('species')) {
      context.handle(_speciesMeta,
          species.isAcceptableOrUnknown(data['species']!, _speciesMeta));
    }
    if (data.containsKey('breed')) {
      context.handle(
          _breedMeta, breed.isAcceptableOrUnknown(data['breed']!, _breedMeta));
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    }
    if (data.containsKey('microchip_number')) {
      context.handle(
          _microchipNumberMeta,
          microchipNumber.isAcceptableOrUnknown(
              data['microchip_number']!, _microchipNumberMeta));
    }
    if (data.containsKey('dog_registration_number')) {
      context.handle(
          _dogRegistrationNumberMeta,
          dogRegistrationNumber.isAcceptableOrUnknown(
              data['dog_registration_number']!, _dogRegistrationNumberMeta));
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight']!, _weightMeta));
    }
    if (data.containsKey('characteristics')) {
      context.handle(
          _characteristicsMeta,
          characteristics.isAcceptableOrUnknown(
              data['characteristics']!, _characteristicsMeta));
    }
    if (data.containsKey('temper')) {
      context.handle(_temperMeta,
          temper.isAcceptableOrUnknown(data['temper']!, _temperMeta));
    }
    if (data.containsKey('medical_history')) {
      context.handle(
          _medicalHistoryMeta,
          medicalHistory.isAcceptableOrUnknown(
              data['medical_history']!, _medicalHistoryMeta));
    }
    if (data.containsKey('medical_condition')) {
      context.handle(
          _medicalConditionMeta,
          medicalCondition.isAcceptableOrUnknown(
              data['medical_condition']!, _medicalConditionMeta));
    }
    if (data.containsKey('hospital_name')) {
      context.handle(
          _hospitalNameMeta,
          hospitalName.isAcceptableOrUnknown(
              data['hospital_name']!, _hospitalNameMeta));
    }
    if (data.containsKey('hospital_phone_number')) {
      context.handle(
          _hospitalPhoneNumberMeta,
          hospitalPhoneNumber.isAcceptableOrUnknown(
              data['hospital_phone_number']!, _hospitalPhoneNumberMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Pet map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Pet(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      species: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}species'])!,
      breed: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}breed'])!,
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color'])!,
      microchipNumber: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}microchip_number'])!,
      dogRegistrationNumber: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}dog_registration_number'])!,
      weight: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}weight'])!,
      characteristics: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}characteristics'])!,
      temper: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}temper'])!,
      medicalHistory: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}medical_history'])!,
      medicalCondition: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}medical_condition'])!,
      hospitalName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hospital_name'])!,
      hospitalPhoneNumber: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}hospital_phone_number'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $PetsTable createAlias(String alias) {
    return $PetsTable(attachedDatabase, alias);
  }
}

class PetsCompanion extends UpdateCompanion<Pet> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> species;
  final Value<String> breed;
  final Value<String> color;
  final Value<String> microchipNumber;
  final Value<String> dogRegistrationNumber;
  final Value<String> weight;
  final Value<String> characteristics;
  final Value<String> temper;
  final Value<String> medicalHistory;
  final Value<String> medicalCondition;
  final Value<String> hospitalName;
  final Value<String> hospitalPhoneNumber;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int> rowid;
  const PetsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.species = const Value.absent(),
    this.breed = const Value.absent(),
    this.color = const Value.absent(),
    this.microchipNumber = const Value.absent(),
    this.dogRegistrationNumber = const Value.absent(),
    this.weight = const Value.absent(),
    this.characteristics = const Value.absent(),
    this.temper = const Value.absent(),
    this.medicalHistory = const Value.absent(),
    this.medicalCondition = const Value.absent(),
    this.hospitalName = const Value.absent(),
    this.hospitalPhoneNumber = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PetsCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.species = const Value.absent(),
    this.breed = const Value.absent(),
    this.color = const Value.absent(),
    this.microchipNumber = const Value.absent(),
    this.dogRegistrationNumber = const Value.absent(),
    this.weight = const Value.absent(),
    this.characteristics = const Value.absent(),
    this.temper = const Value.absent(),
    this.medicalHistory = const Value.absent(),
    this.medicalCondition = const Value.absent(),
    this.hospitalName = const Value.absent(),
    this.hospitalPhoneNumber = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.rowid = const Value.absent(),
  })  : createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<Pet> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? species,
    Expression<String>? breed,
    Expression<String>? color,
    Expression<String>? microchipNumber,
    Expression<String>? dogRegistrationNumber,
    Expression<String>? weight,
    Expression<String>? characteristics,
    Expression<String>? temper,
    Expression<String>? medicalHistory,
    Expression<String>? medicalCondition,
    Expression<String>? hospitalName,
    Expression<String>? hospitalPhoneNumber,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (species != null) 'species': species,
      if (breed != null) 'breed': breed,
      if (color != null) 'color': color,
      if (microchipNumber != null) 'microchip_number': microchipNumber,
      if (dogRegistrationNumber != null)
        'dog_registration_number': dogRegistrationNumber,
      if (weight != null) 'weight': weight,
      if (characteristics != null) 'characteristics': characteristics,
      if (temper != null) 'temper': temper,
      if (medicalHistory != null) 'medical_history': medicalHistory,
      if (medicalCondition != null) 'medical_condition': medicalCondition,
      if (hospitalName != null) 'hospital_name': hospitalName,
      if (hospitalPhoneNumber != null)
        'hospital_phone_number': hospitalPhoneNumber,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PetsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? species,
      Value<String>? breed,
      Value<String>? color,
      Value<String>? microchipNumber,
      Value<String>? dogRegistrationNumber,
      Value<String>? weight,
      Value<String>? characteristics,
      Value<String>? temper,
      Value<String>? medicalHistory,
      Value<String>? medicalCondition,
      Value<String>? hospitalName,
      Value<String>? hospitalPhoneNumber,
      Value<int>? createdAt,
      Value<int>? updatedAt,
      Value<int>? rowid}) {
    return PetsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      species: species ?? this.species,
      breed: breed ?? this.breed,
      color: color ?? this.color,
      microchipNumber: microchipNumber ?? this.microchipNumber,
      dogRegistrationNumber:
          dogRegistrationNumber ?? this.dogRegistrationNumber,
      weight: weight ?? this.weight,
      characteristics: characteristics ?? this.characteristics,
      temper: temper ?? this.temper,
      medicalHistory: medicalHistory ?? this.medicalHistory,
      medicalCondition: medicalCondition ?? this.medicalCondition,
      hospitalName: hospitalName ?? this.hospitalName,
      hospitalPhoneNumber: hospitalPhoneNumber ?? this.hospitalPhoneNumber,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (species.present) {
      map['species'] = Variable<String>(species.value);
    }
    if (breed.present) {
      map['breed'] = Variable<String>(breed.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (microchipNumber.present) {
      map['microchip_number'] = Variable<String>(microchipNumber.value);
    }
    if (dogRegistrationNumber.present) {
      map['dog_registration_number'] =
          Variable<String>(dogRegistrationNumber.value);
    }
    if (weight.present) {
      map['weight'] = Variable<String>(weight.value);
    }
    if (characteristics.present) {
      map['characteristics'] = Variable<String>(characteristics.value);
    }
    if (temper.present) {
      map['temper'] = Variable<String>(temper.value);
    }
    if (medicalHistory.present) {
      map['medical_history'] = Variable<String>(medicalHistory.value);
    }
    if (medicalCondition.present) {
      map['medical_condition'] = Variable<String>(medicalCondition.value);
    }
    if (hospitalName.present) {
      map['hospital_name'] = Variable<String>(hospitalName.value);
    }
    if (hospitalPhoneNumber.present) {
      map['hospital_phone_number'] =
          Variable<String>(hospitalPhoneNumber.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PetsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('species: $species, ')
          ..write('breed: $breed, ')
          ..write('color: $color, ')
          ..write('microchipNumber: $microchipNumber, ')
          ..write('dogRegistrationNumber: $dogRegistrationNumber, ')
          ..write('weight: $weight, ')
          ..write('characteristics: $characteristics, ')
          ..write('temper: $temper, ')
          ..write('medicalHistory: $medicalHistory, ')
          ..write('medicalCondition: $medicalCondition, ')
          ..write('hospitalName: $hospitalName, ')
          ..write('hospitalPhoneNumber: $hospitalPhoneNumber, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $VaccinationsTable extends Vaccinations
    with TableInfo<$VaccinationsTable, Vaccination> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VaccinationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => const Uuid().v4());
  static const VerificationMeta _petIdMeta = const VerificationMeta('petId');
  @override
  late final GeneratedColumn<String> petId = GeneratedColumn<String>(
      'pet_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES pets (id)'));
  static const VerificationMeta _vaccinationNameMeta =
      const VerificationMeta('vaccinationName');
  @override
  late final GeneratedColumn<String> vaccinationName = GeneratedColumn<String>(
      'vaccination_name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _vaccinationDateMeta =
      const VerificationMeta('vaccinationDate');
  @override
  late final GeneratedColumn<String> vaccinationDate = GeneratedColumn<String>(
      'vaccination_date', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
      'created_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, petId, vaccinationName, vaccinationDate, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vaccinations';
  @override
  VerificationContext validateIntegrity(Insertable<Vaccination> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('pet_id')) {
      context.handle(
          _petIdMeta, petId.isAcceptableOrUnknown(data['pet_id']!, _petIdMeta));
    } else if (isInserting) {
      context.missing(_petIdMeta);
    }
    if (data.containsKey('vaccination_name')) {
      context.handle(
          _vaccinationNameMeta,
          vaccinationName.isAcceptableOrUnknown(
              data['vaccination_name']!, _vaccinationNameMeta));
    }
    if (data.containsKey('vaccination_date')) {
      context.handle(
          _vaccinationDateMeta,
          vaccinationDate.isAcceptableOrUnknown(
              data['vaccination_date']!, _vaccinationDateMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Vaccination map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Vaccination(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      petId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pet_id'])!,
      vaccinationName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}vaccination_name'])!,
      vaccinationDate: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}vaccination_date'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $VaccinationsTable createAlias(String alias) {
    return $VaccinationsTable(attachedDatabase, alias);
  }
}

class VaccinationsCompanion extends UpdateCompanion<Vaccination> {
  final Value<String> id;
  final Value<String> petId;
  final Value<String> vaccinationName;
  final Value<String> vaccinationDate;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int> rowid;
  const VaccinationsCompanion({
    this.id = const Value.absent(),
    this.petId = const Value.absent(),
    this.vaccinationName = const Value.absent(),
    this.vaccinationDate = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  VaccinationsCompanion.insert({
    this.id = const Value.absent(),
    required String petId,
    this.vaccinationName = const Value.absent(),
    this.vaccinationDate = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.rowid = const Value.absent(),
  })  : petId = Value(petId),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<Vaccination> custom({
    Expression<String>? id,
    Expression<String>? petId,
    Expression<String>? vaccinationName,
    Expression<String>? vaccinationDate,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (petId != null) 'pet_id': petId,
      if (vaccinationName != null) 'vaccination_name': vaccinationName,
      if (vaccinationDate != null) 'vaccination_date': vaccinationDate,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  VaccinationsCompanion copyWith(
      {Value<String>? id,
      Value<String>? petId,
      Value<String>? vaccinationName,
      Value<String>? vaccinationDate,
      Value<int>? createdAt,
      Value<int>? updatedAt,
      Value<int>? rowid}) {
    return VaccinationsCompanion(
      id: id ?? this.id,
      petId: petId ?? this.petId,
      vaccinationName: vaccinationName ?? this.vaccinationName,
      vaccinationDate: vaccinationDate ?? this.vaccinationDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (petId.present) {
      map['pet_id'] = Variable<String>(petId.value);
    }
    if (vaccinationName.present) {
      map['vaccination_name'] = Variable<String>(vaccinationName.value);
    }
    if (vaccinationDate.present) {
      map['vaccination_date'] = Variable<String>(vaccinationDate.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VaccinationsCompanion(')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('vaccinationName: $vaccinationName, ')
          ..write('vaccinationDate: $vaccinationDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ChecklistItemsTable checklistItems = $ChecklistItemsTable(this);
  late final $PetsTable pets = $PetsTable(this);
  late final $VaccinationsTable vaccinations = $VaccinationsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [checklistItems, pets, vaccinations];
}

typedef $$ChecklistItemsTableCreateCompanionBuilder = ChecklistItemsCompanion
    Function({
  Value<String> id,
  required String col,
  required String label,
  required String description,
  Value<bool> value,
  required int createdAt,
  required int updatedAt,
  Value<int> rowid,
});
typedef $$ChecklistItemsTableUpdateCompanionBuilder = ChecklistItemsCompanion
    Function({
  Value<String> id,
  Value<String> col,
  Value<String> label,
  Value<String> description,
  Value<bool> value,
  Value<int> createdAt,
  Value<int> updatedAt,
  Value<int> rowid,
});

class $$ChecklistItemsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ChecklistItemsTable> {
  $$ChecklistItemsTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get col => $state.composableBuilder(
      column: $state.table.col,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get label => $state.composableBuilder(
      column: $state.table.label,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get value => $state.composableBuilder(
      column: $state.table.value,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$ChecklistItemsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ChecklistItemsTable> {
  $$ChecklistItemsTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get col => $state.composableBuilder(
      column: $state.table.col,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get label => $state.composableBuilder(
      column: $state.table.label,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get value => $state.composableBuilder(
      column: $state.table.value,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$ChecklistItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ChecklistItemsTable,
    ChecklistItem,
    $$ChecklistItemsTableFilterComposer,
    $$ChecklistItemsTableOrderingComposer,
    $$ChecklistItemsTableCreateCompanionBuilder,
    $$ChecklistItemsTableUpdateCompanionBuilder,
    (
      ChecklistItem,
      BaseReferences<_$AppDatabase, $ChecklistItemsTable, ChecklistItem>
    ),
    ChecklistItem,
    PrefetchHooks Function()> {
  $$ChecklistItemsTableTableManager(
      _$AppDatabase db, $ChecklistItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ChecklistItemsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ChecklistItemsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> col = const Value.absent(),
            Value<String> label = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<bool> value = const Value.absent(),
            Value<int> createdAt = const Value.absent(),
            Value<int> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ChecklistItemsCompanion(
            id: id,
            col: col,
            label: label,
            description: description,
            value: value,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> id = const Value.absent(),
            required String col,
            required String label,
            required String description,
            Value<bool> value = const Value.absent(),
            required int createdAt,
            required int updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              ChecklistItemsCompanion.insert(
            id: id,
            col: col,
            label: label,
            description: description,
            value: value,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ChecklistItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ChecklistItemsTable,
    ChecklistItem,
    $$ChecklistItemsTableFilterComposer,
    $$ChecklistItemsTableOrderingComposer,
    $$ChecklistItemsTableCreateCompanionBuilder,
    $$ChecklistItemsTableUpdateCompanionBuilder,
    (
      ChecklistItem,
      BaseReferences<_$AppDatabase, $ChecklistItemsTable, ChecklistItem>
    ),
    ChecklistItem,
    PrefetchHooks Function()>;
typedef $$PetsTableCreateCompanionBuilder = PetsCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> species,
  Value<String> breed,
  Value<String> color,
  Value<String> microchipNumber,
  Value<String> dogRegistrationNumber,
  Value<String> weight,
  Value<String> characteristics,
  Value<String> temper,
  Value<String> medicalHistory,
  Value<String> medicalCondition,
  Value<String> hospitalName,
  Value<String> hospitalPhoneNumber,
  required int createdAt,
  required int updatedAt,
  Value<int> rowid,
});
typedef $$PetsTableUpdateCompanionBuilder = PetsCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> species,
  Value<String> breed,
  Value<String> color,
  Value<String> microchipNumber,
  Value<String> dogRegistrationNumber,
  Value<String> weight,
  Value<String> characteristics,
  Value<String> temper,
  Value<String> medicalHistory,
  Value<String> medicalCondition,
  Value<String> hospitalName,
  Value<String> hospitalPhoneNumber,
  Value<int> createdAt,
  Value<int> updatedAt,
  Value<int> rowid,
});

final class $$PetsTableReferences
    extends BaseReferences<_$AppDatabase, $PetsTable, Pet> {
  $$PetsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$VaccinationsTable, List<Vaccination>>
      _vaccinationsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.vaccinations,
          aliasName: $_aliasNameGenerator(db.pets.id, db.vaccinations.petId));

  $$VaccinationsTableProcessedTableManager get vaccinationsRefs {
    final manager = $$VaccinationsTableTableManager($_db, $_db.vaccinations)
        .filter((f) => f.petId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_vaccinationsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$PetsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $PetsTable> {
  $$PetsTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get species => $state.composableBuilder(
      column: $state.table.species,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get breed => $state.composableBuilder(
      column: $state.table.breed,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get color => $state.composableBuilder(
      column: $state.table.color,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get microchipNumber => $state.composableBuilder(
      column: $state.table.microchipNumber,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get dogRegistrationNumber => $state.composableBuilder(
      column: $state.table.dogRegistrationNumber,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get weight => $state.composableBuilder(
      column: $state.table.weight,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get characteristics => $state.composableBuilder(
      column: $state.table.characteristics,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get temper => $state.composableBuilder(
      column: $state.table.temper,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get medicalHistory => $state.composableBuilder(
      column: $state.table.medicalHistory,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get medicalCondition => $state.composableBuilder(
      column: $state.table.medicalCondition,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get hospitalName => $state.composableBuilder(
      column: $state.table.hospitalName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get hospitalPhoneNumber => $state.composableBuilder(
      column: $state.table.hospitalPhoneNumber,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter vaccinationsRefs(
      ComposableFilter Function($$VaccinationsTableFilterComposer f) f) {
    final $$VaccinationsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.vaccinations,
        getReferencedColumn: (t) => t.petId,
        builder: (joinBuilder, parentComposers) =>
            $$VaccinationsTableFilterComposer(ComposerState($state.db,
                $state.db.vaccinations, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$PetsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $PetsTable> {
  $$PetsTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get species => $state.composableBuilder(
      column: $state.table.species,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get breed => $state.composableBuilder(
      column: $state.table.breed,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get color => $state.composableBuilder(
      column: $state.table.color,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get microchipNumber => $state.composableBuilder(
      column: $state.table.microchipNumber,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get dogRegistrationNumber => $state.composableBuilder(
      column: $state.table.dogRegistrationNumber,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get weight => $state.composableBuilder(
      column: $state.table.weight,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get characteristics => $state.composableBuilder(
      column: $state.table.characteristics,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get temper => $state.composableBuilder(
      column: $state.table.temper,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get medicalHistory => $state.composableBuilder(
      column: $state.table.medicalHistory,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get medicalCondition => $state.composableBuilder(
      column: $state.table.medicalCondition,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get hospitalName => $state.composableBuilder(
      column: $state.table.hospitalName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get hospitalPhoneNumber => $state.composableBuilder(
      column: $state.table.hospitalPhoneNumber,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$PetsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PetsTable,
    Pet,
    $$PetsTableFilterComposer,
    $$PetsTableOrderingComposer,
    $$PetsTableCreateCompanionBuilder,
    $$PetsTableUpdateCompanionBuilder,
    (Pet, $$PetsTableReferences),
    Pet,
    PrefetchHooks Function({bool vaccinationsRefs})> {
  $$PetsTableTableManager(_$AppDatabase db, $PetsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$PetsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$PetsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> species = const Value.absent(),
            Value<String> breed = const Value.absent(),
            Value<String> color = const Value.absent(),
            Value<String> microchipNumber = const Value.absent(),
            Value<String> dogRegistrationNumber = const Value.absent(),
            Value<String> weight = const Value.absent(),
            Value<String> characteristics = const Value.absent(),
            Value<String> temper = const Value.absent(),
            Value<String> medicalHistory = const Value.absent(),
            Value<String> medicalCondition = const Value.absent(),
            Value<String> hospitalName = const Value.absent(),
            Value<String> hospitalPhoneNumber = const Value.absent(),
            Value<int> createdAt = const Value.absent(),
            Value<int> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PetsCompanion(
            id: id,
            name: name,
            species: species,
            breed: breed,
            color: color,
            microchipNumber: microchipNumber,
            dogRegistrationNumber: dogRegistrationNumber,
            weight: weight,
            characteristics: characteristics,
            temper: temper,
            medicalHistory: medicalHistory,
            medicalCondition: medicalCondition,
            hospitalName: hospitalName,
            hospitalPhoneNumber: hospitalPhoneNumber,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> species = const Value.absent(),
            Value<String> breed = const Value.absent(),
            Value<String> color = const Value.absent(),
            Value<String> microchipNumber = const Value.absent(),
            Value<String> dogRegistrationNumber = const Value.absent(),
            Value<String> weight = const Value.absent(),
            Value<String> characteristics = const Value.absent(),
            Value<String> temper = const Value.absent(),
            Value<String> medicalHistory = const Value.absent(),
            Value<String> medicalCondition = const Value.absent(),
            Value<String> hospitalName = const Value.absent(),
            Value<String> hospitalPhoneNumber = const Value.absent(),
            required int createdAt,
            required int updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              PetsCompanion.insert(
            id: id,
            name: name,
            species: species,
            breed: breed,
            color: color,
            microchipNumber: microchipNumber,
            dogRegistrationNumber: dogRegistrationNumber,
            weight: weight,
            characteristics: characteristics,
            temper: temper,
            medicalHistory: medicalHistory,
            medicalCondition: medicalCondition,
            hospitalName: hospitalName,
            hospitalPhoneNumber: hospitalPhoneNumber,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$PetsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({vaccinationsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (vaccinationsRefs) db.vaccinations],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (vaccinationsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$PetsTableReferences._vaccinationsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PetsTableReferences(db, table, p0)
                                .vaccinationsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.petId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$PetsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PetsTable,
    Pet,
    $$PetsTableFilterComposer,
    $$PetsTableOrderingComposer,
    $$PetsTableCreateCompanionBuilder,
    $$PetsTableUpdateCompanionBuilder,
    (Pet, $$PetsTableReferences),
    Pet,
    PrefetchHooks Function({bool vaccinationsRefs})>;
typedef $$VaccinationsTableCreateCompanionBuilder = VaccinationsCompanion
    Function({
  Value<String> id,
  required String petId,
  Value<String> vaccinationName,
  Value<String> vaccinationDate,
  required int createdAt,
  required int updatedAt,
  Value<int> rowid,
});
typedef $$VaccinationsTableUpdateCompanionBuilder = VaccinationsCompanion
    Function({
  Value<String> id,
  Value<String> petId,
  Value<String> vaccinationName,
  Value<String> vaccinationDate,
  Value<int> createdAt,
  Value<int> updatedAt,
  Value<int> rowid,
});

final class $$VaccinationsTableReferences
    extends BaseReferences<_$AppDatabase, $VaccinationsTable, Vaccination> {
  $$VaccinationsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PetsTable _petIdTable(_$AppDatabase db) => db.pets
      .createAlias($_aliasNameGenerator(db.vaccinations.petId, db.pets.id));

  $$PetsTableProcessedTableManager? get petId {
    if ($_item.petId == null) return null;
    final manager = $$PetsTableTableManager($_db, $_db.pets)
        .filter((f) => f.id($_item.petId!));
    final item = $_typedResult.readTableOrNull(_petIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$VaccinationsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $VaccinationsTable> {
  $$VaccinationsTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get vaccinationName => $state.composableBuilder(
      column: $state.table.vaccinationName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get vaccinationDate => $state.composableBuilder(
      column: $state.table.vaccinationDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$PetsTableFilterComposer get petId {
    final $$PetsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.petId,
        referencedTable: $state.db.pets,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$PetsTableFilterComposer(
            ComposerState(
                $state.db, $state.db.pets, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$VaccinationsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $VaccinationsTable> {
  $$VaccinationsTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get vaccinationName => $state.composableBuilder(
      column: $state.table.vaccinationName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get vaccinationDate => $state.composableBuilder(
      column: $state.table.vaccinationDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$PetsTableOrderingComposer get petId {
    final $$PetsTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.petId,
        referencedTable: $state.db.pets,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$PetsTableOrderingComposer(
            ComposerState(
                $state.db, $state.db.pets, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$VaccinationsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $VaccinationsTable,
    Vaccination,
    $$VaccinationsTableFilterComposer,
    $$VaccinationsTableOrderingComposer,
    $$VaccinationsTableCreateCompanionBuilder,
    $$VaccinationsTableUpdateCompanionBuilder,
    (Vaccination, $$VaccinationsTableReferences),
    Vaccination,
    PrefetchHooks Function({bool petId})> {
  $$VaccinationsTableTableManager(_$AppDatabase db, $VaccinationsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$VaccinationsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$VaccinationsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> petId = const Value.absent(),
            Value<String> vaccinationName = const Value.absent(),
            Value<String> vaccinationDate = const Value.absent(),
            Value<int> createdAt = const Value.absent(),
            Value<int> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              VaccinationsCompanion(
            id: id,
            petId: petId,
            vaccinationName: vaccinationName,
            vaccinationDate: vaccinationDate,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> id = const Value.absent(),
            required String petId,
            Value<String> vaccinationName = const Value.absent(),
            Value<String> vaccinationDate = const Value.absent(),
            required int createdAt,
            required int updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              VaccinationsCompanion.insert(
            id: id,
            petId: petId,
            vaccinationName: vaccinationName,
            vaccinationDate: vaccinationDate,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$VaccinationsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({petId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (petId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.petId,
                    referencedTable:
                        $$VaccinationsTableReferences._petIdTable(db),
                    referencedColumn:
                        $$VaccinationsTableReferences._petIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$VaccinationsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $VaccinationsTable,
    Vaccination,
    $$VaccinationsTableFilterComposer,
    $$VaccinationsTableOrderingComposer,
    $$VaccinationsTableCreateCompanionBuilder,
    $$VaccinationsTableUpdateCompanionBuilder,
    (Vaccination, $$VaccinationsTableReferences),
    Vaccination,
    PrefetchHooks Function({bool petId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ChecklistItemsTableTableManager get checklistItems =>
      $$ChecklistItemsTableTableManager(_db, _db.checklistItems);
  $$PetsTableTableManager get pets => $$PetsTableTableManager(_db, _db.pets);
  $$VaccinationsTableTableManager get vaccinations =>
      $$VaccinationsTableTableManager(_db, _db.vaccinations);
}
