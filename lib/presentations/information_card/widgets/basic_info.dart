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
          trailing: Text(data.value!.name.isNotEmpty
              ? data.value?.name ?? ''
              : 'タップして入力してください'),
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
          trailing: Text(data.value!.species.isNotEmpty
              ? data.value?.species ?? ''
              : 'タップして入力してください'),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TextForm(
                      label: '種類',
                      initialValue: data.value?.species ?? 'タップして入力してください',
                      onSave: (value) {
                        data.value = data.value!.copyWith(species: value);
                        service.upsertBasicInfo(data.value!);
                      },
                    )));
          },
        ),
        ListTile(
          title: const Text('品種'),
          trailing: Text(data.value!.breed.isNotEmpty
              ? data.value?.breed ?? ''
              : 'タップして入力してください'),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TextForm(
                      label: '品種',
                      initialValue: data.value?.breed ?? 'タップして入力してください',
                      onSave: (value) {
                        data.value = data.value!.copyWith(breed: value);
                        service.upsertBasicInfo(data.value!);
                      },
                    )));
          },
        ),
        ListTile(
          title: const Text('色'),
          trailing: Text(data.value!.color.isNotEmpty
              ? data.value?.color ?? ''
              : 'タップして入力してください'),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TextForm(
                      label: '色',
                      initialValue: data.value?.color ?? 'タップして入力してください',
                      onSave: (value) {
                        data.value = data.value!.copyWith(color: value);
                        service.upsertBasicInfo(data.value!);
                      },
                    )));
          },
        ),
        ListTile(
          title: const Text('マイクロチップ番号'),
          trailing: Text(data.value!.microchipNumber.isNotEmpty
              ? data.value?.microchipNumber ?? ''
              : 'タップして入力してください'),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TextForm(
                      label: 'マイクロチップ番号',
                      initialValue:
                          data.value?.microchipNumber ?? 'タップして入力してください',
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
          trailing: Text(data.value!.dogRegistrationNumber.isNotEmpty
              ? data.value?.dogRegistrationNumber ?? ''
              : 'タップして入力してください'),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TextForm(
                      label: '犬登録番号',
                      initialValue:
                          data.value?.dogRegistrationNumber ?? 'タップして入力してください',
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
          trailing: Text(data.value!.weight.isNotEmpty
              ? data.value?.weight ?? ''
              : 'タップして入力してください'),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TextForm(
                      label: '体重',
                      initialValue: data.value?.weight ?? 'タップして入力してください',
                      onSave: (value) {
                        data.value = data.value!.copyWith(weight: value);
                        service.upsertBasicInfo(data.value!);
                      },
                    )));
          },
        ),
        ListTile(
          title: const Text('特徴'),
          trailing: Text(data.value!.characteristics.isNotEmpty
              ? data.value?.characteristics ?? ''
              : 'タップして入力してください'),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TextForm(
                      label: '特徴',
                      initialValue:
                          data.value?.characteristics ?? 'タップして入力してください',
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
          trailing: Text(data.value!.temper.isNotEmpty
              ? data.value?.temper ?? ''
              : 'タップして入力してください'),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TextForm(
                      label: '性格',
                      initialValue: data.value?.temper ?? 'タップして入力してください',
                      onSave: (value) {
                        data.value = data.value!.copyWith(temper: value);
                        service.upsertBasicInfo(data.value!);
                      },
                    )));
          },
        ),
        ListTile(
          title: const Text('かかりつけ病院'),
          trailing: Text(data.value!.hospitalName.isNotEmpty
              ? data.value?.hospitalName ?? ''
              : 'タップして入力してください'),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TextForm(
                      label: 'かかりつけ病院',
                      initialValue: data.value?.hospitalName ?? 'タップして入力してください',
                      onSave: (value) {
                        data.value = data.value!.copyWith(hospitalName: value);
                        service.upsertBasicInfo(data.value!);
                      },
                    )));
          },
        ),
        ListTile(
          title: const Text('かかりつけ病院電話番号'),
          trailing: Text(data.value!.hospitalPhoneNumber.isNotEmpty
              ? data.value?.hospitalPhoneNumber ?? ''
              : 'タップして入力してください'),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TextForm(
                      label: 'かかりつけ病院電話番号',
                      initialValue:
                          data.value?.hospitalPhoneNumber ?? 'タップして入力してください',
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
          trailing: Text(data.value!.medicalHistory.isNotEmpty
              ? data.value?.medicalHistory ?? ''
              : 'タップして入力してください'),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TextForm(
                      label: '病歴',
                      initialValue:
                          data.value?.medicalHistory ?? 'タップして入力してください',
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
          trailing: Text(data.value!.medicalCondition.isNotEmpty
              ? data.value?.medicalCondition ?? ''
              : 'タップして入力してください'),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TextForm(
                      label: '病状',
                      initialValue:
                          data.value?.medicalCondition ?? 'タップして入力してください',
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
