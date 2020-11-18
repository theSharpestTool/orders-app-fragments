import 'package:flutter/material.dart';
import 'package:orders_app/components/buttons/gk_outline_button.dart';
import 'package:orders_app/components/list_view/gk_list_view.dart';
import 'package:orders_app/constants/colors.dart';
import 'package:orders_app/icons/orders_app_icons_icons.dart';
import 'package:orders_app/screens/home_screens/components/no_items_icon.dart';
import 'package:orders_app/screens/home_screens/repairers/single_repairer.dart';
import 'package:orders_app/stores/index.dart';
import 'package:orders_app/stores/repairers_store/repairer_model_store.dart';
import 'package:orders_app/style/shadow.dart';

class RepairersScreen extends StatelessWidget {
  const RepairersScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GKListView(
      baseListStore: repairerStore,
      itemBuilder: (context, index) => RepairerDetailedCard(
        repairer: repairerStore.data[index],
      ),
      noItemsIcon: NoItemsIconScrollable(
        text: 'NO REPAIRERS',
        icon: Icon(
          OrdersAppIcons.service,
          size: 70,
        ),
      ),
    );
  }
}

class RepairerDetailedCard extends StatelessWidget {
  final RepairerModelStore repairer;

  RepairerDetailedCard({
    this.repairer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 25.0,
        vertical: 20.0,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        color: GKColors.white,
        borderRadius: BorderRadius.circular(25.0),
        boxShadow: blockShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RepairerContent(
            repairer: repairer,
          ),
          GKOutlineButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                SingleRepairerScreen.name,
                arguments: repairer,
              );
            },
            text: 'DETAILS',
          )
        ],
      ),
    );
  }
}

class RepairerContent extends StatelessWidget {
  final RepairerModelStore repairer;

  const RepairerContent({
    @required this.repairer,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.memory(
            repairer.profileImage,
            width: 100,
            height: 100,
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Row(
              children: <Widget>[
                //Text('4.8'),
                SizedBox(width: 7),
                Icon(
                  OrdersAppIcons.full,
                  color: GKColors.gold,
                )
              ],
            ),
            SizedBox(
              width: 180,
              child: Text(
                repairer.name,
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text('Repairer'),
            SizedBox(height: 10),
            Text('Current workload:'),
            Text(
              '${repairer.ordersAmount} Orders assigned',
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        )
      ],
    );
  }
}
