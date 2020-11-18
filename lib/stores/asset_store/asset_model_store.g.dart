// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_model_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AssetModelStore on _AssetModelStore, Store {
  final _$typeIdAtom = Atom(name: '_AssetModelStore.typeId');

  @override
  String get typeId {
    _$typeIdAtom.context.enforceReadPolicy(_$typeIdAtom);
    _$typeIdAtom.reportObserved();
    return super.typeId;
  }

  @override
  set typeId(String value) {
    _$typeIdAtom.context.conditionallyRunInAction(() {
      super.typeId = value;
      _$typeIdAtom.reportChanged();
    }, _$typeIdAtom, name: '${_$typeIdAtom.name}_set');
  }

  final _$unitIdAtom = Atom(name: '_AssetModelStore.unitId');

  @override
  String get unitId {
    _$unitIdAtom.context.enforceReadPolicy(_$unitIdAtom);
    _$unitIdAtom.reportObserved();
    return super.unitId;
  }

  @override
  set unitId(String value) {
    _$unitIdAtom.context.conditionallyRunInAction(() {
      super.unitId = value;
      _$unitIdAtom.reportChanged();
    }, _$unitIdAtom, name: '${_$unitIdAtom.name}_set');
  }

  final _$modelAtom = Atom(name: '_AssetModelStore.model');

  @override
  String get model {
    _$modelAtom.context.enforceReadPolicy(_$modelAtom);
    _$modelAtom.reportObserved();
    return super.model;
  }

  @override
  set model(String value) {
    _$modelAtom.context.conditionallyRunInAction(() {
      super.model = value;
      _$modelAtom.reportChanged();
    }, _$modelAtom, name: '${_$modelAtom.name}_set');
  }

  final _$brandAtom = Atom(name: '_AssetModelStore.brand');

  @override
  String get brand {
    _$brandAtom.context.enforceReadPolicy(_$brandAtom);
    _$brandAtom.reportObserved();
    return super.brand;
  }

  @override
  set brand(String value) {
    _$brandAtom.context.conditionallyRunInAction(() {
      super.brand = value;
      _$brandAtom.reportChanged();
    }, _$brandAtom, name: '${_$brandAtom.name}_set');
  }

  final _$specsAtom = Atom(name: '_AssetModelStore.specs');

  @override
  String get specs {
    _$specsAtom.context.enforceReadPolicy(_$specsAtom);
    _$specsAtom.reportObserved();
    return super.specs;
  }

  @override
  set specs(String value) {
    _$specsAtom.context.conditionallyRunInAction(() {
      super.specs = value;
      _$specsAtom.reportChanged();
    }, _$specsAtom, name: '${_$specsAtom.name}_set');
  }

  final _$_AssetModelStoreActionController =
      ActionController(name: '_AssetModelStore');

  @override
  void serialize(Map<String, dynamic> data) {
    final _$actionInfo = _$_AssetModelStoreActionController.startAction();
    try {
      return super.serialize(data);
    } finally {
      _$_AssetModelStoreActionController.endAction(_$actionInfo);
    }
  }
}
