import 'package:flutter/material.dart';
import 'package:orders_app/components/loading_indicator/gk_loader.dart';
import 'package:orders_app/constants/colors.dart';

class GKOutlineButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color color;
  final bool loading;

  const GKOutlineButton(
      {@required this.onPressed,
      @required this.text,
      this.color,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onPressed: onPressed,
      textColor: color ?? GKColors.green,
      borderSide: BorderSide(color: color ?? GKColors.green, width: 1.5),
      highlightedBorderColor: color ?? GKColors.green,
      child: loading
          ? GKLoader()
          : Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
    );
  }
}
