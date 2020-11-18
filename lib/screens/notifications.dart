import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:orders_app/components/app_app_bar/index.dart';
import 'package:orders_app/components/buttons/gk_outline_button.dart';
import 'package:orders_app/components/card_info/card_info.dart';
import 'package:orders_app/constants/colors.dart';
import 'package:orders_app/icons/orders_app_icons_icons.dart';
import 'package:orders_app/screens/home_screens/orders/index.dart';
import 'package:orders_app/screens/home_screens/repair_works/single_repair_work.dart';
import 'package:orders_app/screens/rate.dart';
import 'package:orders_app/services/helper_service.dart';
import 'package:orders_app/services/push_notification_service.dart';
import 'package:orders_app/stores/index.dart';
import 'package:orders_app/stores/notification_store/notification_model_store.dart';
import 'package:orders_app/stores/order_store/order_model_store.dart';

class NotificationsScreen extends StatelessWidget {
  static final String name = '/notifications';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: "Notifications"),
      body: Observer(
        builder: (_) => notificationStore.notifications.isEmpty
            ? Center(
                child: Text('No notifications'),
              )
            : ListView.builder(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                itemCount: notificationStore.notifications.length,
                itemBuilder: (context, index) =>
                    NotificationCard(notificationStore.notifications[index]),
              ),
      ),
    );
  }
}

class _RedirectButtonData {
  final String title;
  final String route;

  const _RedirectButtonData({this.title, this.route});
}

const _rateOrderButtonData = _RedirectButtonData(
  title: 'RATE ORDER',
  route: RateScreen.name,
);

const _goToOrderButtonData = _RedirectButtonData(
  title: 'GO TO ORDER',
  route: SingleOrderScreen.name,
);

const _goToRepairWorkButtonData = _RedirectButtonData(
  title: 'GO TO REPAIR WORK',
  route: SingleRepairWorkScreen.name,
);

class NotificationCard extends StatelessWidget {
  final NotificationModelStore notification;

  NotificationCard(this.notification);

  final buttonOptions = {
    NotificationType.orderCompleted: _rateOrderButtonData,
    NotificationType.newItemsAdded: _goToOrderButtonData,
    NotificationType.completedOrderCreated: _goToOrderButtonData,
    NotificationType.orderCreated: _goToOrderButtonData,
    NotificationType.quoteApproved: _goToRepairWorkButtonData,
    NotificationType.quoteRejected: _goToRepairWorkButtonData,
    NotificationType.techFinished: _goToRepairWorkButtonData,
    NotificationType.techAssisgned: _goToRepairWorkButtonData,
  };

  @override
  Widget build(BuildContext context) {
    final card = notification.card;
    final buttonData = buttonOptions[notification.type];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 25),
        Text(
          'NEW NOTIFICATION',
          style: TextStyle(
            color: GKColors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 15),
        CardInfo(
          text: notification.title,
        ),
        CardInfo(
          text: notification.body,
          primary: true,
        ),
        SizedBox(height: 10),
        if (card.createdDate != null)
          CardInfo(
            icon: OrdersAppIcons.calendar,
            text: stringDate(card.createdDate),
          ),
        CardInfo(
          icon: OrdersAppIcons.building,
          text: card.unit.name,
        ),
        CardInfo(
          icon: OrdersAppIcons.service,
          text: card.service.name,
        ),
        if (card is OrderModelStore && card.repairer != null)
          CardInfo(
            icon: OrdersAppIcons.user,
            text: card.repairer.name,
          ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(5),
          child: GKOutlineButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                buttonData.route,
                arguments: card,
              );
            },
            text: buttonData.title,
          ),
        ),
        Divider(),
      ],
    );
  }
}