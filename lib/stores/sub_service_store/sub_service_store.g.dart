// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_service_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SubServiceStore on _SubServiceStore, Store {
  final _$serviceIdAtom = Atom(name: '_SubServiceStore.serviceId');

  @override
  String get serviceId {
    _$serviceIdAtom.context.enforceReadPolicy(_$serviceIdAtom);
    _$serviceIdAtom.reportObserved();
    return super.serviceId;
  }

  @override
  set serviceId(String value) {
    _$serviceIdAtom.context.conditionallyRunInAction(() {
      super.serviceId = value;
      _$serviceIdAtom.reportChanged();
    }, _$serviceIdAtom, name: '${_$serviceIdAtom.name}_set');
  }

  final _$unitIdAtom = Atom(name: '_SubServiceStore.unitId');

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

  final _$loadByServiceAsyncAction = AsyncAction('loadByService');

  @override
  Future<void> loadByService({String serviceId, String unitId}) {
    return _$loadByServiceAsyncAction
        .run(() => super.loadByService(serviceId: serviceId, unitId: unitId));
  }
}
