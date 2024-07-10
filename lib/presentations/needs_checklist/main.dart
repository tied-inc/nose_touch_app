import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_safety/models/needs_checklist_item.dart';
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
                    title: Text(item.label),
                    subtitle: Text(item.description),
                    value: item.value,
                    onChanged: (bool? value) {
                      handleOnChange(data, item, value, ref);
                    }),
            ],
          )));
        },
        error: (error, stackTrace) {
          return Text(error.toString());
        },
        loading: () => const CircularProgressIndicator());
  }

  void handleOnChange(List<NeedsChecklistItem> data, NeedsChecklistItem item,
      bool? value, WidgetRef ref) {
    final newItems = data
        .map((e) => e.id == item.id ? item.copyWith(value: value!) : e)
        .toList();
    final targetItem = newItems.firstWhere((element) => element.id == item.id,
        orElse: () => item);

    ref.read(needsChecklistServiceProvider.notifier).state =
        AsyncData(newItems);
    ref
        .read(needsChecklistServiceProvider.notifier)
        .updateNeedsChecklistItem(targetItem);
  }
}
