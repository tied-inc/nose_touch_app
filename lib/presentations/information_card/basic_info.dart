import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nose_touch/presentations/information_card/form_views/text_form.dart';
import 'package:nose_touch/services/information_card_service.dart';

class BasicInfoWidget extends HookConsumerWidget {
  const BasicInfoWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(informationCardServiceProvider.notifier);
    final data = useState(null);

    notifier.getBasicInfo().then((value) {
      data = value;
    });

    if (data == null) {
      return const CircularProgressIndicator();
    }

    return ListView(
      children: [
        ListTile(
          title: const Text('名前'),
          trailing: Text(data!.name),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TextForm(
                      label: '名前',
                      initialValue: data!.name,
                      onSave: (value) {
                        final petInfo = data!.copyWith(name: value);
                        notifier.upsertBasicInfo(petInfo);
                      },
                    )));
          },
        ),
        ListTile(
          title: const Text('種類'),
          trailing: Text(data!.species),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TextForm(
                      label: '種類',
                      initialValue: data!.species,
                      onSave: (value) {
                        final petInfo = data!.copyWith(species: value);
                        notifier.upsertBasicInfo(petInfo);
                      },
                    )));
          },
        ),
        ListTile(
          title: const Text('品種'),
          trailing: Text(data!.breed),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TextForm(
                      label: '品種',
                      initialValue: data!.breed,
                      onSave: (value) {
                        final petInfo = data!.copyWith(breed: value);
                        notifier.upsertBasicInfo(petInfo);
                      },
                    )));
          },
        ),
        ListTile(
          title: const Text('色'),
          trailing: Text(data!.color),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TextForm(
                      label: '色',
                      initialValue: data!.color,
                      onSave: (value) {
                        final petInfo = data!.copyWith(color: value);
                        notifier.upsertBasicInfo(petInfo);
                      },
                    )));
          },
        ),
        ListTile(
          title: const Text('マイクロチップ番号'),
          trailing: Text(data!.microchipNumber),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TextForm(
                      label: 'マイクロチップ番号',
                      initialValue: data!.microchipNumber,
                      onSave: (value) {
                        final petInfo = data!.copyWith(microchipNumber: value);
                        notifier.upsertBasicInfo(petInfo);
                      },
                    )));
          },
        ),
        ListTile(
          title: const Text('犬登録番号'),
          trailing: Text(data!.dogRegistrationNumber),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TextForm(
                      label: '犬登録番号',
                      initialValue: data!.dogRegistrationNumber,
                      onSave: (value) {
                        final petInfo =
                            data!.copyWith(dogRegistrationNumber: value);
                        notifier.upsertBasicInfo(petInfo);
                      },
                    )));
          },
        ),
        ListTile(
          title: const Text('体重'),
          trailing: Text(data!.weight),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TextForm(
                      label: '体重',
                      initialValue: data!.weight,
                      onSave: (value) {
                        final petInfo = data!.copyWith(weight: value);
                        notifier.upsertBasicInfo(petInfo);
                      },
                    )));
          },
        ),
        ListTile(
          title: const Text('特徴'),
          trailing: Text(data!.characteristics),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TextForm(
                      label: '特徴',
                      initialValue: data!.characteristics,
                      onSave: (value) {
                        final petInfo = data!.copyWith(characteristics: value);
                        notifier.upsertBasicInfo(petInfo);
                      },
                    )));
          },
        ),
        ListTile(
          title: const Text('性格'),
          trailing: Text(data!.temper),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TextForm(
                      label: '性格',
                      initialValue: data!.temper,
                      onSave: (value) {
                        final petInfo = data!.copyWith(temper: value);
                        notifier.upsertBasicInfo(petInfo);
                      },
                    )));
          },
        ),
        ListTile(
          title: const Text('かかりつけ病院'),
          trailing: Text(data!.hospitalName),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TextForm(
                      label: 'かかりつけ病院',
                      initialValue: data!.hospitalName,
                      onSave: (value) {
                        final petInfo = data!.copyWith(hospitalName: value);
                        notifier.upsertBasicInfo(petInfo);
                      },
                    )));
          },
        ),
        ListTile(
          title: const Text('かかりつけ病院電話番号'),
          trailing: Text(data!.hospitalPhoneNumber),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TextForm(
                      label: 'かかりつけ病院電話番号',
                      initialValue: data!.hospitalPhoneNumber,
                      onSave: (value) {
                        final petInfo =
                            data!.copyWith(hospitalPhoneNumber: value);
                        notifier.upsertBasicInfo(petInfo);
                      },
                    )));
          },
        ),
        ListTile(
          title: const Text('病歴'),
          trailing: Text(data!.medicalHistory),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TextForm(
                      label: '病歴',
                      initialValue: data!.medicalHistory,
                      onSave: (value) {
                        final petInfo = data!.copyWith(medicalHistory: value);
                        notifier.upsertBasicInfo(petInfo);
                      },
                    )));
          },
        ),
        ListTile(
          title: const Text('病状'),
          trailing: Text(data!.medicalCondition),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TextForm(
                      label: '病状',
                      initialValue: data!.medicalCondition,
                      onSave: (value) {
                        final petInfo = data!.copyWith(medicalCondition: value);
                        notifier.upsertBasicInfo(petInfo);
                      },
                    )));
          },
        ),
      ],
    );
  }
}
