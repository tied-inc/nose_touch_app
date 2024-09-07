import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nose_touch/backend/main.dart';
import 'package:nose_touch/presentations/information_card/widgets/form_views/text_form.dart';
import 'package:nose_touch/schema/vaccinations/entities.dart';

class VaccineInfo extends HookWidget {
  final String petId;
  final BackendApp backendApp;

  const VaccineInfo({super.key, required this.petId, required this.backendApp});

  @override
  Widget build(BuildContext context) {
    final data = useState<PetVaccination?>(null);

    fetchData() async {
      try {
        final ret = await backendApp.vaccinationsController.index(petId);
        data.value = ret.first;
      } catch (e) {
        data.value = null;
      }
    }

    useEffect(() {
      fetchData();
      return null;
    }, []);

    if (data.value == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return ListView(children: [
      ListTile(
        title: const Text('接種日'),
        trailing: Text(data.value!.vaccinationDate.isNotEmpty
            ? data.value?.vaccinationDate ?? ''
            : 'タップして入力してください'),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => TextForm(
                    label: '接種日',
                    initialValue: data.value?.vaccinationDate ?? '',
                    onSave: (value) {
                      data.value = data.value!.copyWith(vaccinationDate: value);
                      backendApp.vaccinationsController.upsert(data.value!);
                    },
                  )));
        },
      ),
      ListTile(
        title: const Text('種類'),
        trailing: Text(data.value!.vaccinationName.isNotEmpty
            ? data.value?.vaccinationName ?? ''
            : 'タップして入力してください'),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => TextForm(
                    label: '種類',
                    initialValue: data.value?.vaccinationName ?? '',
                    onSave: (value) {
                      data.value = data.value!.copyWith(vaccinationName: value);
                      backendApp.vaccinationsController.upsert(data.value!);
                    },
                  )));
        },
      ),
    ]);
  }
}
