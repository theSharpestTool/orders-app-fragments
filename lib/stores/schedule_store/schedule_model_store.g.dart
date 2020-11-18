// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_model_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ScheduleModelStore on _ScheduleModelStore, Store {
  final _$startDateAtom = Atom(name: '_ScheduleModelStore.startDate');

  @override
  DateTime get startDate {
    _$startDateAtom.context.enforceReadPolicy(_$startDateAtom);
    _$startDateAtom.reportObserved();
    return super.startDate;
  }

  @override
  set startDate(DateTime value) {
    _$startDateAtom.context.conditionallyRunInAction(() {
      super.startDate = value;
      _$startDateAtom.reportChanged();
    }, _$startDateAtom, name: '${_$startDateAtom.name}_set');
  }

  final _$scheduleTypeAtom = Atom(name: '_ScheduleModelStore.scheduleType');

  @override
  int get scheduleType {
    _$scheduleTypeAtom.context.enforceReadPolicy(_$scheduleTypeAtom);
    _$scheduleTypeAtom.reportObserved();
    return super.scheduleType;
  }

  @override
  set scheduleType(int value) {
    _$scheduleTypeAtom.context.conditionallyRunInAction(() {
      super.scheduleType = value;
      _$scheduleTypeAtom.reportChanged();
    }, _$scheduleTypeAtom, name: '${_$scheduleTypeAtom.name}_set');
  }

  final _$startNextCycleAtom = Atom(name: '_ScheduleModelStore.startNextCycle');

  @override
  bool get startNextCycle {
    _$startNextCycleAtom.context.enforceReadPolicy(_$startNextCycleAtom);
    _$startNextCycleAtom.reportObserved();
    return super.startNextCycle;
  }

  @override
  set startNextCycle(bool value) {
    _$startNextCycleAtom.context.conditionallyRunInAction(() {
      super.startNextCycle = value;
      _$startNextCycleAtom.reportChanged();
    }, _$startNextCycleAtom, name: '${_$startNextCycleAtom.name}_set');
  }

  final _$nextOccourenceDateAtom =
      Atom(name: '_ScheduleModelStore.nextOccourenceDate');

  @override
  DateTime get nextOccourenceDate {
    _$nextOccourenceDateAtom.context
        .enforceReadPolicy(_$nextOccourenceDateAtom);
    _$nextOccourenceDateAtom.reportObserved();
    return super.nextOccourenceDate;
  }

  @override
  set nextOccourenceDate(DateTime value) {
    _$nextOccourenceDateAtom.context.conditionallyRunInAction(() {
      super.nextOccourenceDate = value;
      _$nextOccourenceDateAtom.reportChanged();
    }, _$nextOccourenceDateAtom, name: '${_$nextOccourenceDateAtom.name}_set');
  }

  final _$_ScheduleModelStoreActionController =
      ActionController(name: '_ScheduleModelStore');

  @override
  void serialize(Map<String, dynamic> data) {
    final _$actionInfo = _$_ScheduleModelStoreActionController.startAction();
    try {
      return super.serialize(data);
    } finally {
      _$_ScheduleModelStoreActionController.endAction(_$actionInfo);
    }
  }
}
