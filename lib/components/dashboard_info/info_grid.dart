import 'package:flutter/material.dart';
import 'package:orders_app/components/row_spacer/index.dart';

class InfoGrid extends StatefulWidget {
  final List<Widget> children;

  InfoGrid({this.children});

  @override
  _InfoGridState createState() => _InfoGridState();
}

class _InfoGridState extends State<InfoGrid> {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _getRows(widget.children));
  }
}

List<Widget> _getRows(List<Widget> blocks) {
  int count = blocks.length;
  int numRows = (count / 2).ceil();
  List<Widget> rows = [];

  for (var i = 0; i < numRows; i++) {
    rows.add(Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: (count - 1) >= ((i * 2) + 1)
            ? <Widget>[blocks[i * 2], RowSpacer(width: 15), blocks[(i * 2) + 1]]
            : [
                blocks[i * 2],
              ],
      ),
    ));
  }

  return rows;
}
