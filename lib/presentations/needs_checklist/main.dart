import 'package:flutter/material.dart';
import 'package:nose_touch/services/needs_checklist_service.dart';

class NeedsChecklistView extends StatefulWidget {
  final NeedsChecklistService needsChecklistService;

  const NeedsChecklistView({super.key, required this.needsChecklistService});

  @override
  State<NeedsChecklistView> createState() => _NeedsChecklistViewState();
}

class _NeedsChecklistViewState extends State<NeedsChecklistView> {
  @override
  Widget build(BuildContext context) {
    final data = needsChecklistService.showChecklist();

    return Scaffold(
        body: Form(
            child: Column(
      children: <Widget>[
        for (var item in data.items)
          CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(item.label),
              subtitle: Text(item.description),
              value: item.value,
              onChanged: (bool? value) {
                final notifier =
                    ref.read(needsChecklistServiceProvider.notifier);
                notifier.toggleItemValue(item, value!);
                ref.invalidate(needsChecklistServiceProvider);
              }),
      ],
    )));
  }
}
