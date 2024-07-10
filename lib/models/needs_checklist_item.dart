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

  set setValue(bool newValue) {
    value = newValue;
  }

  static get defaultItems {
    return [
      NeedsChecklistItem(
        id: 1,
        col: 'food',
        label: 'フード',
        description: '最低5日分',
        value: false,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        updatedAt: DateTime.now().millisecondsSinceEpoch,
      ),
      NeedsChecklistItem(
        id: 2,
        col: 'water',
        label: '水',
        description: '最低5日分',
        value: false,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        updatedAt: DateTime.now().millisecondsSinceEpoch,
      ),
      NeedsChecklistItem(
        id: 3,
        col: 'medication',
        label: '常備薬・療養食',
        description: '普段使用しているもの',
        value: false,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        updatedAt: DateTime.now().millisecondsSinceEpoch,
      ),
      NeedsChecklistItem(
        id: 4,
        col: 'tableware',
        label: '食器',
        description: 'ラップなどあるとなおよい',
        value: false,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        updatedAt: DateTime.now().millisecondsSinceEpoch,
      ),
      NeedsChecklistItem(
        id: 5,
        col: 'toilet',
        label: 'トイレ',
        description: 'ペットシート、排泄物用ビニール袋、トイレ用の箱など',
        value: false,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        updatedAt: DateTime.now().millisecondsSinceEpoch,
      ),
      NeedsChecklistItem(
        id: 6,
        col: 'carrier',
        label: 'キャリーバック・ケージ',
        description: '普段使用しているものが望ましい',
        value: false,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        updatedAt: DateTime.now().millisecondsSinceEpoch,
      ),
      NeedsChecklistItem(
        id: 7,
        col: 'leash',
        label: 'リード・ハーネス',
        description: '伸びないものが好ましい',
        value: false,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        updatedAt: DateTime.now().millisecondsSinceEpoch,
      ),
      NeedsChecklistItem(
        id: 8,
        col: 'laundryNet',
        label: '洗濯用ネット',
        description: '猫のみ',
        value: false,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        updatedAt: DateTime.now().millisecondsSinceEpoch,
      ),
      NeedsChecklistItem(
        id: 9,
        col: 'towel',
        label: 'タオル・ブランケット',
        description: '普段使用しているものが望ましい',
        value: false,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        updatedAt: DateTime.now().millisecondsSinceEpoch,
      ),
    ];
  }

  toMap() {
    return {
      'id': id,
      'col': col,
      'label': label,
      'value': value,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
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
