import 'package:flutter/material.dart';
import 'package:pet_safety/domain/repo/needs_checklist.dart';

class NeedsChecklist extends StatefulWidget {
  final NeedsChecklistRepo repo;
  const NeedsChecklist({super.key, required this.repo});

  @override
  State<NeedsChecklist> createState() => _NeedsChecklistState(repo);
}

class _NeedsChecklistState extends State<NeedsChecklist> {
  final NeedsChecklistRepo repo;
  _NeedsChecklistState(this.repo);

  final data = repo.getNeedsChecklist();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            child: Column(
      children: <Widget>[
        for (var item in data.data)
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: Text(item.title),
            subtitle: Text(item.subtitle),
            value: item.value,
            onChanged: (bool? value) {
              setState(() {
                item.value = value!;
              });
            },
          )
      ],
    )));
  }
}
