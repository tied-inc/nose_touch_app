import 'package:pet_safety/infra/dto/checklist_item.dart';

class NeedsChecklistItem {
  final int id;
  final String col;
  final String label;
  final String description;
  bool value;
  final int createdAt;
  final int updatedAt;

  NeedsChecklistItem({
    required this.id,
    required this.col,
    required this.label,
    required this.description,
    required this.value,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NeedsChecklistItem.fromModel(ChecklistItem model) {
    return NeedsChecklistItem(
      id: model.id,
      col: model.col,
      label: model.label,
      description: model.description,
      value: model.value,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  NeedsChecklistItem copyWith({
    int? id,
    String? col,
    String? label,
    String? description,
    bool? value,
    int? createdAt,
    int? updatedAt,
  }) {
    return NeedsChecklistItem(
      id: id ?? this.id,
      col: col ?? this.col,
      label: label ?? this.label,
      description: description ?? this.description,
      value: value ?? this.value,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class NeedsChecklist {
  final List<NeedsChecklistItem> items;

  NeedsChecklist({required this.items});

  factory NeedsChecklist.fromModel(List<ChecklistItem> model) {
    return NeedsChecklist(
      items: model.map((e) => NeedsChecklistItem.fromModel(e)).toList(),
    );
  }

  isEmpty() {
    return items.isEmpty;
  }

  NeedsChecklist copyWith({
    List<NeedsChecklistItem>? items,
  }) {
    return NeedsChecklist(
      items: items ?? this.items,
    );
  }
}
