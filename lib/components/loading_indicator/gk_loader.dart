import 'package:flutter/material.dart';
import 'package:orders_app/constants/colors.dart';

class GKLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      backgroundColor: GKColors.green,
    );
  }
}
