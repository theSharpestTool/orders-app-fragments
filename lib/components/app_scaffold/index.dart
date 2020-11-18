import 'package:flutter/material.dart';

class AppScaffold extends StatefulWidget {
  final Widget appBar, bottomNavBar, body;

  AppScaffold({this.appBar,this.body,this.bottomNavBar});

  @override
  _AppScaffoldState createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        widget.appBar,
        widget.body,
        widget.bottomNavBar
      ],
    );
  }
}
