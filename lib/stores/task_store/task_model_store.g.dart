// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TaskModelStore on _TaskModelStore, Store {
  Computed<RepairWorkModelStore> _$completedOrderComputed;

  @override
  RepairWorkModelStore get completedOrder => (_$completedOrderComputed ??=
          Computed<RepairWorkModelStore>(() => super.completedOrder))
      .value;

  final _$scheduledDateAtom = Atom(name: '_TaskModelStore.scheduledDate');

  @override
  DateTime get scheduledDate {
    _$scheduledDateAtom.context.enforceReadPolicy(_$scheduledDateAtom);
    _$scheduledDateAtom.reportObserved();
    return super.scheduledDate;
  }

  @override
  set scheduledDate(DateTime value) {
    _$scheduledDateAtom.context.conditionallyRunInAction(() {
      super.scheduledDate = value;
      _$scheduledDateAtom.reportChanged();
    }, _$scheduledDateAtom, name: '${_$scheduledDateAtom.name}_set');
  }

  final _$siteServiceAtom = Atom(name: '_TaskModelStore.siteService');

  @override
  SiteServiceModelStore get siteService {
    _$siteServiceAtom.context.enforceReadPolicy(_$siteServiceAtom);
    _$siteServiceAtom.reportObserved();
    return super.siteService;
  }

  @override
  set siteService(SiteServiceModelStore value) {
    _$siteServiceAtom.context.conditionallyRunInAction(() {
      super.siteService = value;
      _$siteServiceAtom.reportChanged();
    }, _$siteServiceAtom, name: '${_$siteServiceAtom.name}_set');
  }

  final _$assetAtom = Atom(name: '_TaskModelStore.asset');

  @override
  AssetModelStore get asset {
    _$assetAtom.context.enforceReadPolicy(_$assetAtom);
    _$assetAtom.reportObserved();
    return super.asset;
  }

  @override
  set asset(AssetModelStore value) {
    _$assetAtom.context.conditionallyRunInAction(() {
      super.asset = value;
      _$assetAtom.reportChanged();
    }, _$assetAtom, name: '${_$assetAtom.name}_set');
  }

  final _$descriptionAtom = Atom(name: '_TaskModelStore.description');

  @override
  String get description {
    _$descriptionAtom.context.enforceReadPolicy(_$descriptionAtom);
    _$descriptionAtom.reportObserved();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.context.conditionallyRunInAction(() {
      super.description = value;
      _$descriptionAtom.reportChanged();
    }, _$descriptionAtom, name: '${_$descriptionAtom.name}_set');
  }

  final _$createRepairWorkAsyncAction = AsyncAction('createRepairWork');

  @override
  Future<void> createRepairWork() {
    return _$createRepairWorkAsyncAction.run(() => super.createRepairWork());
  }

  final _$markAsDoneAsyncAction = AsyncAction('markAsDone');

  @override
  Future<void> markAsDone() {
    return _$markAsDoneAsyncAction.run(() => super.markAsDone());
  }

  final _$_TaskModelStoreActionController =
      ActionController(name: '_TaskModelStore');

  @override
  void serialize(Map<String, dynamic> data) {
    final _$actionInfo = _$_TaskModelStoreActionController.startAction();
    try {
      return super.serialize(data);
    } finally {
      _$_TaskModelStoreActionController.endAction(_$actionInfo);
    }
  }
}
