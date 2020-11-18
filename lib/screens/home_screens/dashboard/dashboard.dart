import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:orders_app/components/buttons/gk_floating_button.dart';
import 'package:orders_app/components/dashboard_info/index.dart';
import 'package:orders_app/components/loading_indicator/gk_loader.dart';
import 'package:orders_app/components/rate/rate_card.dart';
import 'package:orders_app/components/subtitle/index.dart';
import 'package:orders_app/constants/colors.dart';
import 'package:orders_app/icons/orders_app_icons_icons.dart';
import 'package:orders_app/screens/home_screens/screen_manager.dart';
import 'package:orders_app/screens/home_screens/sites/sites.dart';
import 'package:orders_app/stores/index.dart';
import 'package:orders_app/stores/user_store/user_store.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          userStore.role == Role.client || userStore.role == Role.leaser
              ? GKFloattingButton()
              : null,
      body: RefreshIndicator(
        onRefresh: () async {
          await orderStore.load(withLoadingIndicator: false);
          await siteStore.load(withLoadingIndicator: false);
        },
        backgroundColor: GKColors.green,
        child: Observer(
          builder: (_) => ListView(
            padding: EdgeInsets.all(15.0),
            children: <Widget>[
              Text(
                '  Home',
                style: TextStyle(
                  color: GKColors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InfoBlocksRow(
                role: userStore.role,
              ),
              if (userStore.role == Role.leaser ||
                  userStore.role == Role.client)
                ReviewsList(),
              if (userStore.role == Role.manager)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'MY SITES',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    siteStore.loading || orderStore.loading
                        ? Padding(
                            padding: const EdgeInsets.all(140.0),
                            child: Center(
                              child: GKLoader(),
                            ),
                          )
                        : Container(
                            height: 315,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: siteStore.data.length,
                              itemBuilder: (context, index) => SizedBox(
                                width: 300,
                                child: SitesCard(
                                  titleWidht: 120,
                                  site: siteStore.data[index],
                                ),
                              ),
                            ),
                          ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoBlocksRow extends StatelessWidget {
  final Role role;

  const InfoBlocksRow({@required this.role});

  @override
  Widget build(BuildContext context) {
    final _ordersCreated = Observer(
      builder: (_) => InfoBlock(
        icon: Icon(
          OrdersAppIcons.order,
          size: 40,
        ),
        title: "ORDERS CREATED",
        value: orderStore.totalRequsetsCount.toString(),
        screenTitle: ScreenTitles.orders,
      ),
    );
    final _pendingOrders = Observer(
      builder: (_) => InfoBlock(
        icon: Icon(
          OrdersAppIcons.service,
          size: 40,
        ),
        title: "PENDING ORDERS",
        value: orderStore.firstListTotalCount.toString(),
        screenTitle: ScreenTitles.orders,
      ),
    );
    final _tasks = Observer(
      builder: (_) => InfoBlock(
        icon: Icon(
          OrdersAppIcons.tasks,
          size: 40,
        ),
        title: 'TASKS',
        value: taskStore.totalCount.toString(),
        screenTitle: ScreenTitles.tasks,
      ),
    );
    final _workedOrdered = Observer(
      builder: (_) => InfoBlock(
        icon: Icon(
          OrdersAppIcons.service,
          size: 40,
        ),
        title: 'WORKED ORDERED GENERATED',
        value: completedOrderStore.totalCount.toString(),
        screenTitle: ScreenTitles.completedOrder,
      ),
    );

    final Map<Role, List<Widget>> roleInfoBlocks = {
      Role.leaser: [
        _ordersCreated,
        _pendingOrders,
      ],
      Role.client: [
        _ordersCreated,
        _pendingOrders,
        _tasks,
      ],
      Role.manager: [
        _workedOrdered,
        _ordersCreated,
        _tasks,
      ],
      Role.repairer: [
        _tasks,
        _pendingOrders,
      ],
    };

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: roleInfoBlocks[role],
      ),
    );
  }
}

class ReviewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Column(
        children: <Widget>[
          SubTitle(text: "PENDING REVIEW"),
          orderStore.loading
              ? Container(
                  margin: EdgeInsets.only(top: 20),
                  alignment: Alignment.center,
                  child: GKLoader(),
                )
              : Column(
                  children: <Widget>[
                    for (final order in orderStore.notRated)
                      RateCard(order: order),
                    if (orderStore.notRated.isEmpty)
                      Text(
                        'Nothing to review',
                        style: TextStyle(fontSize: 20),
                      ),
                  ],
                ),
        ],
      ),
    );
  }
}
