import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orders_app/constants/colors.dart';
import 'package:orders_app/icons/orders_app_icons_icons.dart';
import 'package:orders_app/screens/home_screens/dashboard/dashboard.dart';
import 'package:orders_app/screens/home_screens/profile/profile.dart';
import 'package:orders_app/screens/home_screens/orders/orders.dart';
import 'package:orders_app/screens/home_screens/sites/sites.dart';
import 'package:orders_app/screens/home_screens/tasks/tasks.dart';
import 'package:orders_app/screens/home_screens/repairers/repairers.dart';
import 'package:orders_app/screens/home_screens/repair_works/repair_works.dart';
import 'package:orders_app/stores/base_store/base_list_store.dart';
import 'package:orders_app/stores/index.dart';
import 'package:orders_app/stores/user_store/user_store.dart';

final Map<Role, List<ScreenManager>> roleWithPages = {
  Role.leaser: [
    dashboardScreen,
    ordersScreen,
    profileScreen,
  ],
  Role.client: [
    dashboardScreen,
    ordersScreen,
    tasksScreen,
    //_subscriptions,
    profileScreen,
  ],
  Role.manager: [
    dashboardScreen,
    ordersScreen,
    completedOrderScreen,
    tasksScreen,
    sitesScreen,
    repairersScreen,
  ],
  Role.repairer: [
    dashboardScreen,
    completedOrderScreen,
    tasksScreen,
    profileScreen,
  ],
};

class ScreenTitles {
  static const home = 'Dashboard';
  static const orders = 'Orders';
  static const completedOrder = 'Repair Work';
  static const sites = 'Sites';
  static const tasks = 'Tasks';
  static const profile = 'My Profile';
  static const repairers = 'Repairers';
}

final dashboardScreen = ScreenManager(
  title: ScreenTitles.home,
  bottomItem: BottomNavigationBarItem(
    icon: Icon(OrdersAppIcons.home),
    title: Text('Home'),
  ),
  screen: DashboardScreen(),
);

final ordersScreen = ScreenManager(
  title: ScreenTitles.orders,
  bottomItem: BottomNavigationBarItem(
    icon: Icon(OrdersAppIcons.order),
    title: Text("Orders"),
  ),
  screen: OrdersScreen(),
  store: orderStore,
);

final completedOrderScreen = ScreenManager(
  title: ScreenTitles.completedOrder,
  bottomItem: BottomNavigationBarItem(
    icon: SvgPicture.asset('svgs/work-order.svg'),
    activeIcon: SvgPicture.asset(
      'svgs/work-order.svg',
      color: GKColors.green,
    ),
    title: Text("Work"),
  ),
  screen: RepairWorksPage(),
  store: completedOrderStore
);

final sitesScreen = ScreenManager(
  title: ScreenTitles.sites,
  bottomItem: BottomNavigationBarItem(
    icon: Icon(OrdersAppIcons.building),
    title: Text("Sites"),
  ),
  screen: SitesScreen(),
);

final tasksScreen = ScreenManager(
  title: ScreenTitles.tasks,
  bottomItem: BottomNavigationBarItem(
    icon: Icon(OrdersAppIcons.tasks),
    title: Text("Tasks"),
  ),
  screen: TasksScreen(),
  store: taskStore
);

final profileScreen = ScreenManager(
  title: ScreenTitles.profile,
  bottomItem: BottomNavigationBarItem(
    icon: Icon(OrdersAppIcons.profile),
    title: Text('Profile'),
  ),
  screen: ProfileScreen(),
);

final repairersScreen = ScreenManager(
  title: ScreenTitles.repairers,
  bottomItem: BottomNavigationBarItem(
    icon: Icon(OrdersAppIcons.service),
    title: Text('Repairers'),
  ),
  screen: RepairersScreen(),
);

class ScreenManager {
  final String title;
  final Widget screen;
  final BottomNavigationBarItem bottomItem;
  final BaseListStore store;

  ScreenManager({
    @required this.title,
    @required this.screen,
    @required this.bottomItem,
    this.store,
  });
}
