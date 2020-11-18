// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_model_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SiteModelStore on _SiteModelStore, Store {
  final _$clientIdAtom = Atom(name: '_SiteModelStore.clientId');

  @override
  String get clientId {
    _$clientIdAtom.context.enforceReadPolicy(_$clientIdAtom);
    _$clientIdAtom.reportObserved();
    return super.clientId;
  }

  @override
  set clientId(String value) {
    _$clientIdAtom.context.conditionallyRunInAction(() {
      super.clientId = value;
      _$clientIdAtom.reportChanged();
    }, _$clientIdAtom, name: '${_$clientIdAtom.name}_set');
  }

  final _$servicesAtom = Atom(name: '_SiteModelStore.services');

  @override
  ObservableList<ServiceModelStore> get services {
    _$servicesAtom.context.enforceReadPolicy(_$servicesAtom);
    _$servicesAtom.reportObserved();
    return super.services;
  }

  @override
  set services(ObservableList<ServiceModelStore> value) {
    _$servicesAtom.context.conditionallyRunInAction(() {
      super.services = value;
      _$servicesAtom.reportChanged();
    }, _$servicesAtom, name: '${_$servicesAtom.name}_set');
  }

  final _$clientAtom = Atom(name: '_SiteModelStore.client');

  @override
  ClientModelStore get client {
    _$clientAtom.context.enforceReadPolicy(_$clientAtom);
    _$clientAtom.reportObserved();
    return super.client;
  }

  @override
  set client(ClientModelStore value) {
    _$clientAtom.context.conditionallyRunInAction(() {
      super.client = value;
      _$clientAtom.reportChanged();
    }, _$clientAtom, name: '${_$clientAtom.name}_set');
  }

  final _$unitsAtom = Atom(name: '_SiteModelStore.units');

  @override
  ObservableList<UnitModelStore> get units {
    _$unitsAtom.context.enforceReadPolicy(_$unitsAtom);
    _$unitsAtom.reportObserved();
    return super.units;
  }

  @override
  set units(ObservableList<UnitModelStore> value) {
    _$unitsAtom.context.conditionallyRunInAction(() {
      super.units = value;
      _$unitsAtom.reportChanged();
    }, _$unitsAtom, name: '${_$unitsAtom.name}_set');
  }

  final _$ordersOnGoingAtom = Atom(name: '_SiteModelStore.ordersOnGoing');

  @override
  int get ordersOnGoing {
    _$ordersOnGoingAtom.context.enforceReadPolicy(_$ordersOnGoingAtom);
    _$ordersOnGoingAtom.reportObserved();
    return super.ordersOnGoing;
  }

  @override
  set ordersOnGoing(int value) {
    _$ordersOnGoingAtom.context.conditionallyRunInAction(() {
      super.ordersOnGoing = value;
      _$ordersOnGoingAtom.reportChanged();
    }, _$ordersOnGoingAtom, name: '${_$ordersOnGoingAtom.name}_set');
  }

  final _$ordersDeclinedAtom = Atom(name: '_SiteModelStore.ordersDeclined');

  @override
  int get ordersDeclined {
    _$ordersDeclinedAtom.context.enforceReadPolicy(_$ordersDeclinedAtom);
    _$ordersDeclinedAtom.reportObserved();
    return super.ordersDeclined;
  }

  @override
  set ordersDeclined(int value) {
    _$ordersDeclinedAtom.context.conditionallyRunInAction(() {
      super.ordersDeclined = value;
      _$ordersDeclinedAtom.reportChanged();
    }, _$ordersDeclinedAtom, name: '${_$ordersDeclinedAtom.name}_set');
  }

  final _$ordersCompletedAtom =
      Atom(name: '_SiteModelStore.ordersCompleted');

  @override
  int get ordersCompleted {
    _$ordersCompletedAtom.context.enforceReadPolicy(_$ordersCompletedAtom);
    _$ordersCompletedAtom.reportObserved();
    return super.ordersCompleted;
  }

  @override
  set ordersCompleted(int value) {
    _$ordersCompletedAtom.context.conditionallyRunInAction(() {
      super.ordersCompleted = value;
      _$ordersCompletedAtom.reportChanged();
    }, _$ordersCompletedAtom, name: '${_$ordersCompletedAtom.name}_set');
  }

  final _$disabledAtom = Atom(name: '_SiteModelStore.disabled');

  @override
  bool get disabled {
    _$disabledAtom.context.enforceReadPolicy(_$disabledAtom);
    _$disabledAtom.reportObserved();
    return super.disabled;
  }

  @override
  set disabled(bool value) {
    _$disabledAtom.context.conditionallyRunInAction(() {
      super.disabled = value;
      _$disabledAtom.reportChanged();
    }, _$disabledAtom, name: '${_$disabledAtom.name}_set');
  }

  final _$budgetPerSiteAtom = Atom(name: '_SiteModelStore.budgetPerSite');

  @override
  BudgetPerSiteModelStore get budgetPerSite {
    _$budgetPerSiteAtom.context.enforceReadPolicy(_$budgetPerSiteAtom);
    _$budgetPerSiteAtom.reportObserved();
    return super.budgetPerSite;
  }

  @override
  set budgetPerSite(BudgetPerSiteModelStore value) {
    _$budgetPerSiteAtom.context.conditionallyRunInAction(() {
      super.budgetPerSite = value;
      _$budgetPerSiteAtom.reportChanged();
    }, _$budgetPerSiteAtom, name: '${_$budgetPerSiteAtom.name}_set');
  }

  final _$ppmComplianceModelAtom =
      Atom(name: '_SiteModelStore.ppmComplianceModel');

  @override
  ComplianceModelStore get ppmComplianceModel {
    _$ppmComplianceModelAtom.context
        .enforceReadPolicy(_$ppmComplianceModelAtom);
    _$ppmComplianceModelAtom.reportObserved();
    return super.ppmComplianceModel;
  }

  @override
  set ppmComplianceModel(ComplianceModelStore value) {
    _$ppmComplianceModelAtom.context.conditionallyRunInAction(() {
      super.ppmComplianceModel = value;
      _$ppmComplianceModelAtom.reportChanged();
    }, _$ppmComplianceModelAtom, name: '${_$ppmComplianceModelAtom.name}_set');
  }

  final _$slaComplianceModelAtom =
      Atom(name: '_SiteModelStore.slaComplianceModel');

  @override
  ComplianceModelStore get slaComplianceModel {
    _$slaComplianceModelAtom.context
        .enforceReadPolicy(_$slaComplianceModelAtom);
    _$slaComplianceModelAtom.reportObserved();
    return super.slaComplianceModel;
  }

  @override
  set slaComplianceModel(ComplianceModelStore value) {
    _$slaComplianceModelAtom.context.conditionallyRunInAction(() {
      super.slaComplianceModel = value;
      _$slaComplianceModelAtom.reportChanged();
    }, _$slaComplianceModelAtom, name: '${_$slaComplianceModelAtom.name}_set');
  }

  final _$ppmComplianceAtom = Atom(name: '_SiteModelStore.ppmCompliance');

  @override
  double get ppmCompliance {
    _$ppmComplianceAtom.context.enforceReadPolicy(_$ppmComplianceAtom);
    _$ppmComplianceAtom.reportObserved();
    return super.ppmCompliance;
  }

  @override
  set ppmCompliance(double value) {
    _$ppmComplianceAtom.context.conditionallyRunInAction(() {
      super.ppmCompliance = value;
      _$ppmComplianceAtom.reportChanged();
    }, _$ppmComplianceAtom, name: '${_$ppmComplianceAtom.name}_set');
  }

  final _$slaComplianceAtom = Atom(name: '_SiteModelStore.slaCompliance');

  @override
  double get slaCompliance {
    _$slaComplianceAtom.context.enforceReadPolicy(_$slaComplianceAtom);
    _$slaComplianceAtom.reportObserved();
    return super.slaCompliance;
  }

  @override
  set slaCompliance(double value) {
    _$slaComplianceAtom.context.conditionallyRunInAction(() {
      super.slaCompliance = value;
      _$slaComplianceAtom.reportChanged();
    }, _$slaComplianceAtom, name: '${_$slaComplianceAtom.name}_set');
  }

  final _$ordersAtom = Atom(name: '_SiteModelStore.orders');

  @override
  ObservableList<OrderModelStore> get orders {
    _$ordersAtom.context.enforceReadPolicy(_$ordersAtom);
    _$ordersAtom.reportObserved();
    return super.orders;
  }

  @override
  set orders(ObservableList<OrderModelStore> value) {
    _$ordersAtom.context.conditionallyRunInAction(() {
      super.orders = value;
      _$ordersAtom.reportChanged();
    }, _$ordersAtom, name: '${_$ordersAtom.name}_set');
  }

  final _$completedOrdersAtom = Atom(name: '_SiteModelStore.completedOrders');

  @override
  ObservableList<RepairWorkModelStore> get completedOrders {
    _$completedOrdersAtom.context.enforceReadPolicy(_$completedOrdersAtom);
    _$completedOrdersAtom.reportObserved();
    return super.completedOrders;
  }

  @override
  set completedOrders(ObservableList<RepairWorkModelStore> value) {
    _$completedOrdersAtom.context.conditionallyRunInAction(() {
      super.completedOrders = value;
      _$completedOrdersAtom.reportChanged();
    }, _$completedOrdersAtom, name: '${_$completedOrdersAtom.name}_set');
  }

  final _$loadingBudgetsAtom = Atom(name: '_SiteModelStore.loadingBudgets');

  @override
  bool get loadingBudgets {
    _$loadingBudgetsAtom.context.enforceReadPolicy(_$loadingBudgetsAtom);
    _$loadingBudgetsAtom.reportObserved();
    return super.loadingBudgets;
  }

  @override
  set loadingBudgets(bool value) {
    _$loadingBudgetsAtom.context.conditionallyRunInAction(() {
      super.loadingBudgets = value;
      _$loadingBudgetsAtom.reportChanged();
    }, _$loadingBudgetsAtom, name: '${_$loadingBudgetsAtom.name}_set');
  }

  final _$loadingPPMAtom = Atom(name: '_SiteModelStore.loadingPPM');

  @override
  bool get loadingPPM {
    _$loadingPPMAtom.context.enforceReadPolicy(_$loadingPPMAtom);
    _$loadingPPMAtom.reportObserved();
    return super.loadingPPM;
  }

  @override
  set loadingPPM(bool value) {
    _$loadingPPMAtom.context.conditionallyRunInAction(() {
      super.loadingPPM = value;
      _$loadingPPMAtom.reportChanged();
    }, _$loadingPPMAtom, name: '${_$loadingPPMAtom.name}_set');
  }

  final _$loadingSLAAtom = Atom(name: '_SiteModelStore.loadingSLA');

  @override
  bool get loadingSLA {
    _$loadingSLAAtom.context.enforceReadPolicy(_$loadingSLAAtom);
    _$loadingSLAAtom.reportObserved();
    return super.loadingSLA;
  }

  @override
  set loadingSLA(bool value) {
    _$loadingSLAAtom.context.conditionallyRunInAction(() {
      super.loadingSLA = value;
      _$loadingSLAAtom.reportChanged();
    }, _$loadingSLAAtom, name: '${_$loadingSLAAtom.name}_set');
  }

  final _$loadBudgetsAsyncAction = AsyncAction('loadBudgets');

  @override
  Future<void> loadBudgets() {
    return _$loadBudgetsAsyncAction.run(() => super.loadBudgets());
  }

  final _$loadPPMAsyncAction = AsyncAction('loadPPM');

  @override
  Future<void> loadPPM() {
    return _$loadPPMAsyncAction.run(() => super.loadPPM());
  }

  final _$loadSLAAsyncAction = AsyncAction('loadSLA');

  @override
  Future<void> loadSLA() {
    return _$loadSLAAsyncAction.run(() => super.loadSLA());
  }

  final _$loadDetailsAsyncAction = AsyncAction('loadDetails');

  @override
  Future<void> loadDetails() {
    return _$loadDetailsAsyncAction.run(() => super.loadDetails());
  }
}
