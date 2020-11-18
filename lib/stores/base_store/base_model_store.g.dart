// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_model_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BaseModelStore on _BaseModelStore, Store {
  final _$loadingAtom = Atom(name: '_BaseModelStore.loading');

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

  final _$loadedAtom = Atom(name: '_BaseModelStore.loaded');

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

  final _$idAtom = Atom(name: '_BaseModelStore.id');

  @override
  String get id {
    _$idAtom.context.enforceReadPolicy(_$idAtom);
    _$idAtom.reportObserved();
    return super.id;
  }

  @override
  set id(String value) {
    _$idAtom.context.conditionallyRunInAction(() {
      super.id = value;
      _$idAtom.reportChanged();
    }, _$idAtom, name: '${_$idAtom.name}_set');
  }

  final _$nameAtom = Atom(name: '_BaseModelStore.name');

  @override
  String get name {
    _$nameAtom.context.enforceReadPolicy(_$nameAtom);
    _$nameAtom.reportObserved();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.context.conditionallyRunInAction(() {
      super.name = value;
      _$nameAtom.reportChanged();
    }, _$nameAtom, name: '${_$nameAtom.name}_set');
  }

  final _$textColorCodeAtom = Atom(name: '_BaseModelStore.textColorCode');

  @override
  ColorCodes get textColorCode {
    _$textColorCodeAtom.context.enforceReadPolicy(_$textColorCodeAtom);
    _$textColorCodeAtom.reportObserved();
    return super.textColorCode;
  }

  @override
  set textColorCode(ColorCodes value) {
    _$textColorCodeAtom.context.conditionallyRunInAction(() {
      super.textColorCode = value;
      _$textColorCodeAtom.reportChanged();
    }, _$textColorCodeAtom, name: '${_$textColorCodeAtom.name}_set');
  }

  final _$_BaseModelStoreActionController =
      ActionController(name: '_BaseModelStore');

  @override
  void serialize(Map<String, dynamic> data) {
    final _$actionInfo = _$_BaseModelStoreActionController.startAction();
    try {
      return super.serialize(data);
    } finally {
      _$_BaseModelStoreActionController.endAction(_$actionInfo);
    }
  }
}
