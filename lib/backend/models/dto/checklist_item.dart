class ChecklistItem {
  final String id;
  final String col;
  final String label;
  final String description;
  final bool value;
  final int createdAt;
  final int updatedAt;

  ChecklistItem({
    required this.id,
    required this.col,
    required this.label,
    required this.description,
    required this.value,
    required this.createdAt,
    required this.updatedAt,
  });
}
