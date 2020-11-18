import 'package:flutter/material.dart';
import 'package:orders_app/constants/colors.dart';
import 'package:orders_app/stores/index.dart';
import 'package:orders_app/style/index.dart';

class InfoBlock extends StatelessWidget {
  final String title, value, screenTitle;
  final Widget icon;

  InfoBlock({
    @required this.title,
    @required this.value,
    @required this.icon,
    @required this.screenTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      width: 185,
      margin: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 7,
      ),
      decoration: BoxDecoration(
        color: GKColors.white,
        borderRadius: BorderRadius.circular(25.0),
        boxShadow: blockShadow,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25.0),
        child: Material(
          child: InkWell(
            onTap: () {
              screenStore.setScreenByTitle(screenTitle);
            },
            child: Padding(
              padding: EdgeInsets.only(
                left: 12,
                right: 14,
                bottom: 20,
                top: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      icon,
                      Text(
                        value,
                        style: TextStyle(
                          color: GKColors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 47,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    title,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      //fontSize: 47,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
