// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_type_model_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UnitTypeModelStore on _UnitTypeModelStore, Store {
  final _$enableLeaserOrderAtom =
      Atom(name: '_UnitTypeModelStore.enableLeaserOrder');

  @override
  bool get enableLeaserOrder {
    _$enableLeaserOrderAtom.context
        .enforceReadPolicy(_$enableLeaserOrderAtom);
    _$enableLeaserOrderAtom.reportObserved();
    return super.enableLeaserOrder;
  }

  @override
  set enableLeaserOrder(bool value) {
    _$enableLeaserOrderAtom.context.conditionallyRunInAction(() {
      super.enableLeaserOrder = value;
      _$enableLeaserOrderAtom.reportChanged();
    }, _$enableLeaserOrderAtom,
        name: '${_$enableLeaserOrderAtom.name}_set');
  }

  final _$servicesAtom = Atom(name: '_UnitTypeModelStore.services');

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

  final _$_UnitTypeModelStoreActionController =
      ActionController(name: '_UnitTypeModelStore');

  @override
  void serialize(Map<String, dynamic> data) {
    final _$actionInfo = _$_UnitTypeModelStoreActionController.startAction();
    try {
      return super.serialize(data);
    } finally {
      _$_UnitTypeModelStoreActionController.endAction(_$actionInfo);
    }
  }
}
