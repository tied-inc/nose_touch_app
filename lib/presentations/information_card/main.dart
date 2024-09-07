import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nose_touch/backend/main.dart';
import 'package:nose_touch/presentations/information_card/widgets/basic_info.dart';
import 'package:nose_touch/presentations/information_card/widgets/vaccine_info.dart';

class InformationCardView extends HookWidget {
  final String petId;
  final BackendApp backendApp;

  const InformationCardView(
      {super.key, required this.petId, required this.backendApp});

  final tabs = const [
    Tab(icon: Icon(Icons.info), text: '基本情報'),
    Tab(icon: Icon(Icons.vaccines), text: 'ワクチン接種情報'),
  ];

  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(initialLength: tabs.length);

    return Scaffold(
      appBar: AppBar(
        title: TabBar(
            controller: tabController,
            indicatorColor: Colors.grey,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: tabs),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          BasicInfoWidget(
            petId: petId,
            backendApp: backendApp,
          ),
          VaccineInfo(
            petId: petId,
            backendApp: backendApp,
          ),
        ],
      ),
    );
  }
}
