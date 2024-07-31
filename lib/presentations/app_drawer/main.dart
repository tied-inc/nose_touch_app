import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const SizedBox(
              height: 120,
              child: DrawerHeader(
                child: Text('ペット'),
              )),
          ListTile(
            title: const Text('ベル'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('ジル'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
