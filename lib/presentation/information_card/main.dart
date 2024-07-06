import 'package:flutter/material.dart';
import 'package:pet_safety/presentation/information_card/basic_info.dart';
import 'package:pet_safety/presentation/information_card/health.dart';

class InformationCard extends StatefulWidget {
  const InformationCard({super.key});

  @override
  State<InformationCard> createState() => _InformationCardState();
}

class _InformationCardState extends State<InformationCard>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  final tabs = const [
    Tab(icon: Icon(Icons.info), text: '基本情報'),
    Tab(icon: Icon(Icons.health_and_safety), text: '健康情報'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TabBar(
              controller: _tabController,
              indicatorColor: Colors.grey,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: tabs),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            BasicInfo(),
            Health(),
          ],
        ));
  }
}
