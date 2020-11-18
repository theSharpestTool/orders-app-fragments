import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orders_app/components/card_block/gk_card.dart';
import 'package:orders_app/components/loading_indicator/gk_loader.dart';
import 'package:orders_app/constants/colors.dart';
import 'package:orders_app/screens/home_screens/components/no_items_icon.dart';
import 'package:orders_app/screens/home_screens/repair_works/single_repair_work.dart';
import 'package:orders_app/stores/index.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class RepairWorksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => completedOrderStore.loading
          ? Center(
              child: GKLoader(),
            )
          : LazyLoadScrollView(
              onEndOfPage: () {
                completedOrderStore.load(
                  withLoadingIndicator: false,
                  clear: false,
                );
              },
              child: RefreshIndicator(
                child: completedOrderStore.notCompleted.isEmpty
                    ? NoItemsIconScrollable(
                        icon: SvgPicture.asset(
                          'svgs/work-order.svg',
                          width: 70,
                        ),
                        text: 'NO REPAIR WORK YET',
                      )
                    : ListView.builder(
                        itemCount: completedOrderStore.onLastPage
                            ? completedOrderStore.notCompleted.length
                            : completedOrderStore.notCompleted.length + 1,
                        itemBuilder: (context, index) => Observer(
                          builder: (_) => completedOrderStore.notCompleted.length ==
                                  index
                              ? Center(
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.green,
                                    ),
                                  ),
                                )
                              : GKCard(
                                  order: completedOrderStore.notCompleted[index],
                                  onPressedRoute: SingleRepairWorkScreen.name,
                                  defaultSvg: 'svgs/default_repair_work.svg',
                                ),
                        ),
                      ),
                onRefresh: () async {
                  await completedOrderStore.load(withLoadingIndicator: false);
                  await taskStore.load(withLoadingIndicator: false);
                  await orderStore.load(withLoadingIndicator: false);
                },
                backgroundColor: GKColors.green,
              ),
            ),
    );
  }
}
