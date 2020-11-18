import 'package:flutter/material.dart';
import 'package:orders_app/screens/home.dart';
import 'package:orders_app/screens/home_screens/orders/add_order.dart';
import 'package:orders_app/screens/home_screens/orders/select_repairer.dart';
import 'package:orders_app/screens/home_screens/orders/single_order.dart';
import 'package:orders_app/screens/home_screens/sites/single_site.dart';
import 'package:orders_app/screens/home_screens/tasks/single_task.dart';
import 'package:orders_app/screens/home_screens/repairers/single_repairer.dart';
import 'package:orders_app/screens/home_screens/repair_works/single_repair_work.dart';
import 'package:orders_app/screens/login.dart';
import 'package:orders_app/screens/notifications.dart';
import 'package:orders_app/screens/rate.dart';
import 'package:orders_app/screens/search.dart';
import 'package:orders_app/services/cache_service.dart';
import 'package:orders_app/services/push_notification_service.dart';
import 'package:orders_app/stores/index.dart';

import 'config/api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initStores(navKey: myNavigatorKey);
  initApi();
  PushNotificationsService.init();
  await CacheService.init();
  runApp(MyApp());
}

final myNavigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //initialRoute: HomeScreen.name,
      initialRoute: authStore.authorised ? HomeScreen.name : LoginScreen.name,
      routes: {
        LoginScreen.name: (_) => LoginScreen(),
//        '/': (_) => SplashScreen(),
        HomeScreen.name: (_) => HomeScreen(),
        SingleOrderScreen.name: (_) => SingleOrderScreen(),
        SingleSiteScreen.name: (_) => SingleSiteScreen(),
        SingleRepairerScreen.name: (_) => SingleRepairerScreen(),
        SingleRepairWorkScreen.name: (_) => SingleRepairWorkScreen(),
        SingleTaskScreen.name: (_) => SingleTaskScreen(),
        AddOrderScreen.name: (_) => AddOrderScreen(),
        SearchScreen.name: (_) => SearchScreen(),
        NotificationsScreen.name: (_) => NotificationsScreen(),
        RateScreen.name: (_) => RateScreen(),
        SelectRepairerScreen.name: (_) => SelectRepairerScreen(),
      },
      navigatorKey: myNavigatorKey,
      theme: ThemeData(
          pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
          }),
          fontFamily: 'QuickSand',
          primaryColor: Colors.white,
          primarySwatch: Colors.blue,
          backgroundColor: Colors.white,
          accentColor: Colors.white,
          textTheme: TextTheme(display1: TextStyle())),
    );
  }
}
