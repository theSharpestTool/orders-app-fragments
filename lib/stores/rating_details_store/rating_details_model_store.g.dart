// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_details_model_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RatingModelStore on _RatingModelStore, Store {
  Computed<String> _$createDateStringComputed;

  @override
  String get createDateString => (_$createDateStringComputed ??=
          Computed<String>(() => super.createDateString))
      .value;

  final _$userAtom = Atom(name: '_RatingModelStore.user');

  @override
  UserStore get user {
    _$userAtom.context.enforceReadPolicy(_$userAtom);
    _$userAtom.reportObserved();
    return super.user;
  }

  @override
  set user(UserStore value) {
    _$userAtom.context.conditionallyRunInAction(() {
      super.user = value;
      _$userAtom.reportChanged();
    }, _$userAtom, name: '${_$userAtom.name}_set');
  }

  final _$createDateAtom = Atom(name: '_RatingModelStore.createDate');

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

  final _$stateAtom = Atom(name: '_RatingModelStore.state');

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

  final _$notesAtom = Atom(name: '_RatingModelStore.notes');

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

  final _$complimentAtom = Atom(name: '_RatingModelStore.compliment');

  @override
  Compliment get compliment {
    _$complimentAtom.context.enforceReadPolicy(_$complimentAtom);
    _$complimentAtom.reportObserved();
    return super.compliment;
  }

  @override
  set compliment(Compliment value) {
    _$complimentAtom.context.conditionallyRunInAction(() {
      super.compliment = value;
      _$complimentAtom.reportChanged();
    }, _$complimentAtom, name: '${_$complimentAtom.name}_set');
  }

  final _$ratingAtom = Atom(name: '_RatingModelStore.rating');

  @override
  int get rating {
    _$ratingAtom.context.enforceReadPolicy(_$ratingAtom);
    _$ratingAtom.reportObserved();
    return super.rating;
  }

  @override
  set rating(int value) {
    _$ratingAtom.context.conditionallyRunInAction(() {
      super.rating = value;
      _$ratingAtom.reportChanged();
    }, _$ratingAtom, name: '${_$ratingAtom.name}_set');
  }

  final _$orderIdAtom = Atom(name: '_RatingModelStore.orderId');

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
}
