import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orders_app/components/loading_indicator/gk_loader.dart';
import 'package:orders_app/constants/colors.dart';

class GKButton extends StatelessWidget {
  final Function onTap;
  final String text;
  final bool loading;

  const GKButton({this.onTap, this.text, this.loading = false});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      borderRadius: BorderRadius.circular(12),
      color: GKColors.green,
      onPressed: onTap,
      child: loading
          ? SizedBox(
              height: 20,
              width: 20,
              child: GKLoader(),
            )
          : Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
    );
  }
}
