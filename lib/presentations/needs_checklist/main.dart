import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nose_touch/domain/entities/needs_checklist.dart';
import 'package:nose_touch/infra/database.dart';
import 'package:nose_touch/infra/repo/checklist.dart';
import 'package:nose_touch/services/needs_checklist_service.dart';

class NeedsChecklistView extends HookWidget {
  final AppDatabase database;

  const NeedsChecklistView({super.key, required this.database});

  @override
  Widget build(BuildContext context) {
    final repo = ChecklistRepo(database);
    final service = NeedsChecklistService(repo);

    final data = useState<NeedsChecklist?>(null);
    final isError = useState(false);

    fetchChecklistData() async {
      try {
        data.value = await service.showChecklist();
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
                  service.toggleItemValue(item, value!);
                });
          }).toList() ??
          [const CircularProgressIndicator()],
    )));
  }
}
