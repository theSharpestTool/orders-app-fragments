// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_model_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FileModelStore on _FileModelStore, Store {
  final _$idAtom = Atom(name: '_FileModelStore.id');

  @override
  int get id {
    _$idAtom.context.enforceReadPolicy(_$idAtom);
    _$idAtom.reportObserved();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.context.conditionallyRunInAction(() {
      super.id = value;
      _$idAtom.reportChanged();
    }, _$idAtom, name: '${_$idAtom.name}_set');
  }

  final _$orderIdAtom = Atom(name: '_FileModelStore.orderId');

  @override
  String get orderId {
    _$orderIdAtom.context.enforceReadPolicy(_$orderIdAtom);
    _$orderIdAtom.reportObserved();
    return super.orderId;
  }

  @override
  set orderId(String value) {
    _$orderIdAtom.context.conditionallyRunInAction(() {
      super.orderId = value;
      _$orderIdAtom.reportChanged();
    }, _$orderIdAtom, name: '${_$orderIdAtom.name}_set');
  }

  final _$fileKeyAtom = Atom(name: '_FileModelStore.fileKey');

  @override
  String get fileKey {
    _$fileKeyAtom.context.enforceReadPolicy(_$fileKeyAtom);
    _$fileKeyAtom.reportObserved();
    return super.fileKey;
  }

  @override
  set fileKey(String value) {
    _$fileKeyAtom.context.conditionallyRunInAction(() {
      super.fileKey = value;
      _$fileKeyAtom.reportChanged();
    }, _$fileKeyAtom, name: '${_$fileKeyAtom.name}_set');
  }

  final _$fileUrlAtom = Atom(name: '_FileModelStore.fileUrl');

  @override
  String get fileUrl {
    _$fileUrlAtom.context.enforceReadPolicy(_$fileUrlAtom);
    _$fileUrlAtom.reportObserved();
    return super.fileUrl;
  }

  @override
  set fileUrl(String value) {
    _$fileUrlAtom.context.conditionallyRunInAction(() {
      super.fileUrl = value;
      _$fileUrlAtom.reportChanged();
    }, _$fileUrlAtom, name: '${_$fileUrlAtom.name}_set');
  }

  final _$_FileModelStoreActionController =
      ActionController(name: '_FileModelStore');

  @override
  void serialize(Map<String, dynamic> data) {
    final _$actionInfo = _$_FileModelStoreActionController.startAction();
    try {
      return super.serialize(data);
    } finally {
      _$_FileModelStoreActionController.endAction(_$actionInfo);
    }
  }
}
