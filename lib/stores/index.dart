import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:orders_app/services/push_notification_service.dart';
import 'package:orders_app/stores/fault_store/fault_store.dart';
import 'package:orders_app/stores/kpi_store/kpi_store.dart';
import 'package:orders_app/stores/notification_store/notification_store.dart';
import 'package:orders_app/stores/part_store/part_store.dart';
import 'package:orders_app/stores/order_store/order_store.dart';
import 'package:orders_app/stores/screens_store/screen_store.dart';
import 'package:orders_app/stores/service_store/service_store.dart';
import 'package:orders_app/stores/site_store/site_store.dart';
import 'package:orders_app/stores/sub_service_store/sub_service_store.dart';
import 'package:orders_app/stores/task_store/task_store.dart';
import 'package:orders_app/stores/repairers_store/repairer_store.dart';
import 'package:orders_app/stores/tool_store/tool_store.dart';
import 'package:orders_app/stores/unit_store/unit_store.dart';
import 'package:orders_app/stores/repair_work_store/repair_work_store.dart';

import 'auth_store/auth_store.dart';
import 'nav_store/nav_store.dart';
import 'user_store/user_store.dart';

AuthStore authStore = AuthStore();
UserStore userStore = UserStore();
SiteStore siteStore = SiteStore();
UnitStore unitStore = UnitStore();
ServiceStore serviceStore = ServiceStore();
SubServiceStore subServiceStore = SubServiceStore();
FaultStore faultStore = FaultStore();
OrderStore orderStore = OrderStore();
RepairWorkStore completedOrderStore = RepairWorkStore();
RepairerStore repairerStore = RepairerStore();
PartStore partStore = PartStore();
ToolStore toolStore = ToolStore();
TaskStore taskStore = TaskStore();
ScreenStore screenStore = ScreenStore();
NotificationStore notificationStore = NotificationStore();
//KPIStore kpiStore = KPIStore();
NavStore navStore;

Future<void> initStores({GlobalKey<NavigatorState> navKey}) async {
  navStore = NavStore(navKey: navKey);
  authStore.token = await FlutterSecureStorage().read(key: 'token');
  authStore.setAuthorizationHeader();
  if (authStore.token != null) await userStore.load();
}

void loadStores() {
  orderStore.load(checkCache: true).then((_) async {
    if (userStore.role == Role.client)
      await PushNotificationsService.subscribeForAllOrders();
    if (userStore.role == Role.manager)
      PushNotificationsService.subscribeForAllManagerSites();
    else if (userStore.role == Role.repairer)
      PushNotificationsService.subscribeForRepairer(userStore.userId);
  });
  siteStore.load(checkCache: true);
  completedOrderStore.load(checkCache: true);
  repairerStore.load(checkCache: true);
  taskStore.load(checkCache: true);
}
