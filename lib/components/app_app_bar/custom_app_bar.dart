import 'package:flutter/material.dart';

AppBar customAppBar({title,@required context,List<Widget> actions}) {
  return AppBar(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black87),
      elevation: 0,
      centerTitle: false,
      title: Text(title,
          style: Theme.of(context).textTheme.display1.apply(
              color: Colors.black87, fontWeightDelta: 2, fontSizeFactor: 0.8)),
      actions: actions
  );
}
