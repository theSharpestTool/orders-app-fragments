import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:orders_app/components/buttons/gk_floating_button.dart';
import 'package:orders_app/components/card_block/gk_card.dart';
import 'package:orders_app/components/loading_indicator/gk_loader.dart';
import 'package:orders_app/constants/colors.dart';
import 'package:orders_app/icons/orders_app_icons_icons.dart';
import 'package:orders_app/screens/home_screens/components/no_items_icon.dart';
import 'package:orders_app/screens/home_screens/orders/single_order.dart';
import 'package:orders_app/stores/index.dart';
import 'package:orders_app/stores/order_store/order_model_store.dart';
import 'package:orders_app/stores/user_store/user_store.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:mobx/mobx.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (orderStore.loading)
          return Center(
            child: GKLoader(),
          );
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: Colors.white,
            floatingActionButton:
                userStore.role == Role.client || userStore.role == Role.leaser
                    ? GKFloattingButton()
                    : null,
            appBar: AppBar(
              elevation: 2,
              bottom: PreferredSize(
                preferredSize: Size(0, 0),
                child: Observer(
                  builder: (_) => TabBar(
                    indicatorColor: GKColors.green,
                    labelColor: GKColors.green,
                    unselectedLabelColor: Colors.black,
                    tabs: userStore.role == Role.manager
                        ? [Tab(text: 'PENDING'), Tab(text: 'CONFIRMED')]
                        : [Tab(text: 'MY ORDERS'), Tab(text: 'PAST ORDER')],
                  ),
                ),
              ),
            ),
            body: TabBarView(children: [
              OrdersListView(
                orders: orderStore.firstListSearchResults,
                onEndPage: () => orderStore.loadFirstList(clear: false),
                onLastPage: orderStore.onFirstListLastPage,
              ),
              OrdersListView(
                orders: orderStore.secondListSearchResults,
                onEndPage: () => orderStore.loadSecondList(clear: false),
                onLastPage: orderStore.onSecondListLastPage,
              ),
            ]),
          ),
        );
      },
    );
  }
}

class OrdersListView extends StatelessWidget {
  final ObservableList<OrderModelStore> orders;
  final bool onLastPage;
  final Function onEndPage;

  OrdersListView({
    @required this.orders,
    @required this.onLastPage,
    @required this.onEndPage,
  });

  @override
  Widget build(BuildContext context) {
    return LazyLoadScrollView(
      onEndOfPage: () {
        if (!onLastPage) onEndPage();
      },
      child: RefreshIndicator(
        child: orders.isEmpty
            ? NoItemsIconScrollable(
                icon: Icon(
                  OrdersAppIcons.order,
                  size: 70,
                ),
                text: 'NO ORDER YET',
              )
            : ListView.builder(
                itemCount: onLastPage ? orders.length : orders.length + 1,
                itemBuilder: (context, index) => Observer(
                  builder: (_) => orders.length == index
                      ? Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.green,
                            ),
                          ),
                        )
                      : GKCard(
                          order: orders[index],
                          onPressedRoute: SingleOrderScreen.name,
                          defaultSvg: 'svgs/default_order.svg',
                        ),
                ),
              ),
        onRefresh: () async {
          await completedOrderStore.load(withLoadingIndicator: false);
          await orderStore.load(withLoadingIndicator: false);
        },
        backgroundColor: GKColors.green,
      ),
    );
  }
}
