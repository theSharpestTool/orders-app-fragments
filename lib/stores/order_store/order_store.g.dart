// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OrderStore on _OrderStore, Store {
  Computed<ObservableList<OrderModelStore>> _$pendingComputed;

  @override
  ObservableList<OrderModelStore> get pending => (_$pendingComputed ??=
          Computed<ObservableList<OrderModelStore>>(() => super.pending))
      .value;
  Computed<ObservableList<OrderModelStore>> _$confirmedComputed;

  @override
  ObservableList<OrderModelStore> get confirmed => (_$confirmedComputed ??=
          Computed<ObservableList<OrderModelStore>>(() => super.confirmed))
      .value;
  Computed<ObservableList<OrderModelStore>> _$completedComputed;

  @override
  ObservableList<OrderModelStore> get completed => (_$completedComputed ??=
          Computed<ObservableList<OrderModelStore>>(() => super.completed))
      .value;
  Computed<ObservableList<OrderModelStore>> _$notRatedComputed;

  @override
  ObservableList<OrderModelStore> get notRated => (_$notRatedComputed ??=
          Computed<ObservableList<OrderModelStore>>(() => super.notRated))
      .value;
  Computed<ObservableList<OrderModelStore>> _$notApprovedComputed;

  @override
  ObservableList<OrderModelStore> get notApproved =>
      (_$notApprovedComputed ??= Computed<ObservableList<OrderModelStore>>(
              () => super.notApproved))
          .value;
  Computed<ObservableList<OrderModelStore>> _$currentComputed;

  @override
  ObservableList<OrderModelStore> get current => (_$currentComputed ??=
          Computed<ObservableList<OrderModelStore>>(() => super.current))
      .value;
  Computed<ObservableList<OrderModelStore>> _$currentAndNotRatedComputed;

  @override
  ObservableList<OrderModelStore> get currentAndNotRated =>
      (_$currentAndNotRatedComputed ??=
              Computed<ObservableList<OrderModelStore>>(
                  () => super.currentAndNotRated))
          .value;
  Computed<ObservableList<OrderModelStore>> _$pendingAndConfirmedComputed;

  @override
  ObservableList<OrderModelStore> get pendingAndConfirmed =>
      (_$pendingAndConfirmedComputed ??=
              Computed<ObservableList<OrderModelStore>>(
                  () => super.pendingAndConfirmed))
          .value;
  Computed<ObservableList<OrderModelStore>> _$createdComputed;

  @override
  ObservableList<OrderModelStore> get created => (_$createdComputed ??=
          Computed<ObservableList<OrderModelStore>>(() => super.created))
      .value;
  Computed<ObservableList<OrderModelStore>> _$firstListSearchResultsComputed;

  @override
  ObservableList<OrderModelStore> get firstListSearchResults =>
      (_$firstListSearchResultsComputed ??=
              Computed<ObservableList<OrderModelStore>>(
                  () => super.firstListSearchResults))
          .value;
  Computed<ObservableList<OrderModelStore>> _$secondListSearchResultsComputed;

  @override
  ObservableList<OrderModelStore> get secondListSearchResults =>
      (_$secondListSearchResultsComputed ??=
              Computed<ObservableList<OrderModelStore>>(
                  () => super.secondListSearchResults))
          .value;
  Computed<int> _$totalRequsetsCountComputed;

  @override
  int get totalRequsetsCount => (_$totalRequsetsCountComputed ??=
          Computed<int>(() => super.totalRequsetsCount))
      .value;

  final _$firstListAtom = Atom(name: '_OrderStore.firstList');

  @override
  ObservableList<OrderModelStore> get firstList {
    _$firstListAtom.context.enforceReadPolicy(_$firstListAtom);
    _$firstListAtom.reportObserved();
    return super.firstList;
  }

  @override
  set firstList(ObservableList<OrderModelStore> value) {
    _$firstListAtom.context.conditionallyRunInAction(() {
      super.firstList = value;
      _$firstListAtom.reportChanged();
    }, _$firstListAtom, name: '${_$firstListAtom.name}_set');
  }

  final _$secondListAtom = Atom(name: '_OrderStore.secondList');

  @override
  ObservableList<OrderModelStore> get secondList {
    _$secondListAtom.context.enforceReadPolicy(_$secondListAtom);
    _$secondListAtom.reportObserved();
    return super.secondList;
  }

  @override
  set secondList(ObservableList<OrderModelStore> value) {
    _$secondListAtom.context.conditionallyRunInAction(() {
      super.secondList = value;
      _$secondListAtom.reportChanged();
    }, _$secondListAtom, name: '${_$secondListAtom.name}_set');
  }

  final _$firstListTotalCountAtom =
      Atom(name: '_OrderStore.firstListTotalCount');

  @override
  int get firstListTotalCount {
    _$firstListTotalCountAtom.context
        .enforceReadPolicy(_$firstListTotalCountAtom);
    _$firstListTotalCountAtom.reportObserved();
    return super.firstListTotalCount;
  }

  @override
  set firstListTotalCount(int value) {
    _$firstListTotalCountAtom.context.conditionallyRunInAction(() {
      super.firstListTotalCount = value;
      _$firstListTotalCountAtom.reportChanged();
    }, _$firstListTotalCountAtom,
        name: '${_$firstListTotalCountAtom.name}_set');
  }

  final _$secondListTotalCountAtom =
      Atom(name: '_OrderStore.secondListTotalCount');

  @override
  int get secondListTotalCount {
    _$secondListTotalCountAtom.context
        .enforceReadPolicy(_$secondListTotalCountAtom);
    _$secondListTotalCountAtom.reportObserved();
    return super.secondListTotalCount;
  }

  @override
  set secondListTotalCount(int value) {
    _$secondListTotalCountAtom.context.conditionallyRunInAction(() {
      super.secondListTotalCount = value;
      _$secondListTotalCountAtom.reportChanged();
    }, _$secondListTotalCountAtom,
        name: '${_$secondListTotalCountAtom.name}_set');
  }

  final _$loadFirstListAsyncAction = AsyncAction('loadFirstList');

  @override
  Future<List> loadFirstList({bool clear = false}) {
    return _$loadFirstListAsyncAction
        .run(() => super.loadFirstList(clear: clear));
  }

  final _$loadSecondListAsyncAction = AsyncAction('loadSecondList');

  @override
  Future<List> loadSecondList({bool clear = false}) {
    return _$loadSecondListAsyncAction
        .run(() => super.loadSecondList(clear: clear));
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
}
