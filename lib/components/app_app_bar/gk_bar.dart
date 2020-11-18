import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:orders_app/components/text_fields/search_field.dart';
import 'package:orders_app/icons/orders_app_icons_icons.dart';
import 'package:orders_app/screens/home_screens/screen_manager.dart';
import 'package:orders_app/screens/notifications.dart';
import 'package:orders_app/stores/index.dart';
import 'package:orders_app/stores/user_store/user_store.dart';

// ignore: non_constant_identifier_names
AppBar GKAppBar(
    {BuildContext context,
    String title,
    Color backgroundColor,
    Color iconColor}) {
  return AppBar(
    backgroundColor: backgroundColor ?? Colors.white,
    iconTheme: IconThemeData(color: iconColor ?? Colors.black87),
    elevation: 2,
    centerTitle: false,
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(
          left: 12.0,
          top: 10,
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.display1.apply(
                color: iconColor ?? Colors.black87,
                fontWeightDelta: 2,
                fontSizeFactor: 0.8,
              ),
        ),
      ),
      OrdersAppActions(),
    ],
  );
}

class OrdersAppActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Expanded(
        child: Row(
          children: <Widget>[
            if (screenStore.searchFieldOpen)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: SearchField(
                    suggestionsCallback: (pattern) async {
                      final currentStore = screenStore.currentScreen.store;
                      Future.delayed(Duration(milliseconds: 1)).then((value) {
                        currentStore?.search(pattern);
                      });
                      return null;
                    },
                    onClose: () {
                      screenStore.openSearchFiled(false);
                    },
                  ),
                ),
              ),
            if (!screenStore.searchFieldOpen) ...[
              Spacer(),
              if (userStore.role == Role.manager)
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Hero(
                        tag: 'searchIcon', child: Icon(OrdersAppIcons.logout)),
                  ),
                  onTap: authStore.logout,
                ),
              if (screenStore.currentScreen == ordersScreen ||
                  screenStore.currentScreen == tasksScreen ||
                  screenStore.currentScreen == completedOrderScreen)
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(OrdersAppIcons.search),
                  ),
                  onTap: () {
                    screenStore.openSearchFiled(true);
                  },
                ),
              NotificationsButton(),
            ]
          ],
        ),
      ),
    );
  }
}

class NotificationsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      child: Observer(
        builder: (_) => Stack(
          alignment: Alignment.center,
          children: <Widget>[
            InkWell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  OrdersAppIcons.bell,
                  color: notificationStore.isEmpty ? Colors.black : Colors.red,
                ),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(NotificationsScreen.name);
              },
            ),
            if (!notificationStore.isEmpty)
              Positioned(
                right: 6,
                top: 7,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  constraints: BoxConstraints(
                    minWidth: 14,
                    minHeight: 14,
                  ),
                  padding: EdgeInsets.all(2),
                  alignment: Alignment.topCenter,
                  child: Text(
                    notificationStore.length.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
