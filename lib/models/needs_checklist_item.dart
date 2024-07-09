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
}
