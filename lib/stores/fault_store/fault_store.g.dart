// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fault_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FaultStore on _FaultStore, Store {
  final _$subserviceIdAtom = Atom(name: '_FaultStore.subserviceId');

  @override
  String get subserviceId {
    _$subserviceIdAtom.context.enforceReadPolicy(_$subserviceIdAtom);
    _$subserviceIdAtom.reportObserved();
    return super.subserviceId;
  }

  @override
  set subserviceId(String value) {
    _$subserviceIdAtom.context.conditionallyRunInAction(() {
      super.subserviceId = value;
      _$subserviceIdAtom.reportChanged();
    }, _$subserviceIdAtom, name: '${_$subserviceIdAtom.name}_set');
  }

  final _$loadBySubServiceAsyncAction = AsyncAction('loadBySubService');

  @override
  Future<void> loadBySubService(String subserviceId) {
    return _$loadBySubServiceAsyncAction
        .run(() => super.loadBySubService(subserviceId));
  }
}
