// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_model_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClientModelStore on _ClientModelStore, Store {
  final _$providerIdAtom = Atom(name: '_ClientModelStore.providerId');

  @override
  String get providerId {
    _$providerIdAtom.context.enforceReadPolicy(_$providerIdAtom);
    _$providerIdAtom.reportObserved();
    return super.providerId;
  }

  @override
  set providerId(String value) {
    _$providerIdAtom.context.conditionallyRunInAction(() {
      super.providerId = value;
      _$providerIdAtom.reportChanged();
    }, _$providerIdAtom, name: '${_$providerIdAtom.name}_set');
  }

  final _$userRefAtom = Atom(name: '_ClientModelStore.userRef');

  @override
  String get userRef {
    _$userRefAtom.context.enforceReadPolicy(_$userRefAtom);
    _$userRefAtom.reportObserved();
    return super.userRef;
  }

  @override
  set userRef(String value) {
    _$userRefAtom.context.conditionallyRunInAction(() {
      super.userRef = value;
      _$userRefAtom.reportChanged();
    }, _$userRefAtom, name: '${_$userRefAtom.name}_set');
  }
}
