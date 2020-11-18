import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:orders_app/components/app_app_bar/gk_bar.dart';
import 'package:orders_app/constants/colors.dart';
import 'package:orders_app/screens/home_screens/screen_manager.dart';
import 'package:orders_app/stores/index.dart';

class HomeScreen extends StatefulWidget {
  static final String name = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    loadStores();
    screenStore.setScreens(roleWithPages[userStore.role]);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        appBar: GKAppBar(
          context: context,
          title: screenStore.currentScreen.title,
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.black87,
          selectedItemColor: GKColors.green,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: screenStore.screens
              .map((pageManager) => pageManager.bottomItem)
              .toList(),
          currentIndex: screenStore.currentIndex,
          onTap: screenStore.setScreenByIndex,
        ),
        body: IndexedStack(
          index: screenStore.currentIndex,
          children: screenStore.screens
              .map((pageManager) => pageManager.screen)
              .toList(),
        ),
      ),
    );
  }
}
