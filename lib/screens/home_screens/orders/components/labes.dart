import 'package:flutter/material.dart';
import 'package:orders_app/stores/order_store/order_model_store.dart';

class OrderDescription extends StatelessWidget {
  const OrderDescription({
    @required this.order,
  });

  final OrderModelStore order;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 10, top: 10),
          child: Text(
            'Description',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Text(
          order.description,
          softWrap: true,
        ),
        SizedBox(
          height: 15,
        )
      ],
    );
  }
}