// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_model_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CardModelStore on _CardModelStore, Store {
  Computed<String> _$createdDateStringComputed;

  @override
  String get createdDateString => (_$createdDateStringComputed ??=
          Computed<String>(() => super.createdDateString))
      .value;
  Computed<bool> _$isWaitingApprovalComputed;

  @override
  bool get isWaitingApproval => (_$isWaitingApprovalComputed ??=
          Computed<bool>(() => super.isWaitingApproval))
      .value;
  Computed<bool> _$deadlineExpiredComputed;

  @override
  bool get deadlineExpired => (_$deadlineExpiredComputed ??=
          Computed<bool>(() => super.deadlineExpired))
      .value;
  Computed<String> _$deadlineStringComputed;

  @override
  String get deadlineString => (_$deadlineStringComputed ??=
          Computed<String>(() => super.deadlineString))
      .value;

  final _$stateAtom = Atom(name: '_CardModelStore.state');

  @override
  dynamic get state {
    _$stateAtom.context.enforceReadPolicy(_$stateAtom);
    _$stateAtom.reportObserved();
    return super.state;
  }

  @override
  set state(dynamic value) {
    _$stateAtom.context.conditionallyRunInAction(() {
      super.state = value;
      _$stateAtom.reportChanged();
    }, _$stateAtom, name: '${_$stateAtom.name}_set');
  }

  final _$unitAtom = Atom(name: '_CardModelStore.unit');

  @override
  UnitModelStore get unit {
    _$unitAtom.context.enforceReadPolicy(_$unitAtom);
    _$unitAtom.reportObserved();
    return super.unit;
  }

  @override
  set unit(UnitModelStore value) {
    _$unitAtom.context.conditionallyRunInAction(() {
      super.unit = value;
      _$unitAtom.reportChanged();
    }, _$unitAtom, name: '${_$unitAtom.name}_set');
  }

  final _$imagesAtom = Atom(name: '_CardModelStore.images');

  @override
  ObservableList<String> get images {
    _$imagesAtom.context.enforceReadPolicy(_$imagesAtom);
    _$imagesAtom.reportObserved();
    return super.images;
  }

  @override
  set images(ObservableList<String> value) {
    _$imagesAtom.context.conditionallyRunInAction(() {
      super.images = value;
      _$imagesAtom.reportChanged();
    }, _$imagesAtom, name: '${_$imagesAtom.name}_set');
  }

  final _$userImagesAtom = Atom(name: '_CardModelStore.userImages');

  @override
  ObservableList<Uint8List> get userImages {
    _$userImagesAtom.context.enforceReadPolicy(_$userImagesAtom);
    _$userImagesAtom.reportObserved();
    return super.userImages;
  }

  @override
  set userImages(ObservableList<Uint8List> value) {
    _$userImagesAtom.context.conditionallyRunInAction(() {
      super.userImages = value;
      _$userImagesAtom.reportChanged();
    }, _$userImagesAtom, name: '${_$userImagesAtom.name}_set');
  }

  final _$titleImageAtom = Atom(name: '_CardModelStore.titleImage');

  @override
  String get titleImage {
    _$titleImageAtom.context.enforceReadPolicy(_$titleImageAtom);
    _$titleImageAtom.reportObserved();
    return super.titleImage;
  }

  @override
  set titleImage(String value) {
    _$titleImageAtom.context.conditionallyRunInAction(() {
      super.titleImage = value;
      _$titleImageAtom.reportChanged();
    }, _$titleImageAtom, name: '${_$titleImageAtom.name}_set');
  }

  final _$createdDateAtom = Atom(name: '_CardModelStore.createdDate');

  @override
  DateTime get createdDate {
    _$createdDateAtom.context.enforceReadPolicy(_$createdDateAtom);
    _$createdDateAtom.reportObserved();
    return super.createdDate;
  }

  @override
  set createdDate(DateTime value) {
    _$createdDateAtom.context.conditionallyRunInAction(() {
      super.createdDate = value;
      _$createdDateAtom.reportChanged();
    }, _$createdDateAtom, name: '${_$createdDateAtom.name}_set');
  }

  final _$lastStateChangeDateAtom =
      Atom(name: '_CardModelStore.lastStateChangeDate');

  @override
  DateTime get lastStateChangeDate {
    _$lastStateChangeDateAtom.context
        .enforceReadPolicy(_$lastStateChangeDateAtom);
    _$lastStateChangeDateAtom.reportObserved();
    return super.lastStateChangeDate;
  }

  @override
  set lastStateChangeDate(DateTime value) {
    _$lastStateChangeDateAtom.context.conditionallyRunInAction(() {
      super.lastStateChangeDate = value;
      _$lastStateChangeDateAtom.reportChanged();
    }, _$lastStateChangeDateAtom,
        name: '${_$lastStateChangeDateAtom.name}_set');
  }

  final _$serialAtom = Atom(name: '_CardModelStore.serial');

  @override
  num get serial {
    _$serialAtom.context.enforceReadPolicy(_$serialAtom);
    _$serialAtom.reportObserved();
    return super.serial;
  }

  @override
  set serial(num value) {
    _$serialAtom.context.conditionallyRunInAction(() {
      super.serial = value;
      _$serialAtom.reportChanged();
    }, _$serialAtom, name: '${_$serialAtom.name}_set');
  }

  final _$submittedByAtom = Atom(name: '_CardModelStore.submittedBy');

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

  final _$assignedToAtom = Atom(name: '_CardModelStore.assignedTo');

  @override
  UserStore get assignedTo {
    _$assignedToAtom.context.enforceReadPolicy(_$assignedToAtom);
    _$assignedToAtom.reportObserved();
    return super.assignedTo;
  }

  @override
  set assignedTo(UserStore value) {
    _$assignedToAtom.context.conditionallyRunInAction(() {
      super.assignedTo = value;
      _$assignedToAtom.reportChanged();
    }, _$assignedToAtom, name: '${_$assignedToAtom.name}_set');
  }

  final _$transactionsAtom = Atom(name: '_CardModelStore.transactions');

  @override
  ObservableList get transactions {
    _$transactionsAtom.context.enforceReadPolicy(_$transactionsAtom);
    _$transactionsAtom.reportObserved();
    return super.transactions;
  }

  @override
  set transactions(ObservableList value) {
    _$transactionsAtom.context.conditionallyRunInAction(() {
      super.transactions = value;
      _$transactionsAtom.reportChanged();
    }, _$transactionsAtom, name: '${_$transactionsAtom.name}_set');
  }

  final _$priorityAtom = Atom(name: '_CardModelStore.priority');

  @override
  int get priority {
    _$priorityAtom.context.enforceReadPolicy(_$priorityAtom);
    _$priorityAtom.reportObserved();
    return super.priority;
  }

  @override
  set priority(int value) {
    _$priorityAtom.context.conditionallyRunInAction(() {
      super.priority = value;
      _$priorityAtom.reportChanged();
    }, _$priorityAtom, name: '${_$priorityAtom.name}_set');
  }

  final _$serviceAtom = Atom(name: '_CardModelStore.service');

  @override
  ServiceModelStore get service {
    _$serviceAtom.context.enforceReadPolicy(_$serviceAtom);
    _$serviceAtom.reportObserved();
    return super.service;
  }

  @override
  set service(ServiceModelStore value) {
    _$serviceAtom.context.conditionallyRunInAction(() {
      super.service = value;
      _$serviceAtom.reportChanged();
    }, _$serviceAtom, name: '${_$serviceAtom.name}_set');
  }

  final _$deadlineAtom = Atom(name: '_CardModelStore.deadline');

  @override
  DateTime get deadline {
    _$deadlineAtom.context.enforceReadPolicy(_$deadlineAtom);
    _$deadlineAtom.reportObserved();
    return super.deadline;
  }

  @override
  set deadline(DateTime value) {
    _$deadlineAtom.context.conditionallyRunInAction(() {
      super.deadline = value;
      _$deadlineAtom.reportChanged();
    }, _$deadlineAtom, name: '${_$deadlineAtom.name}_set');
  }

  final _$_CardModelStoreActionController =
      ActionController(name: '_CardModelStore');

  @override
  void addImage(Uint8List image) {
    final _$actionInfo = _$_CardModelStoreActionController.startAction();
    try {
      return super.addImage(image);
    } finally {
      _$_CardModelStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void serialize(Map<String, dynamic> data) {
    final _$actionInfo = _$_CardModelStoreActionController.startAction();
    try {
      return super.serialize(data);
    } finally {
      _$_CardModelStoreActionController.endAction(_$actionInfo);
    }
  }
}
