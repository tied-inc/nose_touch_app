import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_safety/presentations/information_card/form_views/text_form.dart';
import 'package:pet_safety/services/information_card_service.dart';

class BasicInfoWidget extends ConsumerWidget {
  const BasicInfoWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(informationCardServiceProvider);

    return state.when(
        data: (data) {
          return Scaffold(
              body: ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(data.rows[index].title),
                trailing: Text(data.rows[index].trailing),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TextForm()));
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
