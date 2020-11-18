import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orders_app/components/card_info/card_info.dart';
import 'package:orders_app/components/subtitle/index.dart';
import 'package:orders_app/constants/colors.dart';
import 'package:orders_app/icons/orders_app_icons_icons.dart';

class CM extends StatefulWidget {
  @override
  _CMState createState() => _CMState();
}

class _CMState extends State<CM> {
  final List<dynamic> options = [
    {"title": "Alaminum Work", "value": true},
    {"title": "Carpentry", "value": false},
    {"title": "Civil work & Renovation", "value": true},
    {"title": "Cleaning", "value": true},
    {"title": "Electrical", "value": true},
    {"title": "HVAC", "value": true},
    {"title": "Lighting", "value": true},
    {"title": "Pest Control", "value": true},
    {"title": "Pluming", "value": true},
    {"title": "Swimming Pool", "value": true},
    {"title": "Telecom / TV", "value": true},
    {"title": "Waste Management", "value": true},
    {"title": "White Goods", "value": true},
    {"title": "Generator", "value": true},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SubTitle(text: "Subscription Name"),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              Icon(OrdersAppIcons.calendar),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  "Start Date:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  "06 Sept 2019",
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 15, bottom: 15),
            child: Row(
              children: <Widget>[
                Icon(OrdersAppIcons.calendar),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    "Renew Date:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    "06 Sept 2019",
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            height: 0.5,
            color: Colors.blueGrey,
          ),
          Text(
            "Service List",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Container(
            child: Expanded(
                child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              childAspectRatio: 21 / 9,
              children: options
                  .map((f) => Row(
                        children: <Widget>[
                          Checkbox(
                            activeColor: GKColors.green,
                            value: f['value'],
                            onChanged: (value) {
                              setState(() {
                                f['value'] = value;
                              });
                            },
                          ),
                          Expanded(
                              child: Text(
                            f['title'],
                            softWrap: true,
                          ))
                        ],
                      ))
                  .toList(),
            )),
          ),
        ],
      ),
    );
  }
}

class PPM extends StatefulWidget {
  @override
  _PPMState createState() => _PPMState();
}

class _PPMState extends State<PPM> {
  final controller = PageController();
  num _groupValue = 0;
  final List<dynamic> options = [
    {"title": "Alaminum Work", "value": true},
    {"title": "Carpentry", "value": false},
    {"title": "Civil work & Renovation", "value": true},
    {"title": "Cleaning", "value": true},
    {"title": "Electrical", "value": true},
    {"title": "HVAC", "value": true},
    {"title": "Lighting", "value": true},
    {"title": "Pest Control", "value": true},
    {"title": "Pluming", "value": true},
    {"title": "Swimming Pool", "value": true},
    {"title": "Telecom / TV", "value": true},
    {"title": "Waste Management", "value": true},
    {"title": "White Goods", "value": true},
    {"title": "Generator", "value": true},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SubTitle(text: "Title"),
          SectionTitle(text: "Sites"),
          CardInfo(
            icon: OrdersAppIcons.building,
            text: "Site: 7952 Dogwood Ave Farmers Branch",
            subtext: "Unit: 7466",
          ),
          CardInfo(
            icon: OrdersAppIcons.building,
            text: "Site: 7952 Dogwood Ave Farmers Branch",
            subtext: "Unit: 7466",
          ),
          Splitter(),
          SectionTitle(
            text: "Frequency",
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 20),
            child: CupertinoSegmentedControl<int>(
              children: <int, Widget>{
                0: Text("Monthly"),
                1: Text("Quarterly"),
                2: Text("Annually"),
              },
              onValueChanged: (value) {
                controller.animateToPage(
                  value,
                  duration: Duration(milliseconds: 200),
                  curve: Curves.linear,
                );
              },
              groupValue: _groupValue,
              selectedColor: GKColors.green,
              borderColor: GKColors.green,
              pressedColor: GKColors.green.withOpacity(0.15),
            ),
          ),
          SectionTitle(text: "Assets"),
          Expanded(
            child: PageView(
              controller: controller,
              onPageChanged: (page) {
                setState(() {
                  _groupValue = page;
                });
              },
              children: <Widget>[
                _buildAssets(),
                _buildAssets(),
                _buildAssets(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAssets() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: 21 / 9,
      children: options
          .map((f) => Row(
                children: <Widget>[
                  Checkbox(
                    activeColor: GKColors.green,
                    value: f['value'],
                    onChanged: (value) {
                      f['value'] = value;
                    },
                  ),
                  Expanded(
                    child: Text(
                      f['title'],
                      softWrap: true,
                    ),
                  )
                ],
              ))
          .toList(),
    );
  }
}

class SubscriptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          bottom: PreferredSize(
            preferredSize: Size(0, 0),
            child: TabBar(
              indicatorColor: GKColors.green,
              labelColor: GKColors.green,
              unselectedLabelColor: Colors.black,
              tabs: <Widget>[
                Tab(text: "CM"),
                Tab(text: "PPM"),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[CM(), PPM()],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String text;

  SectionTitle({this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Text(
        text,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class Splitter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.4,
      color: Colors.blueGrey,
      margin: EdgeInsets.symmetric(vertical: 20),
    );
  }
}
