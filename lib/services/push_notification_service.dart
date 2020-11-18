import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:orders_app/components/dialogs/gk_dialog.dart';
import 'package:orders_app/screens/home_screens/orders/index.dart';
import 'package:orders_app/screens/home_screens/repair_works/single_repair_work.dart';
import 'package:orders_app/stores/base_store/base_list_store.dart';
import 'package:orders_app/stores/card_store/card_model_store.dart';
import 'package:orders_app/stores/index.dart';
import 'package:orders_app/stores/order_store/order_model_store.dart';
import 'package:orders_app/stores/repair_work_store/repair_work_model_store.dart';

enum NotificationType {
  orderCreated,
  quoteApproved,
  quoteRejected,
  techFinished,
  completedOrderCreated,
  newItemsAdded,
  orderCompleted,
  techAssisgned,
}

final notificationBody = {
  NotificationType.orderCreated: 'New order was created',
  NotificationType.quoteApproved: 'Quotation approved',
  NotificationType.quoteRejected: 'Quotation rejected',
  NotificationType.techFinished: 'Repairer finished the job',
  NotificationType.completedOrderCreated: 'The order is waiting for your approval',
  NotificationType.newItemsAdded: 'The order is waiting for your approval',
  NotificationType.orderCompleted: 'The order is complete',
  NotificationType.techAssisgned: 'The new Repair Work assigned',
};

final notificationTitle = {
  NotificationType.orderCreated: 'Order',
  NotificationType.quoteApproved: 'Repair Work',
  NotificationType.quoteRejected: 'Repair Work',
  NotificationType.techFinished: 'Repair Work',
  NotificationType.completedOrderCreated: 'Order',
  NotificationType.newItemsAdded: 'Order',
  NotificationType.orderCompleted: 'Order',
  NotificationType.techAssisgned: 'Repair Work',
};

class PushNotificationsService {
  PushNotificationsService._();

  factory PushNotificationsService() => _instance;

  static final PushNotificationsService _instance =
      PushNotificationsService._();

  static final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  static bool _initialized = false;
  static final List<String> _subscriptions = [];

  static final _managerSite = 'managersite';
  static final _order = 'order';

  static Future<void> init() async {
    if (!_initialized) {
      _firebaseMessaging.orderNotificationPermissions();
      _firebaseMessaging.configure(
        onLaunch: _onMessage,
        onResume: _onMessage,
        // onMessage: (Map<String, dynamic> message) async {
        //   final typeInt = int.parse(message['data']['type']);
        //   final type = NotificationType.values[typeInt];
        //   final title = message['notification']['title'];
        //   GKDialog.show(
        //     buttonText: 'Go To $title',
        //     onTap: () => _onMessage(message),
        //     text: notificationBody[type],
        //     reason: DialogReason.success,
        //   );
        // },
      );

      String token = await _firebaseMessaging.getToken();
      print("FirebaseMessaging token: $token");

      _initialized = true;
    }
  }

  static Future<void> _onMessage(Map<String, dynamic> message) async {
    final typeInt = int.parse(message['type']);
    final type = NotificationType.values[typeInt];
    print(type);
    final baseId = message['baseId'];
    final redirectPageName = notificationTitle[type];
    if (redirectPageName == 'Repair Work') {
      _goToRepairWork(baseId);
    } else if (redirectPageName == 'Order') {
      _goToOrder(baseId, type != NotificationType.orderCreated);
    }
  }

  static Future<void> subscribeForAll({BaseListStore store, String tag}) async {
    for (final base in store.data) {
      print('SUBSCRIBE $tag${base.id}');
      final topic = '$tag${base.id}';
      await _firebaseMessaging.subscribeToTopic(topic);
      _subscriptions.add(topic);
    }
  }

  static Future<void> subscribeForAllManagerSites() =>
      subscribeForAll(store: siteStore, tag: _managerSite);
  static Future<void> subscribeForAllOrders() =>
      subscribeForAll(store: orderStore, tag: _order);

  static Future<void> subscribeToOrder(String orderId) async {
    final topic = '$_order$orderId';
    await _firebaseMessaging.subscribeToTopic(topic);
    _subscriptions.add(topic);
  }

  static Future<void> subscribeForRepairer(String id) async {
    await _firebaseMessaging.subscribeToTopic(id);
    _subscriptions.add(id);
  }

  static Future<void> unsubscribeFromAll() async {
    for (final topic in _subscriptions) {
      print('UNSUBSCRIBE $topic');
      await _firebaseMessaging.unsubscribeFromTopic(topic);
    }
    _subscriptions.clear();
  }

  static Future<void> _goToSinglePage(
      {BaseListStore store, String id, String routeName}) async {
    await store.load();
    final base = store.get(id);
    if (base != null) {
      navStore.navigator.pushNamed(
        routeName,
        arguments: base,
      );
    }
  }

  static Future<void> _goToOrder(String id, bool loadRepairWorks) async {
    if (loadRepairWorks) {
      completedOrderStore.clear();
      print('LOAD REPAIR WORKS');
      await completedOrderStore.load();
      print('LOADED REPAIR WORKS');
    }
    _goToSinglePage(
        store: orderStore, id: id, routeName: SingleOrderScreen.name);
  }

  static Future<void> _goToRepairWork(String id) => _goToSinglePage(
      store: completedOrderStore, id: id, routeName: SingleRepairWorkScreen.name);

  static Future<void> _sendEvent(
      {CardModelStore card, NotificationType type, String topic}) {
    return _NotificationsApi.post(
      topic: topic,
      serial: card.serial,
      baseId: card.id,
      type: type,
    );
  }

  static Future<void> sendManagerEvent(
          {CardModelStore card, NotificationType type}) =>
      _sendEvent(
          card: card, type: type, topic: '$_managerSite${card.unit.site.id}');

  static Future<void> sendClientEvent(
          {OrderModelStore order, NotificationType type}) =>
      _sendEvent(card: order, type: type, topic: '$_order${order.id}');

  static Future<void> sendRepairerEvent(
          {RepairWorkModelStore completedOrder,
          NotificationType type,
          String techId}) =>
      _sendEvent(card: completedOrder, type: type, topic: techId);
}

class _NotificationsApi {
  static Future<Response> post(
      {String topic, String baseId, num serial, NotificationType type}) async {
    final api = Dio();
    final serverKey =
        'AAAAMs3Lefc:APA91bF5Greo56eujTJKxMTnKonqmRhM4kDqOybnDC1__xa1EWzd0ylJYfeV-joeuwMYP4SZKM47UrT6C0zBH1YjGEJ6dkF5cUwVWCj6tSvz8CtuvGg2dXRkR5q9c-vNl9DAcPM8ZDlM';
    final endpoint = 'https://fcm.googleapis.com/fcm/send';
    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'key=$serverKey',
    };

    final response = await api.post(
      endpoint,
      options: Options(
        headers: headers,
      ),
      data: {
        'notification': {
          'body': notificationBody[type],
          'title': '${notificationTitle[type]} #$serial',
          'sound': 'default',
        },
        'priority': 'high',
        'data': {
          'click_action': 'FLUTTER_NOTIFICATION_CLICK',
          'id': '1',
          'status': 'done',
          'baseId': baseId,
          'type': type.index
        },
        'to': '/topics/$topic'
      },
    );
    return response;
  }
}
