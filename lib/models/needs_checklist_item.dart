class NeedsChecklistItem {
  final int id;
  final String col;
  bool value;
  final int createdAt;
  final int updatedAt;

  NeedsChecklistItem({
    required this.id,
    required this.col,
    required this.value,
    required this.createdAt,
    required this.updatedAt,
  });

  set setValue(bool newValue) {
    value = newValue;
  }

  NeedsChecklistItem copyWith({
    int? id,
    String? col,
    bool? value,
    int? createdAt,
    int? updatedAt,
  }) {
    return NeedsChecklistItem(
      id: id ?? this.id,
      col: col ?? this.col,
      value: value ?? this.value,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
