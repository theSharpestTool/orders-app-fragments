// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OrderModelStore on _OrderModelStore, Store {
  Computed<bool> _$isCompletedComputed;

  @override
  bool get isCompleted =>
      (_$isCompletedComputed ??= Computed<bool>(() => super.isCompleted)).value;
  Computed<RepairerModelStore> _$repairerComputed;

  @override
  RepairerModelStore get repairer => (_$repairerComputed ??=
          Computed<RepairerModelStore>(() => super.repairer))
      .value;
  Computed<RepairWorkModelStore> _$completedOrderComputed;

  @override
  RepairWorkModelStore get completedOrder => (_$completedOrderComputed ??=
          Computed<RepairWorkModelStore>(() => super.completedOrder))
      .value;

  final _$subserviceAtom = Atom(name: '_OrderModelStore.subservice');

  @override
  SubServiceModelStore get subservice {
    _$subserviceAtom.context.enforceReadPolicy(_$subserviceAtom);
    _$subserviceAtom.reportObserved();
    return super.subservice;
  }

  @override
  set subservice(SubServiceModelStore value) {
    _$subserviceAtom.context.conditionallyRunInAction(() {
      super.subservice = value;
      _$subserviceAtom.reportChanged();
    }, _$subserviceAtom, name: '${_$subserviceAtom.name}_set');
  }

  final _$faultAtom = Atom(name: '_OrderModelStore.fault');

  @override
  FaultModelStore get fault {
    _$faultAtom.context.enforceReadPolicy(_$faultAtom);
    _$faultAtom.reportObserved();
    return super.fault;
  }

  @override
  set fault(FaultModelStore value) {
    _$faultAtom.context.conditionallyRunInAction(() {
      super.fault = value;
      _$faultAtom.reportChanged();
    }, _$faultAtom, name: '${_$faultAtom.name}_set');
  }

  final _$isCommonAreaAtom = Atom(name: '_OrderModelStore.isCommonArea');

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

  final _$descriptionAtom = Atom(name: '_OrderModelStore.description');

  @override
  String get description {
    _$descriptionAtom.context.enforceReadPolicy(_$descriptionAtom);
    _$descriptionAtom.reportObserved();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.context.conditionallyRunInAction(() {
      super.description = value;
      _$descriptionAtom.reportChanged();
    }, _$descriptionAtom, name: '${_$descriptionAtom.name}_set');
  }

  final _$isDeletedAtom = Atom(name: '_OrderModelStore.isDeleted');

  @override
  bool get isDeleted {
    _$isDeletedAtom.context.enforceReadPolicy(_$isDeletedAtom);
    _$isDeletedAtom.reportObserved();
    return super.isDeleted;
  }

  @override
  set isDeleted(bool value) {
    _$isDeletedAtom.context.conditionallyRunInAction(() {
      super.isDeleted = value;
      _$isDeletedAtom.reportChanged();
    }, _$isDeletedAtom, name: '${_$isDeletedAtom.name}_set');
  }

  final _$deletedOnAtom = Atom(name: '_OrderModelStore.deletedOn');

  @override
  DateTime get deletedOn {
    _$deletedOnAtom.context.enforceReadPolicy(_$deletedOnAtom);
    _$deletedOnAtom.reportObserved();
    return super.deletedOn;
  }

  @override
  set deletedOn(DateTime value) {
    _$deletedOnAtom.context.conditionallyRunInAction(() {
      super.deletedOn = value;
      _$deletedOnAtom.reportChanged();
    }, _$deletedOnAtom, name: '${_$deletedOnAtom.name}_set');
  }

  final _$deletedByAtom = Atom(name: '_OrderModelStore.deletedBy');

  @override
  String get deletedBy {
    _$deletedByAtom.context.enforceReadPolicy(_$deletedByAtom);
    _$deletedByAtom.reportObserved();
    return super.deletedBy;
  }

  @override
  set deletedBy(String value) {
    _$deletedByAtom.context.conditionallyRunInAction(() {
      super.deletedBy = value;
      _$deletedByAtom.reportChanged();
    }, _$deletedByAtom, name: '${_$deletedByAtom.name}_set');
  }

  final _$ratingDetailsAtom = Atom(name: '_OrderModelStore.ratingDetails');

  @override
  RatingModelStore get ratingDetails {
    _$ratingDetailsAtom.context.enforceReadPolicy(_$ratingDetailsAtom);
    _$ratingDetailsAtom.reportObserved();
    return super.ratingDetails;
  }

  @override
  set ratingDetails(RatingModelStore value) {
    _$ratingDetailsAtom.context.conditionallyRunInAction(() {
      super.ratingDetails = value;
      _$ratingDetailsAtom.reportChanged();
    }, _$ratingDetailsAtom, name: '${_$ratingDetailsAtom.name}_set');
  }

  final _$isRatedAtom = Atom(name: '_OrderModelStore.isRated');

  @override
  bool get isRated {
    _$isRatedAtom.context.enforceReadPolicy(_$isRatedAtom);
    _$isRatedAtom.reportObserved();
    return super.isRated;
  }

  @override
  set isRated(bool value) {
    _$isRatedAtom.context.conditionallyRunInAction(() {
      super.isRated = value;
      _$isRatedAtom.reportChanged();
    }, _$isRatedAtom, name: '${_$isRatedAtom.name}_set');
  }

  final _$loadingExcelAtom = Atom(name: '_OrderModelStore.loadingExcel');

  @override
  bool get loadingExcel {
    _$loadingExcelAtom.context.enforceReadPolicy(_$loadingExcelAtom);
    _$loadingExcelAtom.reportObserved();
    return super.loadingExcel;
  }

  @override
  set loadingExcel(bool value) {
    _$loadingExcelAtom.context.conditionallyRunInAction(() {
      super.loadingExcel = value;
      _$loadingExcelAtom.reportChanged();
    }, _$loadingExcelAtom, name: '${_$loadingExcelAtom.name}_set');
  }

  final _$loadingPDFAtom = Atom(name: '_OrderModelStore.loadingPDF');

  @override
  bool get loadingPDF {
    _$loadingPDFAtom.context.enforceReadPolicy(_$loadingPDFAtom);
    _$loadingPDFAtom.reportObserved();
    return super.loadingPDF;
  }

  @override
  set loadingPDF(bool value) {
    _$loadingPDFAtom.context.conditionallyRunInAction(() {
      super.loadingPDF = value;
      _$loadingPDFAtom.reportChanged();
    }, _$loadingPDFAtom, name: '${_$loadingPDFAtom.name}_set');
  }

  final _$confirmAsyncAction = AsyncAction('confirm');

  @override
  Future<void> confirm() {
    return _$confirmAsyncAction.run(() => super.confirm());
  }

  final _$declineAsyncAction = AsyncAction('decline');

  @override
  Future<void> decline() {
    return _$declineAsyncAction.run(() => super.decline());
  }

  final _$completeAsyncAction = AsyncAction('complete');

  @override
  Future<void> complete() {
    return _$completeAsyncAction.run(() => super.complete());
  }

  final _$createRepairWorkAsyncAction = AsyncAction('createRepairWork');

  @override
  Future<void> createRepairWork() {
    return _$createRepairWorkAsyncAction.run(() => super.createRepairWork());
  }

  final _$approveQuotationAsyncAction = AsyncAction('approveQuotation');

  @override
  Future<void> approveQuotation() {
    return _$approveQuotationAsyncAction.run(() => super.approveQuotation());
  }

  final _$rejectQuotationAsyncAction = AsyncAction('rejectQuotation');

  @override
  Future<void> rejectQuotation() {
    return _$rejectQuotationAsyncAction.run(() => super.rejectQuotation());
  }

  final _$sendRateAsyncAction = AsyncAction('sendRate');

  @override
  Future<void> sendRate() {
    return _$sendRateAsyncAction.run(() => super.sendRate());
  }

  final _$printExcelAsyncAction = AsyncAction('printExcel');

  @override
  Future<void> printExcel() {
    return _$printExcelAsyncAction.run(() => super.printExcel());
  }

  final _$printPDFAsyncAction = AsyncAction('printPDF');

  @override
  Future<void> printPDF() {
    return _$printPDFAsyncAction.run(() => super.printPDF());
  }

  final _$createAsyncAction = AsyncAction('create');

  @override
  Future<Response> create() {
    return _$createAsyncAction.run(() => super.create());
  }

  final _$_OrderModelStoreActionController =
      ActionController(name: '_OrderModelStore');

  @override
  void serialize(Map<String, dynamic> data) {
    final _$actionInfo = _$_OrderModelStoreActionController.startAction();
    try {
      return super.serialize(data);
    } finally {
      _$_OrderModelStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUnit(UnitModelStore unit) {
    final _$actionInfo = _$_OrderModelStoreActionController.startAction();
    try {
      return super.setUnit(unit);
    } finally {
      _$_OrderModelStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setService(ServiceModelStore service) {
    final _$actionInfo = _$_OrderModelStoreActionController.startAction();
    try {
      return super.setService(service);
    } finally {
      _$_OrderModelStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSubService(SubServiceModelStore subservice) {
    final _$actionInfo = _$_OrderModelStoreActionController.startAction();
    try {
      return super.setSubService(subservice);
    } finally {
      _$_OrderModelStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProblem(FaultModelStore fault) {
    final _$actionInfo = _$_OrderModelStoreActionController.startAction();
    try {
      return super.setProblem(fault);
    } finally {
      _$_OrderModelStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String description) {
    final _$actionInfo = _$_OrderModelStoreActionController.startAction();
    try {
      return super.setDescription(description);
    } finally {
      _$_OrderModelStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCompliment(Compliment compliment) {
    final _$actionInfo = _$_OrderModelStoreActionController.startAction();
    try {
      return super.setCompliment(compliment);
    } finally {
      _$_OrderModelStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRating(int rating) {
    final _$actionInfo = _$_OrderModelStoreActionController.startAction();
    try {
      return super.setRating(rating);
    } finally {
      _$_OrderModelStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRatingNotes(String notes) {
    final _$actionInfo = _$_OrderModelStoreActionController.startAction();
    try {
      return super.setRatingNotes(notes);
    } finally {
      _$_OrderModelStoreActionController.endAction(_$actionInfo);
    }
  }
}
