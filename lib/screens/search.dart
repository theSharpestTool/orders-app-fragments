import 'package:flutter/material.dart';
import 'package:orders_app/icons/orders_app_icons_icons.dart';

class SearchScreen extends StatelessWidget {
  static final String name = '/search';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: Container(
          padding: EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.black45, width: 0.3),
          ),
          child: TextField(
            style: TextStyle(color: Colors.blue),
            decoration: InputDecoration(
              hintText: "Search",
              border: InputBorder.none,
              focusColor: Colors.orange,
              suffixIcon: InkWell(
                  child: Hero(tag: 'searchIcon', child: Icon(OrdersAppIcons.search)),
                  onTap: () {
                    Navigator.of(context).pushNamed('/search');
                  },
                ),
              )
            ),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[],
        ),
      ),
    );
  }
}
