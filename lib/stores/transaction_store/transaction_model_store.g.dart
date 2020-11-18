// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TransactionModelStore on _TransactionModelStore, Store {
  final _$createDateAtom = Atom(name: '_TransactionModelStore.createDate');

  @override
  DateTime get createDate {
    _$createDateAtom.context.enforceReadPolicy(_$createDateAtom);
    _$createDateAtom.reportObserved();
    return super.createDate;
  }

  @override
  set createDate(DateTime value) {
    _$createDateAtom.context.conditionallyRunInAction(() {
      super.createDate = value;
      _$createDateAtom.reportChanged();
    }, _$createDateAtom, name: '${_$createDateAtom.name}_set');
  }

  final _$stateAtom = Atom(name: '_TransactionModelStore.state');

  @override
  int get state {
    _$stateAtom.context.enforceReadPolicy(_$stateAtom);
    _$stateAtom.reportObserved();
    return super.state;
  }

  @override
  set state(int value) {
    _$stateAtom.context.conditionallyRunInAction(() {
      super.state = value;
      _$stateAtom.reportChanged();
    }, _$stateAtom, name: '${_$stateAtom.name}_set');
  }

  final _$notesAtom = Atom(name: '_TransactionModelStore.notes');

  @override
  String get notes {
    _$notesAtom.context.enforceReadPolicy(_$notesAtom);
    _$notesAtom.reportObserved();
    return super.notes;
  }

  @override
  set notes(String value) {
    _$notesAtom.context.conditionallyRunInAction(() {
      super.notes = value;
      _$notesAtom.reportChanged();
    }, _$notesAtom, name: '${_$notesAtom.name}_set');
  }

  final _$submittedByAtom = Atom(name: '_TransactionModelStore.submittedBy');

  @override
  UserStore get submittedBy {
    _$submittedByAtom.context.enforceReadPolicy(_$submittedByAtom);
    _$submittedByAtom.reportObserved();
    return super.submittedBy;
  }

  @override
  set submittedBy(UserStore value) {
    _$submittedByAtom.context.conditionallyRunInAction(() {
      super.submittedBy = value;
      _$submittedByAtom.reportChanged();
    }, _$submittedByAtom, name: '${_$submittedByAtom.name}_set');
  }

  final _$_TransactionModelStoreActionController =
      ActionController(name: '_TransactionModelStore');

  @override
  void serialize(Map<String, dynamic> data) {
    final _$actionInfo = _$_TransactionModelStoreActionController.startAction();
    try {
      return super.serialize(data);
    } finally {
      _$_TransactionModelStoreActionController.endAction(_$actionInfo);
    }
  }
}
