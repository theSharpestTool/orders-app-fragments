import 'package:flutter/material.dart';
import 'package:orders_app/constants/colors.dart';
import 'package:orders_app/style/index.dart';

class NotificationBlock extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final IconData icon;
  final bool read;

  NotificationBlock(
      {this.title = "Title",
      this.description = "",
      this.icon,
      this.read = false,
      this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeDim.containerPad,
      decoration: BoxDecoration(
          color: read ? Colors.white : GKColors.lightBlue,
          borderRadius: BorderDim.borderRadius,
          border: BorderDim.border),
      child:
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Transform.translate(
              child: Container(
                decoration: BoxDecoration(
                    color: GKColors.blue,
                    borderRadius: BorderRadius.circular(50)),
                padding: EdgeInsets.all(8),
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.white70,
                ),
              ),
              offset: Offset(-20, -20),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(title,
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: Text(
                      description,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Text(
                    date,
                    style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black54),
                  )
                ],
              ),
            ),
            if (!read)
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                    borderRadius: BorderDim.borderRadius,
                    color: GKColors.blue),
              )
          ],
        )
    );
  }
}
