import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nose_touch/presentations/information_card/schema.dart';
import 'package:nose_touch/presentations/information_card/widgets/form_views/text_form.dart';
import 'package:nose_touch/services/information_card_service.dart';

class BasicInfoWidget extends HookWidget {
  final InformationCardService service;

  const BasicInfoWidget({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    final data = useState<BasicInfoSchema?>(null);

    fetchData() async {
      try {
        data.value = await service.getBasicInfo();
      } catch (e) {
        data.value = null;
      }
    }

    useEffect(() {
      fetchData();
      return null;
    }, []);

    if (data.value == null) {
      return const CircularProgressIndicator();
    }

    return ListView(
      children: [
        ListTile(
          title: const Text('名前'),
          trailing: Text(data.value?.name ?? ''),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TextForm(
                      label: '名前',
                      initialValue: data.value?.name ?? '',
                      onSave: (value) {
                        data.value = data.value!.copyWith(name: value);
                        service.upsertBasicInfo(data.value!);
                      },
                    )));
          },
        ),
        ListTile(
          title: const Text('種類'),
          trailing: Text(data.value?.species ?? ''),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TextForm(
                      label: '種類',
                      initialValue: data.value?.species ?? '',
                      onSave: (value) {
                        data.value = data.value!.copyWith(species: value);
                        service.upsertBasicInfo(data.value!);
                      },
                    )));
          },
        ),
        ListTile(
          title: const Text('品種'),
          trailing: Text(data.value?.breed ?? ''),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TextForm(
                      label: '品種',
                      initialValue: data.value?.breed ?? '',
                      onSave: (value) {
                        data.value = data.value!.copyWith(breed: value);
                        service.upsertBasicInfo(data.value!);
                      },
                    )));
          },
        ),
        ListTile(
          title: const Text('色'),
          trailing: Text(data.value?.color ?? ''),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TextForm(
                      label: '色',
                      initialValue: data.value?.color ?? '',
                      onSave: (value) {
                        data.value = data.value!.copyWith(color: value);
                        service.upsertBasicInfo(data.value!);
                      },
                    )));
          },
        ),
        ListTile(
          title: const Text('マイクロチップ番号'),
          trailing: Text(data.value?.microchipNumber ?? ''),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TextForm(
                      label: 'マイクロチップ番号',
                      initialValue: data.value?.microchipNumber ?? '',
                      onSave: (value) {
                        data.value =
                            data.value!.copyWith(microchipNumber: value);
                        service.upsertBasicInfo(data.value!);
                      },
                    )));
          },
        ),
        ListTile(
          title: const Text('犬登録番号'),
          trailing: Text(data.value?.dogRegistrationNumber ?? ''),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TextForm(
                      label: '犬登録番号',
                      initialValue: data.value?.dogRegistrationNumber ?? '',
                      onSave: (value) {
                        data.value =
                            data.value!.copyWith(dogRegistrationNumber: value);
                        service.upsertBasicInfo(data.value!);
                      },
                    )));
          },
        ),
        ListTile(
          title: const Text('体重'),
          trailing: Text(data.value?.weight ?? ''),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TextForm(
                      label: '体重',
                      initialValue: data.value?.weight ?? '',
                      onSave: (value) {
                        data.value = data.value!.copyWith(weight: value);
                        service.upsertBasicInfo(data.value!);
                      },
                    )));
          },
        ),
        ListTile(
          title: const Text('特徴'),
          trailing: Text(data.value?.characteristics ?? ''),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TextForm(
                      label: '特徴',
                      initialValue: data.value?.characteristics ?? '',
                      onSave: (value) {
                        data.value =
                            data.value!.copyWith(characteristics: value);
                        service.upsertBasicInfo(data.value!);
                      },
                    )));
          },
        ),
        ListTile(
          title: const Text('性格'),
          trailing: Text(data.value?.temper ?? ''),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TextForm(
                      label: '性格',
                      initialValue: data.value?.temper ?? '',
                      onSave: (value) {
                        data.value = data.value!.copyWith(temper: value);
                        service.upsertBasicInfo(data.value!);
                      },
                    )));
          },
        ),
        ListTile(
          title: const Text('かかりつけ病院'),
          trailing: Text(data.value?.hospitalName ?? ''),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TextForm(
                      label: 'かかりつけ病院',
                      initialValue: data.value?.hospitalName ?? '',
                      onSave: (value) {
                        data.value = data.value!.copyWith(hospitalName: value);
                        service.upsertBasicInfo(data.value!);
                      },
                    )));
          },
        ),
        ListTile(
          title: const Text('かかりつけ病院電話番号'),
          trailing: Text(data.value?.hospitalPhoneNumber ?? ''),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TextForm(
                      label: 'かかりつけ病院電話番号',
                      initialValue: data.value?.hospitalPhoneNumber ?? '',
                      onSave: (value) {
                        data.value =
                            data.value!.copyWith(hospitalPhoneNumber: value);
                        service.upsertBasicInfo(data.value!);
                      },
                    )));
          },
        ),
        ListTile(
          title: const Text('病歴'),
          trailing: Text(data.value?.medicalHistory ?? ''),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TextForm(
                      label: '病歴',
                      initialValue: data.value?.medicalHistory ?? '',
                      onSave: (value) {
                        data.value =
                            data.value!.copyWith(medicalHistory: value);
                        service.upsertBasicInfo(data.value!);
                      },
                    )));
          },
        ),
        ListTile(
          title: const Text('病状'),
          trailing: Text(data.value?.medicalCondition ?? ''),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TextForm(
                      label: '病状',
                      initialValue: data.value?.medicalCondition ?? '',
                      onSave: (value) {
                        data.value =
                            data.value!.copyWith(medicalCondition: value);
                        service.upsertBasicInfo(data.value!);
                      },
                    )));
          },
        ),
      ],
    );
  }
}
