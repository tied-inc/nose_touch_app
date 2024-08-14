import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nose_touch/infra/database.dart';
import 'package:nose_touch/infra/repo/pet.dart';
import 'package:nose_touch/presentations/information_card/basic_info.dart';
import 'package:nose_touch/presentations/information_card/vaccine_info.dart';
import 'package:nose_touch/services/information_card_service.dart';

class InformationCardView extends HookWidget {
  final AppDatabase database;

  const InformationCardView({super.key, required this.database});

  final tabs = const [
    Tab(icon: Icon(Icons.info), text: '基本情報'),
    Tab(icon: Icon(Icons.vaccines), text: 'ワクチン接種情報'),
  ];

  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(initialLength: tabs.length);
    final petRepo = PetRepo(database);
    final informationCardService = InformationCardService(petRepo);

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
          BasicInfoWidget(service: informationCardService),
          VaccineInfo(),
        ],
      ),
    );
  }
}
