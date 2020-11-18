// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kpi_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$KPIStore on _KPIStore, Store {
  Computed<String> _$createdOrdersStringComputed;

  @override
  String get createdOrdersString => (_$createdOrdersStringComputed ??=
          Computed<String>(() => super.createdOrdersString))
      .value;
  Computed<String> _$createdRepairWorksStringComputed;

  @override
  String get createdRepairWorksString => (_$createdRepairWorksStringComputed ??=
          Computed<String>(() => super.createdRepairWorksString))
      .value;

  final _$loadingAtom = Atom(name: '_KPIStore.loading');

  @override
  bool get loading {
    _$loadingAtom.context.enforceReadPolicy(_$loadingAtom);
    _$loadingAtom.reportObserved();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.context.conditionallyRunInAction(() {
      super.loading = value;
      _$loadingAtom.reportChanged();
    }, _$loadingAtom, name: '${_$loadingAtom.name}_set');
  }

  final _$loadedAtom = Atom(name: '_KPIStore.loaded');

  @override
  bool get loaded {
    _$loadedAtom.context.enforceReadPolicy(_$loadedAtom);
    _$loadedAtom.reportObserved();
    return super.loaded;
  }

  @override
  set loaded(bool value) {
    _$loadedAtom.context.conditionallyRunInAction(() {
      super.loaded = value;
      _$loadedAtom.reportChanged();
    }, _$loadedAtom, name: '${_$loadedAtom.name}_set');
  }

  final _$createdOrdersCountAtom =
      Atom(name: '_KPIStore.createdOrdersCount');

  @override
  int get createdOrdersCount {
    _$createdOrdersCountAtom.context
        .enforceReadPolicy(_$createdOrdersCountAtom);
    _$createdOrdersCountAtom.reportObserved();
    return super.createdOrdersCount;
  }

  @override
  set createdOrdersCount(int value) {
    _$createdOrdersCountAtom.context.conditionallyRunInAction(() {
      super.createdOrdersCount = value;
      _$createdOrdersCountAtom.reportChanged();
    }, _$createdOrdersCountAtom,
        name: '${_$createdOrdersCountAtom.name}_set');
  }

  final _$createdRepairWorksCountAtom =
      Atom(name: '_KPIStore.createdRepairWorksCount');

  @override
  int get createdRepairWorksCount {
    _$createdRepairWorksCountAtom.context
        .enforceReadPolicy(_$createdRepairWorksCountAtom);
    _$createdRepairWorksCountAtom.reportObserved();
    return super.createdRepairWorksCount;
  }

  @override
  set createdRepairWorksCount(int value) {
    _$createdRepairWorksCountAtom.context.conditionallyRunInAction(() {
      super.createdRepairWorksCount = value;
      _$createdRepairWorksCountAtom.reportChanged();
    }, _$createdRepairWorksCountAtom,
        name: '${_$createdRepairWorksCountAtom.name}_set');
  }

  final _$loadAsyncAction = AsyncAction('load');

  @override
  Future<void> load() {
    return _$loadAsyncAction.run(() => super.load());
  }
}
