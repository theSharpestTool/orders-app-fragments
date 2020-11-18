// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ServiceStore on _ServiceStore, Store {
  final _$unitIdAtom = Atom(name: '_ServiceStore.unitId');

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

  final _$loadByUnitAsyncAction = AsyncAction('loadByUnit');

  @override
  Future<void> loadByUnit(String unitId) {
    return _$loadByUnitAsyncAction.run(() => super.loadByUnit(unitId));
  }
}
