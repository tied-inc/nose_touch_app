import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nose_touch/presentations/information_card/form_views/text_form.dart';
import 'package:nose_touch/services/information_card_service.dart';

class BasicInfoWidget extends ConsumerWidget {
  const BasicInfoWidget({super.key});

  void onSave(String? value) {}

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(informationCardServiceProvider);

    return state.when(
        data: (data) {
          return Scaffold(
              body: ListView.builder(
            itemBuilder: (context, index) {
              final row = data.rows[index];

              return ListTile(
                title: Text(row.title),
                trailing: Text(row.trailing),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              TextForm(row: row, onSave: onSave)));
                },
              );
            },
            itemCount: data.rows.length,
          ));
        },
        error: (error, stackTrace) {
          return Text(error.toString());
        },
        loading: () => const CircularProgressIndicator());
  }
}
