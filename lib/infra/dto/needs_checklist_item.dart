enum NeedsChecklistColumn {
  food,
  water,
  medicine,
  tableware,
  toiletries,
  carryBugOrCage,
  collarAndLeashOrHarness,
  laundryNet,
  towelOrBlanket
}

class NeedsChecklistItem {
  final int id;
  final NeedsChecklistColumn column;
  final bool value;
  final int createdAt;
  final int updatedAt;

  NeedsChecklistItem({
    required this.id,
    required this.column,
    required this.value,
    required this.createdAt,
    required this.updatedAt,
  });

  static String createTableStmt() {
    return '''CREATE TABLE needs_checklist_items (
       id INTEGER PRIMARY KEY AUTOINCREMENT,
       column TEXT NOT NULL,
       value INTEGER NOT NULL,
       created_at INTEGER NOT NULL,
       updated_at INTEGER NOT NULL
     )''';
  }
}
