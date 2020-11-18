// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_per_site_model_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BudgetPerSiteModelStore on _BudgetPerSiteModelStore, Store {
  Computed<bool> _$currentStatsIsEmptyComputed;

  @override
  bool get currentStatsIsEmpty => (_$currentStatsIsEmptyComputed ??=
          Computed<bool>(() => super.currentStatsIsEmpty))
      .value;

  final _$monthlyStatsAtom =
      Atom(name: '_BudgetPerSiteModelStore.monthlyStats');

  @override
  ObservableList<TimeValue> get monthlyStats {
    _$monthlyStatsAtom.context.enforceReadPolicy(_$monthlyStatsAtom);
    _$monthlyStatsAtom.reportObserved();
    return super.monthlyStats;
  }

  @override
  set monthlyStats(ObservableList<TimeValue> value) {
    _$monthlyStatsAtom.context.conditionallyRunInAction(() {
      super.monthlyStats = value;
      _$monthlyStatsAtom.reportChanged();
    }, _$monthlyStatsAtom, name: '${_$monthlyStatsAtom.name}_set');
  }

  final _$quaterlyStatsAtom =
      Atom(name: '_BudgetPerSiteModelStore.quaterlyStats');

  @override
  ObservableList<TimeValue> get quaterlyStats {
    _$quaterlyStatsAtom.context.enforceReadPolicy(_$quaterlyStatsAtom);
    _$quaterlyStatsAtom.reportObserved();
    return super.quaterlyStats;
  }

  @override
  set quaterlyStats(ObservableList<TimeValue> value) {
    _$quaterlyStatsAtom.context.conditionallyRunInAction(() {
      super.quaterlyStats = value;
      _$quaterlyStatsAtom.reportChanged();
    }, _$quaterlyStatsAtom, name: '${_$quaterlyStatsAtom.name}_set');
  }

  final _$yearlyStatsAtom = Atom(name: '_BudgetPerSiteModelStore.yearlyStats');

  @override
  ObservableList<TimeValue> get yearlyStats {
    _$yearlyStatsAtom.context.enforceReadPolicy(_$yearlyStatsAtom);
    _$yearlyStatsAtom.reportObserved();
    return super.yearlyStats;
  }

  @override
  set yearlyStats(ObservableList<TimeValue> value) {
    _$yearlyStatsAtom.context.conditionallyRunInAction(() {
      super.yearlyStats = value;
      _$yearlyStatsAtom.reportChanged();
    }, _$yearlyStatsAtom, name: '${_$yearlyStatsAtom.name}_set');
  }

  final _$currentStatsAtom =
      Atom(name: '_BudgetPerSiteModelStore.currentStats');

  @override
  ObservableList<TimeValue> get currentStats {
    _$currentStatsAtom.context.enforceReadPolicy(_$currentStatsAtom);
    _$currentStatsAtom.reportObserved();
    return super.currentStats;
  }

  @override
  set currentStats(ObservableList<TimeValue> value) {
    _$currentStatsAtom.context.conditionallyRunInAction(() {
      super.currentStats = value;
      _$currentStatsAtom.reportChanged();
    }, _$currentStatsAtom, name: '${_$currentStatsAtom.name}_set');
  }

  final _$totalAtom = Atom(name: '_BudgetPerSiteModelStore.total');

  @override
  double get total {
    _$totalAtom.context.enforceReadPolicy(_$totalAtom);
    _$totalAtom.reportObserved();
    return super.total;
  }

  @override
  set total(double value) {
    _$totalAtom.context.conditionallyRunInAction(() {
      super.total = value;
      _$totalAtom.reportChanged();
    }, _$totalAtom, name: '${_$totalAtom.name}_set');
  }

  final _$loadAsyncAction = AsyncAction('load');

  @override
  Future<void> load(String siteId) {
    return _$loadAsyncAction.run(() => super.load(siteId));
  }

  final _$_BudgetPerSiteModelStoreActionController =
      ActionController(name: '_BudgetPerSiteModelStore');

  @override
  void serialize(Map<String, dynamic> data) {
    final _$actionInfo =
        _$_BudgetPerSiteModelStoreActionController.startAction();
    try {
      return super.serialize(data);
    } finally {
      _$_BudgetPerSiteModelStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void statsChanged(ObservableList<TimeValue> stats) {
    final _$actionInfo =
        _$_BudgetPerSiteModelStoreActionController.startAction();
    try {
      return super.statsChanged(stats);
    } finally {
      _$_BudgetPerSiteModelStoreActionController.endAction(_$actionInfo);
    }
  }
}
