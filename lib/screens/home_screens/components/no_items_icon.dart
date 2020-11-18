import 'package:flutter/material.dart';
import 'package:orders_app/constants/colors.dart';

class NoItemsIcon extends StatelessWidget {
  final Widget icon;
  final String text;

  const NoItemsIcon({@required this.icon, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(50),
            decoration: BoxDecoration(
              color: GKColors.lightGrey,
              shape: BoxShape.circle,
            ),
            child: icon,
          ),
          SizedBox(height: 25),
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class NoItemsIconScrollable extends StatelessWidget {
  final Widget icon;
  final String text;

  const NoItemsIconScrollable({this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: NoItemsIcon(
            icon: icon,
            text: text,
          ),
        ),
        ListView(),
      ],
    );
  }
}
