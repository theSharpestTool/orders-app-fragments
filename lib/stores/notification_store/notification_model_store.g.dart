// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NotificationModelStore on _NotificationModelStore, Store {
  Computed<String> _$titleComputed;

  @override
  String get title =>
      (_$titleComputed ??= Computed<String>(() => super.title)).value;
  Computed<String> _$bodyComputed;

  @override
  String get body =>
      (_$bodyComputed ??= Computed<String>(() => super.body)).value;

  final _$cardAtom = Atom(name: '_NotificationModelStore.card');

  @override
  CardModelStore get card {
    _$cardAtom.context.enforceReadPolicy(_$cardAtom);
    _$cardAtom.reportObserved();
    return super.card;
  }

  @override
  set card(CardModelStore value) {
    _$cardAtom.context.conditionallyRunInAction(() {
      super.card = value;
      _$cardAtom.reportChanged();
    }, _$cardAtom, name: '${_$cardAtom.name}_set');
  }

  final _$typeAtom = Atom(name: '_NotificationModelStore.type');

  @override
  NotificationType get type {
    _$typeAtom.context.enforceReadPolicy(_$typeAtom);
    _$typeAtom.reportObserved();
    return super.type;
  }

  @override
  set type(NotificationType value) {
    _$typeAtom.context.conditionallyRunInAction(() {
      super.type = value;
      _$typeAtom.reportChanged();
    }, _$typeAtom, name: '${_$typeAtom.name}_set');
  }
}
