class NeedsChecklistItemEntity {
  final String label;
  final String title;
  final String subtitle;
  bool value;

  NeedsChecklistItemEntity({
    required this.label,
    required this.title,
    required this.subtitle,
    required this.value,
  });

  toMap() {
    return {
      'label': label,
      'title': title,
      'subtitle': subtitle,
      'value': value,
    };
  }

  factory NeedsChecklistItemEntity.fromMap(Map<String, dynamic> map) {
    return NeedsChecklistItemEntity(
      label: map['label'],
      title: map['title'],
      subtitle: map['subtitle'],
      value: map['value'],
    );
  }
}

class NeedsChecklistEntity {
  List<NeedsChecklistItemEntity> data;

  NeedsChecklistEntity({required this.data});

  toMap() {
    return {
      'data': data.map((e) => e.toMap()).toList(),
    };
  }
}
