import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardInfo extends StatelessWidget {
  final icon;
  final String text, subtext;
  final bool primary;
  final bool last;
  final Color color;

  final List<Widget> options;

  CardInfo(
      {this.icon,
      this.text,
      this.subtext,
      this.primary = false,
      this.last = false,
      this.options,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: last ? 0 : 10),
      child: Row(
        children: <Widget>[
          if (icon != null)
            icon is IconData ? Icon(icon) : SvgPicture.asset(icon),
          Container(
            margin: icon != null ? EdgeInsets.only(left: 10) : null,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  text,
                  style: TextStyle(
                    fontWeight: primary ? FontWeight.bold : FontWeight.normal,
                    color: color,
                  ),
                ),
                if (subtext != null)
                  Text(
                    subtext,
                    style: TextStyle(
                      fontWeight: primary ? FontWeight.bold : FontWeight.normal,
                      color: color,
                    ),
                  ),
              ],
            ),
          ),
          Spacer(),
          if (options != null) ...options
        ],
      ),
    );
  }
}
