// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tool_model_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ToolModelStore on _ToolModelStore, Store {
  final _$isAddedAtom = Atom(name: '_ToolModelStore.isAdded');

  @override
  bool get isAdded {
    _$isAddedAtom.context.enforceReadPolicy(_$isAddedAtom);
    _$isAddedAtom.reportObserved();
    return super.isAdded;
  }

  @override
  set isAdded(bool value) {
    _$isAddedAtom.context.conditionallyRunInAction(() {
      super.isAdded = value;
      _$isAddedAtom.reportChanged();
    }, _$isAddedAtom, name: '${_$isAddedAtom.name}_set');
  }

  final _$_ToolModelStoreActionController =
      ActionController(name: '_ToolModelStore');

  @override
  void serialize(Map<String, dynamic> data) {
    final _$actionInfo = _$_ToolModelStoreActionController.startAction();
    try {
      return super.serialize(data);
    } finally {
      _$_ToolModelStoreActionController.endAction(_$actionInfo);
    }
  }
}
