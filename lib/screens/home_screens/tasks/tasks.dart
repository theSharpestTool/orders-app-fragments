import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:orders_app/components/card_block/gk_card.dart';
import 'package:orders_app/components/list_view/gk_list_view.dart';
import 'package:orders_app/icons/orders_app_icons_icons.dart';
import 'package:orders_app/screens/home_screens/components/no_items_icon.dart';
import 'package:orders_app/screens/home_screens/tasks/single_task.dart';
import 'package:orders_app/stores/index.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GKListView(
      baseListStore: taskStore,
      itemBuilder: (context, index) => Observer(
        builder: (_) => GKCard(
          order: taskStore.searchResults[index],
          onPressedRoute: SingleTaskScreen.name,
          defaultSvg: 'svgs/default_task.svg',
        ),
      ),
      noItemsIcon: NoItemsIconScrollable(
        icon: Icon(
          OrdersAppIcons.tasks,
          size: 70,
        ),
        text: 'NO TASKS YET',
      ),
      onRefresh: () async {
        await completedOrderStore.load(withLoadingIndicator: false);
        await taskStore.load(withLoadingIndicator: false);
      },
    );
  }
}
