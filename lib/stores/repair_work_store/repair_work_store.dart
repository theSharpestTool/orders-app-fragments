import 'package:flutter/material.dart';
import 'package:orders_app/config/api.dart';
import 'package:orders_app/screens/home.dart';
import 'package:orders_app/screens/home_screens/repair_works/single_repair_work.dart';
import 'package:orders_app/services/cache_service.dart';
import 'package:orders_app/stores/index.dart';
import 'package:orders_app/stores/order_store/order_model_store.dart';
import 'package:orders_app/stores/task_store/task_model_store.dart';
import 'package:orders_app/stores/repair_work_store/repair_work_model_store.dart';
import 'package:mobx/mobx.dart';
import 'package:orders_app/stores/base_store/base_list_store.dart';
part 'repair_work_store.g.dart';

class RepairWorkStore = _RepairWorkStore with _$RepairWorkStore;

abstract class _RepairWorkStore extends BaseListStore<RepairWorkModelStore>
    with Store {

  @override
  String get cacheKey => 'repair_work';

  @override
  String get countCacheKey => 'repair_work_count';

  @override
  Future<List> downloadData() async {
    final notCompletedStates = RepairWorkState.values
        .where((state) => state != RepairWorkState.orderCompleted)
        .map((state) => state.index)
        .toList();

    final filter = {
      "page": page,
      "rowsPerPage": rowsPerPage,
      "sortColumn": "serial",
      "sortDirection": "desc",
      "includeFilter": true,
      "filter": [
        {
          "key": "state",
          "value": notCompletedStates,
        },
      ],
    };

    final response = await api.post(
      '/api/RepairWorks/list',
      data: filter,
    );

    totalCount = response.data['count'];
    CacheService.saveToCache(countCacheKey, totalCount.toString());

    return response.data['data'];
  }

  ObservableList<RepairWorkModelStore> getByState(RepairWorkState state,
          [bool include = true]) =>
      ObservableList.of(searchResults.where((completedOrder) =>
          include ? completedOrder.state == state : completedOrder.state != state));

  @computed
  ObservableList<RepairWorkModelStore> get quoteApproved =>
      getByState(RepairWorkState.quotationApproved);

  @computed
  ObservableList<RepairWorkModelStore> get quoteRejected =>
      getByState(RepairWorkState.quotationRejected);

  @computed
  ObservableList<RepairWorkModelStore> get inProgress =>
      getByState(RepairWorkState.workInProgress);

  @computed
  ObservableList<RepairWorkModelStore> get completedOrderCompleted =>
      getByState(RepairWorkState.completedOrderCompleted);

  @computed
  ObservableList<RepairWorkModelStore> get notCompleted =>
      getByState(RepairWorkState.orderCompleted, false);

  RepairWorkModelStore getByOrder(OrderModelStore order) {
    final completedOrder = data.firstWhere(
      (completedOrder) => completedOrder.order == order,
      orElse: () => null,
    );

    return completedOrder;
  }

  RepairWorkModelStore getByTask(TaskModelStore task) {
    final completedOrder = data.firstWhere(
      (completedOrder) => completedOrder.task == task,
      orElse: () => null,
    );

    return completedOrder;
  }

  @action
  Future<void> goToRepairWork(
      {OrderModelStore order, TaskModelStore task}) async {
    assert(order == null || task == null);
    loading = true;
    final completedOrderIndex = task == null
        ? data.indexWhere((completedOrder) => completedOrder.order == order)
        : data.indexWhere((completedOrder) => completedOrder.task == task);

    RepairWorkModelStore currentRepairWork;
    if (order != null) {
      currentRepairWork = completedOrderIndex == -1
          ? getByOrder(order)
          : data.firstWhere((completedOrder) => completedOrder.order == order);
    } else if (task != null) {
      currentRepairWork = completedOrderIndex == -1
          ? getByTask(task)
          : data.firstWhere((completedOrder) => completedOrder.task == task);
    }

    loading = false;
    navStore.navigator.popUntil(ModalRoute.withName(HomeScreen.name));
    navStore.navigator.pushNamed(
      SingleRepairWorkScreen.name,
      arguments: currentRepairWork,
    );
  }

  @override
  RepairWorkModelStore createNew(Map<String, dynamic> data) {
    return RepairWorkModelStore(data);
  }
}
