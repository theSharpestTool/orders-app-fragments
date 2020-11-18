// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fault_model_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FaultModelStore on _FaultModelStore, Store {
  final _$daysToDueDateAtom = Atom(name: '_FaultModelStore.daysToDueDate');

  @override
  double get daysToDueDate {
    _$daysToDueDateAtom.context.enforceReadPolicy(_$daysToDueDateAtom);
    _$daysToDueDateAtom.reportObserved();
    return super.daysToDueDate;
  }

  @override
  set daysToDueDate(double value) {
    _$daysToDueDateAtom.context.conditionallyRunInAction(() {
      super.daysToDueDate = value;
      _$daysToDueDateAtom.reportChanged();
    }, _$daysToDueDateAtom, name: '${_$daysToDueDateAtom.name}_set');
  }

  final _$serviceAtom = Atom(name: '_FaultModelStore.service');

  @override
  ServiceModelStore get service {
    _$serviceAtom.context.enforceReadPolicy(_$serviceAtom);
    _$serviceAtom.reportObserved();
    return super.service;
  }

  @override
  set service(ServiceModelStore value) {
    _$serviceAtom.context.conditionallyRunInAction(() {
      super.service = value;
      _$serviceAtom.reportChanged();
    }, _$serviceAtom, name: '${_$serviceAtom.name}_set');
  }

  final _$serviceIdAtom = Atom(name: '_FaultModelStore.serviceId');

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

  final _$hoursToDueDateAtom = Atom(name: '_FaultModelStore.hoursToDueDate');

  @override
  double get hoursToDueDate {
    _$hoursToDueDateAtom.context.enforceReadPolicy(_$hoursToDueDateAtom);
    _$hoursToDueDateAtom.reportObserved();
    return super.hoursToDueDate;
  }

  @override
  set hoursToDueDate(double value) {
    _$hoursToDueDateAtom.context.conditionallyRunInAction(() {
      super.hoursToDueDate = value;
      _$hoursToDueDateAtom.reportChanged();
    }, _$hoursToDueDateAtom, name: '${_$hoursToDueDateAtom.name}_set');
  }

  final _$hoursForRepairerAtom =
      Atom(name: '_FaultModelStore.hoursForRepairer');

  @override
  double get hoursForRepairer {
    _$hoursForRepairerAtom.context
        .enforceReadPolicy(_$hoursForRepairerAtom);
    _$hoursForRepairerAtom.reportObserved();
    return super.hoursForRepairer;
  }

  @override
  set hoursForRepairer(double value) {
    _$hoursForRepairerAtom.context.conditionallyRunInAction(() {
      super.hoursForRepairer = value;
      _$hoursForRepairerAtom.reportChanged();
    }, _$hoursForRepairerAtom, name: '${_$hoursForRepairerAtom.name}_set');
  }

  final _$_FaultModelStoreActionController =
      ActionController(name: '_FaultModelStore');

  @override
  void serialize(Map<String, dynamic> json) {
    final _$actionInfo = _$_FaultModelStoreActionController.startAction();
    try {
      return super.serialize(json);
    } finally {
      _$_FaultModelStoreActionController.endAction(_$actionInfo);
    }
  }
}
