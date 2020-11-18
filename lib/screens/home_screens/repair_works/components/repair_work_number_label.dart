import 'package:flutter/material.dart';
import 'package:orders_app/components/card_block/gk_card.dart';
import 'package:orders_app/components/card_info/card_info.dart';
import 'package:orders_app/stores/repair_work_store/repair_work_model_store.dart';

class RepairWorkNumberLabel extends StatelessWidget {
  const RepairWorkNumberLabel({
    Key key,
    @required this.completedOrder,
  }) : super(key: key);

  final RepairWorkModelStore completedOrder;

  @override
  Widget build(BuildContext context) {
    return CardInfo(
      options: <Widget>[
        if (completedOrder.deadline != null) DeadlineTimer(order: completedOrder),
      ],
      text: "#W${completedOrder.serial}",
      primary: true,
    );
  }
}