import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_safety/services/needs_checklist_service.dart';

class NeedsChecklist extends ConsumerWidget {
  const NeedsChecklist({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(needsChecklistServiceProvider);

    return state.when(
        data: (data) {
          return Scaffold(
              body: Form(
                  child: Column(
            children: <Widget>[
              for (var item in data)
                CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(item.col),
                    subtitle: Text(item.col),
                    value: item.value,
                    onChanged: (bool? value) {
                      final newItems = data
                          .map((e) => e.id == item.id
                              ? item.copyWith(value: value!)
                              : e)
                          .toList();
                      final targetItem = newItems.firstWhere(
                          (element) => element.id == item.id,
                          orElse: () => item);

                      ref.read(needsChecklistServiceProvider.notifier).state =
                          AsyncData(newItems);
                      ref
                          .read(needsChecklistServiceProvider.notifier)
                          .updateNeedsChecklistItem(targetItem);
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
