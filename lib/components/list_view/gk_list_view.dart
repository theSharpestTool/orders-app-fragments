import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:orders_app/components/loading_indicator/gk_loader.dart';
import 'package:orders_app/constants/colors.dart';
import 'package:orders_app/stores/base_store/base_list_store.dart';
import 'package:orders_app/stores/base_store/base_model_store.dart';
import 'package:mobx/mobx.dart';

class GKListView extends StatelessWidget {
  final BaseListStore baseListStore;
  final Widget Function(BuildContext, int) itemBuilder;
  final Widget noItemsIcon;
  final Future<void> Function() onRefresh;
  final ObservableList<BaseModelStore> data;

  GKListView({
    @required this.baseListStore,
    @required this.itemBuilder,
    @required this.noItemsIcon,
    this.onRefresh,
    ObservableList<BaseModelStore> data,
  }) : this.data = data ?? baseListStore.data;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => baseListStore.loading
          ? Center(
              child: GKLoader(),
            )
          : RefreshIndicator(
              child: data.isEmpty
                  ? noItemsIcon
                  : ListView.builder(
                      itemCount: data.length,
                      itemBuilder: itemBuilder,
                    ),
              onRefresh: onRefresh ??
                  () => baseListStore.load(withLoadingIndicator: false),
              backgroundColor: GKColors.green,
            ),
    );
  }
}
