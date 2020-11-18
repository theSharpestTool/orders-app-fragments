import 'dart:convert';

import 'package:orders_app/components/dialogs/gk_dialog.dart';
import 'package:orders_app/services/base_service.dart';
import 'package:orders_app/services/cache_service.dart';
import 'package:orders_app/stores/base_store/base_model_store.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'base_list_store.g.dart';

class BaseListStore<T extends BaseModelStore> = _BaseListStore<T>
    with _$BaseListStore<T>;

abstract class _BaseListStore<T extends BaseModelStore> with Store {
  Service service;

  @observable
  ObservableList<T> data = ObservableList<T>();

  @observable
  bool loading = false;

  @observable
  bool loaded = false;

  @observable
  bool errorDialogShown = false;

  @computed
  int get length => data.length;

  @observable
  ObservableList<T> searchResults = ObservableList<T>();

  @observable
  int totalCount = 0;

  String get cacheKey => null;

  String get countCacheKey => null;

  @action
  void search(String pattern) {
    pattern = pattern.toLowerCase();
    final searchedIterable =
        data.where((item) => item.containsPatern(pattern)).toList();
    searchResults = ObservableList.of(searchedIterable);
  }

  @action
  void clearSearchResults() {
    searchResults = data;
  }

  @action
  void add(T object) {
    data.add(object);
  }

  @action
  void populate(List<dynamic> data) {
    data.forEach((d) {
      if (get(d['id']) == null) {
        this.data.add(createNew(d));
      }
    });
    searchResults = ObservableList.of(this.data);
  }

  int get rowsPerPage => 10;

  int get page => length ~/ rowsPerPage;

  bool get onLastPage => length == totalCount;

  void clear() {
    data.clear();
  }

  @action
  Future<void> load(
      {bool withLoadingIndicator = true,
      bool clear = true,
      bool checkCache = false}) async {
    loading = withLoadingIndicator;
    try {
      if (clear) this.data.clear();
      if (checkCache && cacheKey != null) {
        if (countCacheKey != null) {
          final countString = CacheService.loadFromCache(countCacheKey);
          if (countString != null) totalCount = int.parse(countString);
        }
        final fetchedList = _fetchDataFromDevice();
        if (fetchedList != null) {
          populate(fetchedList);
          loading = false;
        }
      }
      final response = await downloadData();
      populate(response);
      if (checkCache && cacheKey != null) await _saveDataToDevice(response);
    } catch (e) {
      if (!errorDialogShown) {
        errorDialogShown = true;
        await GKDialog.showHttpError(error: e);
        errorDialogShown = false;
      }
    }
    loading = false;
  }

  Future<List> downloadData() async {
    return [];
  }

  List _fetchDataFromDevice() {
    final dataString = CacheService.loadFromCache(cacheKey);
    if (dataString == null) return null;
    final List decodedData = jsonDecode(dataString);
    return decodedData;
  }

  Future<bool> _saveDataToDevice(List data) {
    final encodedData = jsonEncode(data);
    return CacheService.saveToCache(cacheKey, encodedData);
  }

  T createNew(Map<String, dynamic> data) {
    return null;
  }

  T get(String id) {
    return data.firstWhere((T object) => object.id == id, orElse: () => null);
  }
}
