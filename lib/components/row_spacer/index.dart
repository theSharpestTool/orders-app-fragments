import 'package:flutter/material.dart';

class RowSpacer extends StatelessWidget {
  final double width;
  RowSpacer({this.width});

  @override
  Widget build(BuildContext context) {
    return Container(width:width);
  }
}
