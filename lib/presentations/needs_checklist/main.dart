import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_safety/services/needs_checklist_service.dart';

class NeedsChecklistView extends ConsumerWidget {
  const NeedsChecklistView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(needsChecklistServiceProvider);

    return state.when(
        data: (data) {
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
        },
        error: (error, stackTrace) {
          return Text(error.toString());
        },
        loading: () => const CircularProgressIndicator());
  }
}
