import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  final String label;
  final String? initialValue;
  final void Function(String?) onSave;

  const TextForm({
    super.key,
    required this.label,
    required this.initialValue,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: InputDecoration(
                    border: const UnderlineInputBorder(), labelText: label),
                initialValue: initialValue,
                onChanged: onSave,
              ),
            ),
          ],
        ));
  }
}
