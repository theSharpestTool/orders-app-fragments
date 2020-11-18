// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_model_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ServiceModelStore on _ServiceModelStore, Store {
  final _$categoryIdAtom = Atom(name: '_ServiceModelStore.categoryId');

  @override
  String get categoryId {
    _$categoryIdAtom.context.enforceReadPolicy(_$categoryIdAtom);
    _$categoryIdAtom.reportObserved();
    return super.categoryId;
  }

  @override
  set categoryId(String value) {
    _$categoryIdAtom.context.conditionallyRunInAction(() {
      super.categoryId = value;
      _$categoryIdAtom.reportChanged();
    }, _$categoryIdAtom, name: '${_$categoryIdAtom.name}_set');
  }

  final _$categoryAtom = Atom(name: '_ServiceModelStore.category');

  @override
  BaseModelStore get category {
    _$categoryAtom.context.enforceReadPolicy(_$categoryAtom);
    _$categoryAtom.reportObserved();
    return super.category;
  }

  @override
  set category(BaseModelStore value) {
    _$categoryAtom.context.conditionallyRunInAction(() {
      super.category = value;
      _$categoryAtom.reportChanged();
    }, _$categoryAtom, name: '${_$categoryAtom.name}_set');
  }

  final _$orderAtom = Atom(name: '_ServiceModelStore.order');

  @override
  num get order {
    _$orderAtom.context.enforceReadPolicy(_$orderAtom);
    _$orderAtom.reportObserved();
    return super.order;
  }

  @override
  set order(num value) {
    _$orderAtom.context.conditionallyRunInAction(() {
      super.order = value;
      _$orderAtom.reportChanged();
    }, _$orderAtom, name: '${_$orderAtom.name}_set');
  }

  final _$unitTypesAtom = Atom(name: '_ServiceModelStore.unitTypes');

  @override
  ObservableList<UnitTypeModelStore> get unitTypes {
    _$unitTypesAtom.context.enforceReadPolicy(_$unitTypesAtom);
    _$unitTypesAtom.reportObserved();
    return super.unitTypes;
  }

  @override
  set unitTypes(ObservableList<UnitTypeModelStore> value) {
    _$unitTypesAtom.context.conditionallyRunInAction(() {
      super.unitTypes = value;
      _$unitTypesAtom.reportChanged();
    }, _$unitTypesAtom, name: '${_$unitTypesAtom.name}_set');
  }

  final _$subServicesAtom = Atom(name: '_ServiceModelStore.subServices');

  @override
  ObservableList<SubServiceModelStore> get subServices {
    _$subServicesAtom.context.enforceReadPolicy(_$subServicesAtom);
    _$subServicesAtom.reportObserved();
    return super.subServices;
  }

  @override
  set subServices(ObservableList<SubServiceModelStore> value) {
    _$subServicesAtom.context.conditionallyRunInAction(() {
      super.subServices = value;
      _$subServicesAtom.reportChanged();
    }, _$subServicesAtom, name: '${_$subServicesAtom.name}_set');
  }

  final _$_ServiceModelStoreActionController =
      ActionController(name: '_ServiceModelStore');

  @override
  void serialize(Map<String, dynamic> data) {
    final _$actionInfo = _$_ServiceModelStoreActionController.startAction();
    try {
      return super.serialize(data);
    } finally {
      _$_ServiceModelStoreActionController.endAction(_$actionInfo);
    }
  }
}
