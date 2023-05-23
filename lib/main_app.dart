import 'package:flutter/material.dart';

import 'ui/component/appBar.dart';
import 'ui/screen/home_screen.dart';

enum TabItem { home, explore, notification, setting }

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  TabItem _currentItem = TabItem.home;
  final List<TabItem> _bottomTabs = [
    TabItem.home,
    TabItem.explore,
    TabItem.notification,
    TabItem.setting
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: SafeArea(
          child: appBar(
              left: const Icon(Icons.notes, color: Colors.black54),
              title: 'Wallets',
              right: const Icon(Icons.account_balance_wallet, color: Colors.black54)),
        ),
      ),
      body: _buildScreen(),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: _bottomTabs
          .map((tabItem) => _bottomNavigationBarItem(_icon(tabItem), tabItem))
          .toList(),
      onTap: _onSelectTab,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }
  BottomNavigationBarItem _bottomNavigationBarItem(
        IconData icon, TabItem tabItem) {
      final Color color =
          _currentItem == tabItem ? Colors.black54 : Colors.black26;

      return BottomNavigationBarItem(icon: Icon(icon, color: color), label: '');
    }
  void _onSelectTab(int index) {
      TabItem selectedTabItem = _bottomTabs[index];

      setState(() {
        _currentItem = selectedTabItem;
      });
    }
  IconData _icon(TabItem item) {
    switch (item) {
      case TabItem.home:
        return Icons.account_balance_wallet;
      case TabItem.explore:
        return Icons.explore;
      case TabItem.notification:
        return Icons.notifications;
      case TabItem.setting:
        return Icons.settings;
      default:
        throw 'Unknown $item';
    }
  }

  Widget _buildScreen() {
    switch (_currentItem) {
      case TabItem.home:
        return HomeScreen();
      case TabItem.explore:
      // return HomeScreen();
      case TabItem.notification:
      // return HomeScreen()
      case TabItem.setting:
      // return HomeScreen()
      default:
        return HomeScreen();
    }
  }
}
