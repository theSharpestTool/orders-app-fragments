import 'package:flutter/material.dart';
import 'package:orders_app/components/buttons/gk_outline_button.dart';
import 'package:orders_app/constants/colors.dart';
import 'package:orders_app/icons/orders_app_icons_icons.dart';
import 'package:orders_app/stores/repairers_store/repairer_model_store.dart';
import 'package:orders_app/style/index.dart';

class SelectRepairerScreen extends StatelessWidget {
  static final String name = '/select_repairer';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select a repairer'),
      ),
      body: ListView(
        children: <Widget>[
          RepairerCard(),
          RepairerCard(),
          RepairerCard(),
          RepairerCard(),
        ],
      ),
    );
  }
}

class RepairerCard extends StatelessWidget {
  final Function onSelected;
  final RepairerModelStore repairer;

  const RepairerCard({this.onSelected, this.repairer});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 25.0,
        vertical: 15.0,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: GKColors.white,
        borderRadius: BorderRadius.circular(25.0),
        boxShadow: blockShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.memory(
                  repairer.profileImage,
                  width: 70,
                  height: 70,
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  SizedBox(
                    width: 100,
                    child: Text(
                      repairer.name,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: <Widget>[
                      //Text('4.8'),
                      SizedBox(width: 7),
                      Icon(
                        OrdersAppIcons.full,
                        color: GKColors.gold,
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 10),
          GKOutlineButton(
            onPressed: () {
              if (onSelected != null) onSelected();
            },
            text: 'SELECT REPAIRER',
          )
        ],
      ),
    );
  }
}
