import 'dart:convert';

import 'package:orders_app/components/dialogs/gk_dialog.dart';
import 'package:orders_app/config/api.dart';
import 'package:orders_app/services/cache_service.dart';
import 'package:orders_app/services/index.dart';
import 'package:orders_app/stores/index.dart';
import 'package:orders_app/stores/order_store/order_model_store.dart';
import 'package:orders_app/stores/user_store/user_store.dart';
import 'package:mobx/mobx.dart';
import 'package:orders_app/stores/base_store/base_list_store.dart';
part 'order_store.g.dart';

class OrderStore = _OrderStore with _$OrderStore;

abstract class _OrderStore extends BaseListStore<OrderModelStore>
    with Store {
  String firstCacheKey = 'orders1';
  String secondCacheKey = 'orders2';

  String firstTotalCacheKey = 'orders1total';
  String secondTotalCacheKey = 'orders2total';

  @override
  Service service = orderService;

  @computed
  ObservableList<OrderModelStore> get pending =>
      getByState(OrderState.pending);

  @computed
  ObservableList<OrderModelStore> get confirmed =>
      getByState(OrderState.confirmed);

  @computed
  ObservableList<OrderModelStore> get completed =>
      getByState(OrderState.completed);

  @computed
  ObservableList<OrderModelStore> get notRated =>
      ObservableList.of(completed.where((order) => !order.isRated));

  @computed
  ObservableList<OrderModelStore> get notApproved =>
      ObservableList.of(data.where((order) => order.isWaitingApproval));

  @computed
  ObservableList<OrderModelStore> get current =>
      getByState(OrderState.completed, false);

  @computed
  ObservableList<OrderModelStore> get currentAndNotRated =>
      ObservableList.of(data.where((order) =>
          order.state != OrderState.completed || !order.isRated));

  @computed
  ObservableList<OrderModelStore> get pendingAndConfirmed =>
      ObservableList.of(data.where((order) =>
          order.state == OrderState.confirmed ||
          order.state == OrderState.pending));

  @computed
  ObservableList<OrderModelStore> get created =>
      userStore.role == Role.manager ? pendingAndConfirmed : currentAndNotRated;

  ObservableList<OrderModelStore> getByState(OrderState state,
          [bool include = true]) =>
      ObservableList.of(searchResults.where((order) =>
          include ? order.state == state : order.state != state));

  @observable
  ObservableList<OrderModelStore> firstList =
      ObservableList<OrderModelStore>();

  @observable
  ObservableList<OrderModelStore> secondList =
      ObservableList<OrderModelStore>();

  @computed
  ObservableList<OrderModelStore> get firstListSearchResults =>
      interceptionWithSearchResults(firstList);

  @computed
  ObservableList<OrderModelStore> get secondListSearchResults =>
      interceptionWithSearchResults(secondList);

  ObservableList<OrderModelStore> interceptionWithSearchResults(
      ObservableList<OrderModelStore> orders) {
    return ObservableList.of(
        orders.where((order) => searchResults.contains(order)));
  }

  @observable
  int firstListTotalCount = 0;

  @observable
  int secondListTotalCount = 0;

  int get firstListPage => firstList.length ~/ rowsPerPage;

  int get secondListPage => secondList.length ~/ rowsPerPage;

  bool get onFirstListLastPage => firstList.length == firstListTotalCount;

  bool get onSecondListLastPage => secondList.length == secondListTotalCount;

  @computed
  int get totalRequsetsCount => firstListTotalCount + secondListTotalCount;

  @override
  void clear() {
    firstList.clear();
    secondList.clear();
    super.clear();
  }

  Future<dynamic> loadFilteredList({
    List<int> states,
    int page,
  }) async {
    final data = {
      'page': page,
      'rowsPerPage': rowsPerPage,
      'sortColumn': 'serial',
      'sortDirection': 'desc',
      'includeRatedOrders': false,
      'filter': [
        {
          'key': 'state',
          'value': states,
        }
      ],
    };
    final response = await api.post('/api/Orders/list', data: data);
    return response.data;
  }

  @action
  Future<List> loadFirstList({bool clear = false}) async {
    final page = clear ? 0 : firstListPage;
    final responseData = userStore.role == Role.manager
        ? await loadPendingList(page)
        : await loadMyOrders(page);

    firstListTotalCount = responseData['count'];
    await CacheService.saveToCache(
        firstTotalCacheKey, firstListTotalCount.toString());

    final responseList = responseData['data'] as List;

    final loadedResults =
        responseList.map((orderData) => createNew(orderData));

    if (clear) firstList.clear();
    firstList.addAll(loadedResults);

    return responseList;
  }

  @action
  Future<List> loadSecondList({bool clear = false}) async {
    final page = clear ? 0 : secondListPage;
    final responseData = userStore.role == Role.manager
        ? await loadConfirmedList(page)
        : await loadPastOrders(page);

    secondListTotalCount = responseData['count'];
    await CacheService.saveToCache(
        secondTotalCacheKey, secondListTotalCount.toString());

    final responseList = responseData['data'] as List;

    final loadedResults =
        responseList.map((orderData) => createNew(orderData));

    if (clear) secondList.clear();
    secondList.addAll(loadedResults);

    return responseList;
  }

  Future<dynamic> loadPendingList(int page) {
    return loadFilteredList(
      states: [OrderState.pending.index],
      page: page,
    );
  }

  Future<dynamic> loadConfirmedList(int page) {
    return loadFilteredList(
      states: [OrderState.confirmed.index],
      page: page,
    );
  }

  Future<dynamic> loadMyOrders(int page) {
    final states = OrderState.values
        .where((state) => state != OrderState.completed)
        .map((state) => state.index)
        .toList();
    return loadFilteredList(
      states: states,
      page: page,
    );
  }

  Future<dynamic> loadPastOrders(int page) {
    return loadFilteredList(
      states: [OrderState.completed.index],
      page: page,
    );
  }

  List _fetchDataFromDevice(String key) {
    final dataString = CacheService.loadFromCache(key);
    if (dataString == null) return null;
    final List decodedData = jsonDecode(dataString);
    return decodedData;
  }

  Future<bool> _saveDataToDevice(List data, String key) {
    final encodedData = jsonEncode(data);
    return CacheService.saveToCache(key, encodedData);
  }

  @override
  Future<void> load(
      {bool withLoadingIndicator = true,
      bool clear = true,
      bool checkCache = false}) async {
    loading = withLoadingIndicator;
    try {
      if (clear) this.data.clear();
      if (checkCache) {
        final firstCountString = CacheService.loadFromCache(firstTotalCacheKey);
        final secondCountString =
            CacheService.loadFromCache(secondTotalCacheKey);

        if (firstCountString != null)
          firstListTotalCount = int.parse(firstCountString);
        if (secondCountString != null)
          secondListTotalCount = int.parse(secondCountString);

        final fetchedList1 = _fetchDataFromDevice(firstCacheKey);
        final fetchedList2 = _fetchDataFromDevice(secondCacheKey);
        if (fetchedList1 != null) {
          final firstListLoadedResults =
              fetchedList1.map((orderData) => createNew(orderData));
          firstList = ObservableList.of(firstListLoadedResults);
          data.addAll(firstList);
          searchResults.addAll(firstList);
          loading = false;
        }
        if (fetchedList2 != null) {
          final secondListLoadedResults =
              fetchedList2.map((orderData) => createNew(orderData));
          secondList = ObservableList.of(secondListLoadedResults);
          data.addAll(secondList);
          searchResults.addAll(secondList);
          loading = false;
        }
      }
      final downloadedFirstList = await loadFirstList(clear: true);
      final downloadedSecondList = await loadSecondList(clear: true);

      if (checkCache) {
        await _saveDataToDevice(downloadedFirstList, firstCacheKey);
        await _saveDataToDevice(downloadedSecondList, secondCacheKey);
      }

      final fullList = [
        ...downloadedFirstList,
        ...downloadedSecondList,
      ];

      populate(fullList);
    } catch (e) {
      if (!errorDialogShown) {
        errorDialogShown = true;
        await GKDialog.showHttpError(error: e);
        errorDialogShown = false;
      }
    }
    loading = false;
  }

  @override
  Future<List> downloadData() async {
    final firstList = await loadFirstList(clear: true);
    final secondList = await loadSecondList(clear: true);

    final fullList = [
      ...firstList,
      ...secondList,
    ];

    return fullList;
  }

  @override
  OrderModelStore createNew(Map<String, dynamic> data) {
    return OrderModelStore(data);
  }
}
