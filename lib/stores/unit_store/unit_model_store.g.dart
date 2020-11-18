// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_model_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UnitModelStore on _UnitModelStore, Store {
  final _$isCommonAreaAtom = Atom(name: '_UnitModelStore.isCommonArea');

  @override
  bool get isCommonArea {
    _$isCommonAreaAtom.context.enforceReadPolicy(_$isCommonAreaAtom);
    _$isCommonAreaAtom.reportObserved();
    return super.isCommonArea;
  }

  @override
  set isCommonArea(bool value) {
    _$isCommonAreaAtom.context.conditionallyRunInAction(() {
      super.isCommonArea = value;
      _$isCommonAreaAtom.reportChanged();
    }, _$isCommonAreaAtom, name: '${_$isCommonAreaAtom.name}_set');
  }

  final _$siteAtom = Atom(name: '_UnitModelStore.site');

  @override
  SiteModelStore get site {
    _$siteAtom.context.enforceReadPolicy(_$siteAtom);
    _$siteAtom.reportObserved();
    return super.site;
  }

  @override
  set site(SiteModelStore value) {
    _$siteAtom.context.conditionallyRunInAction(() {
      super.site = value;
      _$siteAtom.reportChanged();
    }, _$siteAtom, name: '${_$siteAtom.name}_set');
  }

  final _$unitTypeAtom = Atom(name: '_UnitModelStore.unitType');

  @override
  UnitTypeModelStore get unitType {
    _$unitTypeAtom.context.enforceReadPolicy(_$unitTypeAtom);
    _$unitTypeAtom.reportObserved();
    return super.unitType;
  }

  @override
  set unitType(UnitTypeModelStore value) {
    _$unitTypeAtom.context.conditionallyRunInAction(() {
      super.unitType = value;
      _$unitTypeAtom.reportChanged();
    }, _$unitTypeAtom, name: '${_$unitTypeAtom.name}_set');
  }

  final _$assignAsyncAction = AsyncAction('assign');

  @override
  Future<void> assign({Function Function(dynamic) onError}) {
    return _$assignAsyncAction.run(() => super.assign(onError: onError));
  }

  final _$_UnitModelStoreActionController =
      ActionController(name: '_UnitModelStore');

  @override
  void serialize(Map<String, dynamic> data) {
    final _$actionInfo = _$_UnitModelStoreActionController.startAction();
    try {
      return super.serialize(data);
    } finally {
      _$_UnitModelStoreActionController.endAction(_$actionInfo);
    }
  }
}
