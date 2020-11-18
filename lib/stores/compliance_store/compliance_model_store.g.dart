// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compliance_model_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ComplianceModelStore on _ComplianceModelStore, Store {
  final _$monthAtom = Atom(name: '_ComplianceModelStore.month');

  @override
  ChartData get month {
    _$monthAtom.context.enforceReadPolicy(_$monthAtom);
    _$monthAtom.reportObserved();
    return super.month;
  }

  @override
  set month(ChartData value) {
    _$monthAtom.context.conditionallyRunInAction(() {
      super.month = value;
      _$monthAtom.reportChanged();
    }, _$monthAtom, name: '${_$monthAtom.name}_set');
  }

  final _$quaterAtom = Atom(name: '_ComplianceModelStore.quater');

  @override
  ChartData get quater {
    _$quaterAtom.context.enforceReadPolicy(_$quaterAtom);
    _$quaterAtom.reportObserved();
    return super.quater;
  }

  @override
  set quater(ChartData value) {
    _$quaterAtom.context.conditionallyRunInAction(() {
      super.quater = value;
      _$quaterAtom.reportChanged();
    }, _$quaterAtom, name: '${_$quaterAtom.name}_set');
  }

  final _$yearAtom = Atom(name: '_ComplianceModelStore.year');

  @override
  ChartData get year {
    _$yearAtom.context.enforceReadPolicy(_$yearAtom);
    _$yearAtom.reportObserved();
    return super.year;
  }

  @override
  set year(ChartData value) {
    _$yearAtom.context.conditionallyRunInAction(() {
      super.year = value;
      _$yearAtom.reportChanged();
    }, _$yearAtom, name: '${_$yearAtom.name}_set');
  }

  final _$currentAtom = Atom(name: '_ComplianceModelStore.current');

  @override
  ChartData get current {
    _$currentAtom.context.enforceReadPolicy(_$currentAtom);
    _$currentAtom.reportObserved();
    return super.current;
  }

  @override
  set current(ChartData value) {
    _$currentAtom.context.conditionallyRunInAction(() {
      super.current = value;
      _$currentAtom.reportChanged();
    }, _$currentAtom, name: '${_$currentAtom.name}_set');
  }

  final _$_ComplianceModelStoreActionController =
      ActionController(name: '_ComplianceModelStore');

  @override
  void statsChanged(ChartData tasks) {
    final _$actionInfo = _$_ComplianceModelStoreActionController.startAction();
    try {
      return super.statsChanged(tasks);
    } finally {
      _$_ComplianceModelStoreActionController.endAction(_$actionInfo);
    }
  }
}
