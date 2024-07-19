import 'package:flutter/material.dart';
import 'package:pet_safety/presentations/information_card/basic_info.dart';
import 'package:pet_safety/presentations/information_card/health.dart';

class InformationCardView extends StatefulWidget {
  const InformationCardView({super.key});

  @override
  State<InformationCardView> createState() => _InformationCardViewState();
}

class _InformationCardViewState extends State<InformationCardView>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  final tabs = const [
    Tab(icon: Icon(Icons.info), text: '基本情報'),
    Tab(icon: Icon(Icons.vaccines), text: 'ワクチン接種情報'),
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
        children: [
          BasicInfoWidget(),
          HealthWidget(),
        ],
      ),
    );
  }
}
