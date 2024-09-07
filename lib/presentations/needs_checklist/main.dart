import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nose_touch/backend/main.dart';
import 'package:nose_touch/schema/checklist/entities.dart';
import 'package:nose_touch/schema/checklist/requests.dart';

class NeedsChecklistView extends HookWidget {
  final BackendApp backendApp;

  const NeedsChecklistView({super.key, required this.backendApp});

  @override
  Widget build(BuildContext context) {
    final data = useState<NeedsChecklist?>(null);
    final isError = useState(false);

    fetchChecklistData() async {
      try {
        data.value = await backendApp.checklistController.index();
      } catch (e) {
        isError.value = false;
      }
    }

    useEffect(() {
      fetchChecklistData();
      return null;
    }, []);

    return Scaffold(
        body: Form(
            child: Column(
      children: data.value?.items.map((item) {
            return CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(item.label),
                subtitle: Text(item.description),
                value: item.value,
                onChanged: (bool? value) {
                  backendApp.checklistController.update(
                      UpdateChecklistRequest(id: item.id, value: value!));

                  // item の情報をアップデート後の値で書き換え
                  final newChecklistItems = data.value?.items.map((e) {
                    if (e.id == item.id) {
                      return e.copyWith(value: value);
                    }
                    return e;
                  }).toList();
                  final newChecklist =
                      NeedsChecklist(items: newChecklistItems!);

                  data.value = newChecklist;
                });
          }).toList() ??
          [const CircularProgressIndicator()],
    )));
  }
}
