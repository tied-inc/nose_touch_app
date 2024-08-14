import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nose_touch/services/settings_service.dart';

class SettingsView extends HookWidget {
  final SettingsService settingsService;

  const SettingsView({super.key, required this.settingsService});

  void handleDelete(BuildContext context) {
    settingsService.reset().then((value) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('初期状態に戻しました')));
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    final appVersion = useState<String>('');

    useEffect(() {
      settingsService.getAppVersion().then((value) {
        appVersion.value = value;
      });
      return null;
    }, []);

    return Scaffold(
        body: ListView(children: [
      ListTile(
        title: const Text('アプリ情報'),
        onTap: () {
          showAboutDialog(
            context: context,
            applicationIcon: const FlutterLogo(),
            applicationName: 'ノーズタッチ',
            applicationVersion: appVersion.value,
            applicationLegalese: '© 2024 Tied, inc',
          );
        },
      ),
      const Divider(),
      ListTile(
          title: const Text('初期状態に戻す'),
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                      title: const Text('初期状態に戻しますか？'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('キャンセル'),
                        ),
                        TextButton(
                            onPressed: () {
                              handleDelete(context);
                            },
                            child: const Text('はい'))
                      ]);
                });
          }),
    ]));
  }
}
