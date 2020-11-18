// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repair_work_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RepairWorkStore on _RepairWorkStore, Store {
  Computed<ObservableList<RepairWorkModelStore>> _$quoteApprovedComputed;

  @override
  ObservableList<RepairWorkModelStore> get quoteApproved =>
      (_$quoteApprovedComputed ??=
              Computed<ObservableList<RepairWorkModelStore>>(
                  () => super.quoteApproved))
          .value;
  Computed<ObservableList<RepairWorkModelStore>> _$quoteRejectedComputed;

  @override
  ObservableList<RepairWorkModelStore> get quoteRejected =>
      (_$quoteRejectedComputed ??=
              Computed<ObservableList<RepairWorkModelStore>>(
                  () => super.quoteRejected))
          .value;
  Computed<ObservableList<RepairWorkModelStore>> _$inProgressComputed;

  @override
  ObservableList<RepairWorkModelStore> get inProgress =>
      (_$inProgressComputed ??= Computed<ObservableList<RepairWorkModelStore>>(
              () => super.inProgress))
          .value;
  Computed<ObservableList<RepairWorkModelStore>> _$completedOrderCompletedComputed;

  @override
  ObservableList<RepairWorkModelStore> get completedOrderCompleted =>
      (_$completedOrderCompletedComputed ??=
              Computed<ObservableList<RepairWorkModelStore>>(
                  () => super.completedOrderCompleted))
          .value;
  Computed<ObservableList<RepairWorkModelStore>> _$notCompletedComputed;

  @override
  ObservableList<RepairWorkModelStore> get notCompleted =>
      (_$notCompletedComputed ??= Computed<ObservableList<RepairWorkModelStore>>(
              () => super.notCompleted))
          .value;

  final _$goToRepairWorkAsyncAction = AsyncAction('goToRepairWork');

  @override
  Future<void> goToRepairWork({OrderModelStore order, TaskModelStore task}) {
    return _$goToRepairWorkAsyncAction
        .run(() => super.goToRepairWork(order: order, task: task));
  }
}
