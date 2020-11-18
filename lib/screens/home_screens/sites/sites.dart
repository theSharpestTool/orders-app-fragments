import 'package:flutter/material.dart';
import 'package:orders_app/components/buttons/gk_outline_button.dart';
import 'package:orders_app/components/list_view/gk_list_view.dart';
import 'package:orders_app/constants/colors.dart';
import 'package:orders_app/icons/orders_app_icons_icons.dart';
import 'package:orders_app/screens/home_screens/components/no_items_icon.dart';
import 'package:orders_app/screens/home_screens/sites/single_site.dart';
import 'package:orders_app/services/helper_service.dart';
import 'package:orders_app/stores/index.dart';
import 'package:orders_app/stores/site_store/site_model_store.dart';
import 'package:orders_app/style/index.dart';

class SitesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GKListView(
      baseListStore: siteStore,
      itemBuilder: (context, index) => SitesCard(
        site: siteStore.data[index],
      ),
      noItemsIcon: NoItemsIconScrollable(
        icon: Icon(
          OrdersAppIcons.building,
          size: 70,
        ),
        text: 'NO SITES YET',
      ),
    );
  }
}

class SitesCard extends StatelessWidget {
  final double titleWidht;
  final SiteModelStore site;

  SitesCard({
    this.titleWidht,
    this.site,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 25.0,
        vertical: 20.0,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: GKColors.white,
        borderRadius: BorderRadius.circular(25.0),
        boxShadow: blockShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          LayoutBuilder(
            builder: (context, constraints) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(
                    OrdersAppIcons.building,
                    size: 60,
                  ),
                  Container(
                    width: titleWidht ?? constraints.maxWidth - 60,
                    child: Text(
                      site.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              );
            },
          ),
          Column(
            children: <Widget>[
              OrderRow(
                name: 'Ongoing Orders',
                number: site.ordersOnGoing.toString(),
                numberColor: GKColors.blue,
              ),
              OrderRow(
                name: 'SLA Compliance',
                number: percentage(site.slaCompliance),
              ),
              OrderRow(
                name: 'PPM Compliance',
                number: percentage(site.ppmCompliance),
              ),
            ],
          ),
          GKOutlineButton(
            text: 'See Details',
            onPressed: () {
              Navigator.of(context).pushNamed(
                SingleSiteScreen.name,
                arguments: site,
              );
            },
          ),
        ],
      ),
    );
  }
}

class OrderRow extends StatelessWidget {
  final String name;
  final String number;
  final Color numberColor;

  const OrderRow({
    @required this.name,
    @required this.number,
    this.numberColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 9.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            name,
            style: TextStyle(fontSize: 15),
          ),
          Text(
            number,
            style: TextStyle(
              fontSize: 15,
              color: numberColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
