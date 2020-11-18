import 'package:flutter/material.dart';
import 'package:orders_app/constants/colors.dart';

class AddButton extends StatelessWidget {
  final String text;
  final Function onTap;

  const AddButton({
    this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: <Widget>[
          Icon(
            Icons.add,
            color: GKColors.green,
            size: 27,
          ),
          SizedBox(width: 5),
          Text(
            text ?? '',
            style: TextStyle(
              color: GKColors.green,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
