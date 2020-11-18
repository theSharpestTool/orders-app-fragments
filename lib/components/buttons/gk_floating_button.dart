import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orders_app/constants/colors.dart';
import 'package:orders_app/screens/home_screens/orders/add_order.dart';

class GKFloattingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: SvgPicture.asset(
        'svgs/add.svg',
        width: 35,
      ),
      backgroundColor: GKColors.lightGreen,
      onPressed: () async {
        Navigator.of(context).pushNamed(AddOrderScreen.name);
      },
    );
  }
}
