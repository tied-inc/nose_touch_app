import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nose_touch/presentations/information_card/form_views/text_form.dart';
import 'package:nose_touch/services/information_card_service.dart';

class BasicInfoWidget extends ConsumerWidget {
  const BasicInfoWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(informationCardServiceProvider);
    final notifier = ref.read(informationCardServiceProvider.notifier);

    return state.when(
        data: (data) {
          return ListView(
            children: [
              ListTile(
                title: const Text('名前'),
                trailing: Text(data.name),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TextForm(
                            label: '名前',
                            initialValue: data.name,
                            onSave: (value) {
                              final petInfo = data.copyWith(name: value);
                              notifier.upsertBasicInfo(petInfo);
                              ref.invalidate(informationCardServiceProvider);
                            },
                          )));
                },
              ),
              ListTile(
                title: const Text('種類'),
                trailing: Text(data.species),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TextForm(
                            label: '種類',
                            initialValue: data.species,
                            onSave: (value) {
                              final petInfo = data.copyWith(species: value);
                              notifier.upsertBasicInfo(petInfo);
                            },
                          )));
                },
              ),
              ListTile(
                title: const Text('品種'),
                trailing: Text(data.breed),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TextForm(
                            label: '品種',
                            initialValue: data.breed,
                            onSave: (value) {
                              final petInfo = data.copyWith(breed: value);
                              notifier.upsertBasicInfo(petInfo);
                            },
                          )));
                },
              ),
              ListTile(
                title: const Text('色'),
                trailing: Text(data.color),
              ),
              ListTile(
                title: const Text('マイクロチップ番号'),
                trailing: Text(data.microchipNumber),
              ),
              ListTile(
                title: const Text('犬登録番号'),
                trailing: Text(data.dogRegistrationNumber),
              ),
              ListTile(
                title: const Text('体重'),
                trailing: Text(data.weight),
              ),
              ListTile(
                title: const Text('特徴'),
                trailing: Text(data.characteristics),
              ),
              ListTile(
                title: const Text('性格'),
                trailing: Text(data.temper),
              ),
              ListTile(
                title: const Text('かかりつけ病院'),
                trailing: Text(data.hospitalName),
              ),
              ListTile(
                title: const Text('かかりつけ病院電話番号'),
                trailing: Text(data.hospitalPhoneNumber),
              ),
              ListTile(
                title: const Text('病歴'),
                trailing: Text(data.medicalHistory),
              ),
              ListTile(
                title: const Text('病状'),
                trailing: Text(data.medicalCondition),
              ),
            ],
          );
        },
        error: (error, stackTrace) {
          return Text(error.toString());
        },
        loading: () => const CircularProgressIndicator());
  }
}
