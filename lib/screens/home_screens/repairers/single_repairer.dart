import 'package:flutter/material.dart';
import 'package:orders_app/components/card_block/gk_card.dart';
import 'package:orders_app/constants/colors.dart';
import 'package:orders_app/screens/home_screens/orders/single_order.dart';
import 'package:orders_app/screens/home_screens/repairers/repairers.dart';
import 'package:orders_app/stores/repairers_store/repairer_model_store.dart';

class SingleRepairerScreen extends StatelessWidget {
  static final String name = '/single_repairer';

  @override
  Widget build(BuildContext context) {
    final RepairerModelStore repairer =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(repairer.name),
        backgroundColor: GKColors.lightPurple,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: repairer.orders.length + 1,
          itemBuilder: (context, index) {
            if (index == 0)
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: RepairerContent(
                  repairer: repairer,
                ),
              );
            else
              return GKCard(
                order: repairer.orders[index - 1],
                onPressedRoute: SingleOrderScreen.name,
                defaultSvg: 'svgs/default_order.svg',
              );
          },
        ),
      ),
    );
  }
}
