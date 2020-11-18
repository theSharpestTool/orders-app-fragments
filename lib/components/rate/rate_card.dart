import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:orders_app/components/card_info/index.dart';
import 'package:orders_app/components/rate/gk_rating_bar.dart';
import 'package:orders_app/icons/orders_app_icons_icons.dart';
import 'package:orders_app/screens/rate.dart';
import 'package:orders_app/stores/order_store/order_model_store.dart';

class RateCard extends StatelessWidget {
  final OrderModelStore order;

  RateCard({@required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.blueGrey,
          width: .2,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Observer(
        builder: (_) => Column(
          children: <Widget>[
            CardInfo(
              icon: OrdersAppIcons.calendar,
              text: order.ratingDetails.createDateString,
            ),
            CardInfo(
              icon: OrdersAppIcons.building,
              text: order.unit.name,
            ),
            CardInfo(
              icon: OrdersAppIcons.gear,
              text: order.fault.name,
            ),
            if (order.repairer != null)
              CardInfo(
                icon: OrdersAppIcons.user,
                text: order.repairer.name,
              ),
            GKRatingBar(
              initialRating: order.ratingDetails.rating,
              onRatingUpdate: (rating) {
                order.setRating(rating);
                Navigator.of(context)
                    .pushNamed(RateScreen.name, arguments: order);
              },
            ),
          ],
        ),
      ),
    );
  }
}
