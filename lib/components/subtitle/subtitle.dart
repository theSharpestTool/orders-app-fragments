
import 'package:flutter/material.dart';

class SubTitle extends StatelessWidget {
  final String text;
  final List<Widget> actions;


  SubTitle({
    Key key,
    this.text = "",
    this.actions
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(text,
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold
            ),
          ),
          if(actions != null)
            ...actions
        ],),
    );
  }
}