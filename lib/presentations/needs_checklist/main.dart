import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_safety/services/needs_checklist_service.dart';

class NeedsChecklist extends ConsumerWidget {
  const NeedsChecklist({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(needsChecklistServiceProvider);
    return state.when(
        data: (data) => Scaffold(
                body: Form(
                    child: Column(
              children: <Widget>[
                for (var item in data)
                  CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text(item.column.name),
                      subtitle: Text(item.column.name),
                      value: item.value,
                      onChanged: (bool? value) {})
              ],
            ))),
        error: (error, stackTrace) {
          return Text(error.toString());
        },
        loading: () => const CircularProgressIndicator());
  }
}
