import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:orders_app/components/card_block/gk_card.dart';
import 'package:orders_app/components/loading_indicator/gk_loader.dart';
import 'package:orders_app/constants/colors.dart';
import 'package:orders_app/screens/home_screens/orders/index.dart';
import 'package:orders_app/screens/home_screens/sites/sites.dart';
import 'package:orders_app/screens/home_screens/statistics/statisctics.dart';
import 'package:orders_app/screens/home_screens/repair_works/single_repair_work.dart';
import 'package:orders_app/services/helper_service.dart';
import 'package:orders_app/stores/site_store/site_model_store.dart';

class SingleSiteScreen extends StatefulWidget {
  static final String name = '/single_site';

  @override
  _SingleSiteScreenState createState() => _SingleSiteScreenState();
}

class _SingleSiteScreenState extends State<SingleSiteScreen> {
  @override
  Widget build(BuildContext context) {
    final SiteModelStore site = ModalRoute.of(context).settings.arguments;
    site.loadBudgets();
    site.loadPPM();
    site.loadSLA();
    site.loadDetails();
    final cardHeight = (2 * MediaQuery.of(context).size.width / 3) + 10;
    return Scaffold(
      appBar: AppBar(
        title: Text(site.name),
        backgroundColor: GKColors.lightPurple,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Observer(
          builder: (_) {
            final orders = site.orders;
            final completedOrders = site.completedOrders;
            return ListView(
              children: [
                SiteLabel(
                  site: site,
                ),
                Statistics(
                  site: site,
                ),
                Divider(),
                DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        child: Container(
                          color: GKColors.green.withOpacity(0.05),
                          child: TabBar(
                            indicatorColor: GKColors.green,
                            labelColor: GKColors.green,
                            unselectedLabelColor: Colors.black,
                            tabs: [
                              Tab(text: 'Ongoing Orders'),
                              Tab(text: 'Ongoing Repair Works'),
                            ],
                          ),
                        ),
                      ),
                      site.loading
                          ? Padding(
                            padding: const EdgeInsets.only(top: 18.0),
                            child: GKLoader(),
                          )
                          : Container(
                              height: max(orders.length, completedOrders.length)
                                      .toDouble() *
                                  cardHeight,
                              child: TabBarView(
                                children: [
                                  orders.isEmpty
                                      ? Align(
                                          alignment: Alignment.topCenter,
                                          child: Text('No Orders'),
                                        )
                                      : Column(
                                          children: [
                                            for (final order in orders)
                                              GKCard(
                                                order: order,
                                                onPressedRoute:
                                                    SingleOrderScreen.name,
                                                defaultSvg:
                                                    'svgs/default_order.svg',
                                              )
                                          ],
                                        ),
                                  completedOrders.isEmpty
                                      ? Align(
                                          alignment: Alignment.topCenter,
                                          child: Text('No Repair Works'),
                                        )
                                      : Column(
                                          children: [
                                            for (final completedOrder in completedOrders)
                                              GKCard(
                                                order: completedOrder,
                                                onPressedRoute:
                                                    SingleRepairWorkScreen.name,
                                                defaultSvg:
                                                    'svgs/default_order.svg',
                                              )
                                          ],
                                        ),
                                ],
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class SiteLabel extends StatelessWidget {
  final screenWidthLimit = 350;
  final SiteModelStore site;

  SiteLabel({@required this.site});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(height: 8),
                  OrderRow(
                    name: 'PPM Compliance',
                    number: percentage(site.ppmCompliance),
                  ),
                  OrderRow(
                    name: 'SLA Compliance',
                    number: percentage(site.slaCompliance),
                  ),
                  OrderRow(
                    name: 'Work Budget',
                    number: site.budgetPerSite == null
                        ? '0'
                        : site.budgetPerSite.total.toInt().toString(),
                  ),
                ],
              ),
            ),
            if (MediaQuery.of(context).size.width > screenWidthLimit) ...[
              SizedBox(width: 15),
              Expanded(child: OrdersInfo(site: site))
            ],
          ],
        ),
        Divider(),
        if (MediaQuery.of(context).size.width < screenWidthLimit) ...[
          OrdersInfo(site: site),
          Divider(),
        ],
      ],
    );
  }
}

class OrdersInfo extends StatelessWidget {
  const OrdersInfo({
    Key key,
    @required this.site,
  }) : super(key: key);

  final SiteModelStore site;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(height: 8),
        OrderRow(
          name: 'Ongoing Orders',
          number: site.ordersOnGoing.toString(),
          numberColor: GKColors.blue,
        ),
        OrderRow(
          name: 'Ongoing Repair Works',
          number: site.completedOrdersOnGoing.toString(),
          numberColor: GKColors.blue,
        ),
        OrderRow(
          name: 'Orders Declined',
          number: site.ordersDeclined.toString(),
          numberColor: Colors.red,
        ),
        OrderRow(
          name: 'Orders Completed',
          number: site.ordersCompleted.toString(),
          numberColor: GKColors.green,
        ),
      ],
    );
  }
}
