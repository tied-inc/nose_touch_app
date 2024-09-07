import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nose_touch/backend/main.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SettingsView extends HookWidget {
  final BackendApp backendApp;

  const SettingsView({super.key, required this.backendApp});

  @override
  Widget build(BuildContext context) {
    final appVersion = useState<String>('');

    Future<String> getAppVersion() async {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      return packageInfo.version;
    }

    useEffect(() {
      getAppVersion().then((value) {
        appVersion.value = value;
      });
      return null;
    }, []);

    void handleDelete() {
      backendApp.dbController.delete().then((value) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('初期状態に戻しました')));
        Navigator.of(context).pop();
      });
    }

    void handleShowResetDialog() {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(title: const Text('初期状態に戻しますか？'), actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('キャンセル'),
              ),
              TextButton(onPressed: handleDelete, child: const Text('はい'))
            ]);
          });
    }

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
      ListTile(title: const Text('初期状態に戻す'), onTap: handleShowResetDialog),
    ]));
  }
}
