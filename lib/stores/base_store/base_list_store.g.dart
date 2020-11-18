// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BaseListStore<T extends BaseModelStore> on _BaseListStore<T>, Store {
  Computed<int> _$lengthComputed;

  @override
  int get length =>
      (_$lengthComputed ??= Computed<int>(() => super.length)).value;

  final _$dataAtom = Atom(name: '_BaseListStore.data');

  @override
  ObservableList<T> get data {
    _$dataAtom.context.enforceReadPolicy(_$dataAtom);
    _$dataAtom.reportObserved();
    return super.data;
  }

  @override
  set data(ObservableList<T> value) {
    _$dataAtom.context.conditionallyRunInAction(() {
      super.data = value;
      _$dataAtom.reportChanged();
    }, _$dataAtom, name: '${_$dataAtom.name}_set');
  }

  final _$loadingAtom = Atom(name: '_BaseListStore.loading');

  @override
  bool get loading {
    _$loadingAtom.context.enforceReadPolicy(_$loadingAtom);
    _$loadingAtom.reportObserved();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.context.conditionallyRunInAction(() {
      super.loading = value;
      _$loadingAtom.reportChanged();
    }, _$loadingAtom, name: '${_$loadingAtom.name}_set');
  }

  final _$loadedAtom = Atom(name: '_BaseListStore.loaded');

  @override
  bool get loaded {
    _$loadedAtom.context.enforceReadPolicy(_$loadedAtom);
    _$loadedAtom.reportObserved();
    return super.loaded;
  }

  @override
  set loaded(bool value) {
    _$loadedAtom.context.conditionallyRunInAction(() {
      super.loaded = value;
      _$loadedAtom.reportChanged();
    }, _$loadedAtom, name: '${_$loadedAtom.name}_set');
  }

  final _$errorDialogShownAtom = Atom(name: '_BaseListStore.errorDialogShown');

  @override
  bool get errorDialogShown {
    _$errorDialogShownAtom.context.enforceReadPolicy(_$errorDialogShownAtom);
    _$errorDialogShownAtom.reportObserved();
    return super.errorDialogShown;
  }

  @override
  set errorDialogShown(bool value) {
    _$errorDialogShownAtom.context.conditionallyRunInAction(() {
      super.errorDialogShown = value;
      _$errorDialogShownAtom.reportChanged();
    }, _$errorDialogShownAtom, name: '${_$errorDialogShownAtom.name}_set');
  }

  final _$searchResultsAtom = Atom(name: '_BaseListStore.searchResults');

  @override
  ObservableList<T> get searchResults {
    _$searchResultsAtom.context.enforceReadPolicy(_$searchResultsAtom);
    _$searchResultsAtom.reportObserved();
    return super.searchResults;
  }

  @override
  set searchResults(ObservableList<T> value) {
    _$searchResultsAtom.context.conditionallyRunInAction(() {
      super.searchResults = value;
      _$searchResultsAtom.reportChanged();
    }, _$searchResultsAtom, name: '${_$searchResultsAtom.name}_set');
  }

  final _$totalCountAtom = Atom(name: '_BaseListStore.totalCount');

  @override
  int get totalCount {
    _$totalCountAtom.context.enforceReadPolicy(_$totalCountAtom);
    _$totalCountAtom.reportObserved();
    return super.totalCount;
  }

  @override
  set totalCount(int value) {
    _$totalCountAtom.context.conditionallyRunInAction(() {
      super.totalCount = value;
      _$totalCountAtom.reportChanged();
    }, _$totalCountAtom, name: '${_$totalCountAtom.name}_set');
  }

  final _$loadAsyncAction = AsyncAction('load');

  @override
  Future<void> load(
      {bool withLoadingIndicator = true,
      bool clear = true,
      bool checkCache = false}) {
    return _$loadAsyncAction.run(() => super.load(
        withLoadingIndicator: withLoadingIndicator,
        clear: clear,
        checkCache: checkCache));
  }

  final _$_BaseListStoreActionController =
      ActionController(name: '_BaseListStore');

  @override
  void search(String pattern) {
    final _$actionInfo = _$_BaseListStoreActionController.startAction();
    try {
      return super.search(pattern);
    } finally {
      _$_BaseListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearSearchResults() {
    final _$actionInfo = _$_BaseListStoreActionController.startAction();
    try {
      return super.clearSearchResults();
    } finally {
      _$_BaseListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void add(T object) {
    final _$actionInfo = _$_BaseListStoreActionController.startAction();
    try {
      return super.add(object);
    } finally {
      _$_BaseListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void populate(List data) {
    final _$actionInfo = _$_BaseListStoreActionController.startAction();
    try {
      return super.populate(data);
    } finally {
      _$_BaseListStoreActionController.endAction(_$actionInfo);
    }
  }
}
