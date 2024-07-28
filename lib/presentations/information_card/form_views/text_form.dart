import 'package:flutter/material.dart';
import 'package:nose_touch/presentations/information_card/schema.dart';

class TextForm extends StatelessWidget {
  final BasicListTileSchema row;
  final void Function(String?) onSave;

  const TextForm({super.key, required this.row, required this.onSave});

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
                  border: const UnderlineInputBorder(),
                  labelText: row.title,
                ),
                initialValue: row.trailing,
                onSaved: onSave,
              ),
            ),
          ],
        ));
  }
}
