// ignore_for_file: prefer_const_constructors

import 'package:algo_ease/enums/app_tabs_enums.dart';
import 'package:algo_ease/features/home/ui/components/home_bottom_bar.dart';
import 'package:algo_ease/features/deploy/ui/deploy_page.dart';
import 'package:algo_ease/features/order/ui/orders_page.dart';
import 'package:algo_ease/features/strategy/ui/strategy_builder_page.dart';
import 'package:algo_ease/features/user/ui/user_profile_page.dart';
import 'package:flutter/material.dart';

/// TabController for main app declared globally
late TabController _tabController;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin, WidgetsBindingObserver {
  int currentIndex = 0;

  /// Add any actions to be done when user switches back to this tab
  void onTabTapped(int index) {
    switch (_tabController.index) {
      case 0:
        break;
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;
    }
  }

  void setupTabController() {
    /// The global Tab Controller is initialized here
    _tabController = TabController(
      length: HomeTabs.values.length,
      vsync: this,
      initialIndex: currentIndex,
    );

    /// Listener to set the [currentIndex] whenever the tab is changed so it will be reflected in the UI
    _tabController.addListener(() {
      setState(() {
        currentIndex = _tabController.index;
      });
    });
  }

  @override
  void initState() {
    setupTabController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: [
          StrategyBuilderPage(),
          DeployPage(),
          OrdersPage(),
          UserProfilePage(),
        ],
      ),
      bottomNavigationBar: HomeBottomBar(
        onTapped: onTabTapped,
        tabController: _tabController,
      ),
    );
  }
}
