// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repair_work_model_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RepairWorkModelStore on _RepairWorkModelStore, Store {
  Computed<bool> _$hasPartsComputed;

  @override
  bool get hasParts =>
      (_$hasPartsComputed ??= Computed<bool>(() => super.hasParts)).value;

  final _$orderAtom = Atom(name: '_RepairWorkModelStore.order');

  @override
  OrderModelStore get order {
    _$orderAtom.context.enforceReadPolicy(_$orderAtom);
    _$orderAtom.reportObserved();
    return super.order;
  }

  @override
  set order(OrderModelStore value) {
    _$orderAtom.context.conditionallyRunInAction(() {
      super.order = value;
      _$orderAtom.reportChanged();
    }, _$orderAtom, name: '${_$orderAtom.name}_set');
  }

  final _$taskAtom = Atom(name: '_RepairWorkModelStore.task');

  @override
  TaskModelStore get task {
    _$taskAtom.context.enforceReadPolicy(_$taskAtom);
    _$taskAtom.reportObserved();
    return super.task;
  }

  @override
  set task(TaskModelStore value) {
    _$taskAtom.context.conditionallyRunInAction(() {
      super.task = value;
      _$taskAtom.reportChanged();
    }, _$taskAtom, name: '${_$taskAtom.name}_set');
  }

  final _$totalCostAtom = Atom(name: '_RepairWorkModelStore.totalCost');

  @override
  double get totalCost {
    _$totalCostAtom.context.enforceReadPolicy(_$totalCostAtom);
    _$totalCostAtom.reportObserved();
    return super.totalCost;
  }

  @override
  set totalCost(double value) {
    _$totalCostAtom.context.conditionallyRunInAction(() {
      super.totalCost = value;
      _$totalCostAtom.reportChanged();
    }, _$totalCostAtom, name: '${_$totalCostAtom.name}_set');
  }

  final _$repairerAtom = Atom(name: '_RepairWorkModelStore.repairer');

  @override
  RepairerModelStore get repairer {
    _$repairerAtom.context.enforceReadPolicy(_$repairerAtom);
    _$repairerAtom.reportObserved();
    return super.repairer;
  }

  @override
  set repairer(RepairerModelStore value) {
    _$repairerAtom.context.conditionallyRunInAction(() {
      super.repairer = value;
      _$repairerAtom.reportChanged();
    }, _$repairerAtom, name: '${_$repairerAtom.name}_set');
  }

  final _$partsAtom = Atom(name: '_RepairWorkModelStore.parts');

  @override
  ObservableList<PartModelStore> get parts {
    _$partsAtom.context.enforceReadPolicy(_$partsAtom);
    _$partsAtom.reportObserved();
    return super.parts;
  }

  @override
  set parts(ObservableList<PartModelStore> value) {
    _$partsAtom.context.conditionallyRunInAction(() {
      super.parts = value;
      _$partsAtom.reportChanged();
    }, _$partsAtom, name: '${_$partsAtom.name}_set');
  }

  final _$toolsAtom = Atom(name: '_RepairWorkModelStore.tools');

  @override
  ObservableList<ToolModelStore> get tools {
    _$toolsAtom.context.enforceReadPolicy(_$toolsAtom);
    _$toolsAtom.reportObserved();
    return super.tools;
  }

  @override
  set tools(ObservableList<ToolModelStore> value) {
    _$toolsAtom.context.conditionallyRunInAction(() {
      super.tools = value;
      _$toolsAtom.reportChanged();
    }, _$toolsAtom, name: '${_$toolsAtom.name}_set');
  }

  final _$costsAtom = Atom(name: '_RepairWorkModelStore.costs');

  @override
  ObservableList<CostModelStore> get costs {
    _$costsAtom.context.enforceReadPolicy(_$costsAtom);
    _$costsAtom.reportObserved();
    return super.costs;
  }

  @override
  set costs(ObservableList<CostModelStore> value) {
    _$costsAtom.context.conditionallyRunInAction(() {
      super.costs = value;
      _$costsAtom.reportChanged();
    }, _$costsAtom, name: '${_$costsAtom.name}_set');
  }

  final _$instructionsAtom = Atom(name: '_RepairWorkModelStore.instructions');

  @override
  String get instructions {
    _$instructionsAtom.context.enforceReadPolicy(_$instructionsAtom);
    _$instructionsAtom.reportObserved();
    return super.instructions;
  }

  @override
  set instructions(String value) {
    _$instructionsAtom.context.conditionallyRunInAction(() {
      super.instructions = value;
      _$instructionsAtom.reportChanged();
    }, _$instructionsAtom, name: '${_$instructionsAtom.name}_set');
  }

  final _$descriptionAtom = Atom(name: '_RepairWorkModelStore.description');

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

  final _$pendingApprovalDateAtom =
      Atom(name: '_RepairWorkModelStore.pendingApprovalDate');

  @override
  DateTime get pendingApprovalDate {
    _$pendingApprovalDateAtom.context
        .enforceReadPolicy(_$pendingApprovalDateAtom);
    _$pendingApprovalDateAtom.reportObserved();
    return super.pendingApprovalDate;
  }

  @override
  set pendingApprovalDate(DateTime value) {
    _$pendingApprovalDateAtom.context.conditionallyRunInAction(() {
      super.pendingApprovalDate = value;
      _$pendingApprovalDateAtom.reportChanged();
    }, _$pendingApprovalDateAtom,
        name: '${_$pendingApprovalDateAtom.name}_set');
  }

  final _$deadLineDateTimeAtom =
      Atom(name: '_RepairWorkModelStore.deadLineDateTime');

  @override
  DateTime get deadLineDateTime {
    _$deadLineDateTimeAtom.context.enforceReadPolicy(_$deadLineDateTimeAtom);
    _$deadLineDateTimeAtom.reportObserved();
    return super.deadLineDateTime;
  }

  @override
  set deadLineDateTime(DateTime value) {
    _$deadLineDateTimeAtom.context.conditionallyRunInAction(() {
      super.deadLineDateTime = value;
      _$deadLineDateTimeAtom.reportChanged();
    }, _$deadLineDateTimeAtom, name: '${_$deadLineDateTimeAtom.name}_set');
  }

  final _$deadLineDateTimeForTechAtom =
      Atom(name: '_RepairWorkModelStore.deadLineDateTimeForTech');

  @override
  DateTime get deadLineDateTimeForTech {
    _$deadLineDateTimeForTechAtom.context
        .enforceReadPolicy(_$deadLineDateTimeForTechAtom);
    _$deadLineDateTimeForTechAtom.reportObserved();
    return super.deadLineDateTimeForTech;
  }

  @override
  set deadLineDateTimeForTech(DateTime value) {
    _$deadLineDateTimeForTechAtom.context.conditionallyRunInAction(() {
      super.deadLineDateTimeForTech = value;
      _$deadLineDateTimeForTechAtom.reportChanged();
    }, _$deadLineDateTimeForTechAtom,
        name: '${_$deadLineDateTimeForTechAtom.name}_set');
  }

  final _$assignedDateAtom = Atom(name: '_RepairWorkModelStore.assignedDate');

  @override
  DateTime get assignedDate {
    _$assignedDateAtom.context.enforceReadPolicy(_$assignedDateAtom);
    _$assignedDateAtom.reportObserved();
    return super.assignedDate;
  }

  @override
  set assignedDate(DateTime value) {
    _$assignedDateAtom.context.conditionallyRunInAction(() {
      super.assignedDate = value;
      _$assignedDateAtom.reportChanged();
    }, _$assignedDateAtom, name: '${_$assignedDateAtom.name}_set');
  }

  final _$currentCostAtom = Atom(name: '_RepairWorkModelStore.currentCost');

  @override
  CostModelStore get currentCost {
    _$currentCostAtom.context.enforceReadPolicy(_$currentCostAtom);
    _$currentCostAtom.reportObserved();
    return super.currentCost;
  }

  @override
  set currentCost(CostModelStore value) {
    _$currentCostAtom.context.conditionallyRunInAction(() {
      super.currentCost = value;
      _$currentCostAtom.reportChanged();
    }, _$currentCostAtom, name: '${_$currentCostAtom.name}_set');
  }

  final _$approvalNeededAtom =
      Atom(name: '_RepairWorkModelStore.approvalNeeded');

  @override
  bool get approvalNeeded {
    _$approvalNeededAtom.context.enforceReadPolicy(_$approvalNeededAtom);
    _$approvalNeededAtom.reportObserved();
    return super.approvalNeeded;
  }

  @override
  set approvalNeeded(bool value) {
    _$approvalNeededAtom.context.conditionallyRunInAction(() {
      super.approvalNeeded = value;
      _$approvalNeededAtom.reportChanged();
    }, _$approvalNeededAtom, name: '${_$approvalNeededAtom.name}_set');
  }

  final _$orderIsLoadingAtom =
      Atom(name: '_RepairWorkModelStore.orderIsLoading');

  @override
  bool get orderIsLoading {
    _$orderIsLoadingAtom.context.enforceReadPolicy(_$orderIsLoadingAtom);
    _$orderIsLoadingAtom.reportObserved();
    return super.orderIsLoading;
  }

  @override
  set orderIsLoading(bool value) {
    _$orderIsLoadingAtom.context.conditionallyRunInAction(() {
      super.orderIsLoading = value;
      _$orderIsLoadingAtom.reportChanged();
    }, _$orderIsLoadingAtom, name: '${_$orderIsLoadingAtom.name}_set');
  }

  final _$orderIsLoadedAtom =
      Atom(name: '_RepairWorkModelStore.orderIsLoaded');

  @override
  bool get orderIsLoaded {
    _$orderIsLoadedAtom.context.enforceReadPolicy(_$orderIsLoadedAtom);
    _$orderIsLoadedAtom.reportObserved();
    return super.orderIsLoaded;
  }

  @override
  set orderIsLoaded(bool value) {
    _$orderIsLoadedAtom.context.conditionallyRunInAction(() {
      super.orderIsLoaded = value;
      _$orderIsLoadedAtom.reportChanged();
    }, _$orderIsLoadedAtom, name: '${_$orderIsLoadedAtom.name}_set');
  }

  final _$createByOrderAsyncAction = AsyncAction('createByOrder');

  @override
  Future<void> createByOrder() {
    return _$createByOrderAsyncAction.run(() => super.createByOrder());
  }

  final _$createByTaskAsyncAction = AsyncAction('createByTask');

  @override
  Future<void> createByTask() {
    return _$createByTaskAsyncAction.run(() => super.createByTask());
  }

  final _$orderApprovalAsyncAction = AsyncAction('orderApproval');

  @override
  Future<void> orderApproval({bool withNotification = true}) {
    return _$orderApprovalAsyncAction
        .run(() => super.orderApproval(withNotification: withNotification));
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

  final _$workInProgressAsyncAction = AsyncAction('workInProgress');

  @override
  Future<void> workInProgress() {
    return _$workInProgressAsyncAction.run(() => super.workInProgress());
  }

  final _$markOrderAsCompletedAsyncAction =
      AsyncAction('markOrderAsCompleted');

  @override
  Future<void> markOrderAsCompleted() {
    return _$markOrderAsCompletedAsyncAction
        .run(() => super.markOrderAsCompleted());
  }

  final _$loadOrderAsyncAction = AsyncAction('loadOrder');

  @override
  Future<OrderModelStore> loadOrder() {
    return _$loadOrderAsyncAction.run(() => super.loadOrder());
  }

  final _$_RepairWorkModelStoreActionController =
      ActionController(name: '_RepairWorkModelStore');

  @override
  void selectPart(PartModelStore selectedPart, {ColorCodes colorCodes}) {
    final _$actionInfo = _$_RepairWorkModelStoreActionController.startAction();
    try {
      return super.selectPart(selectedPart, colorCodes: colorCodes);
    } finally {
      _$_RepairWorkModelStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void unselectPart(PartModelStore unselectedPart) {
    final _$actionInfo = _$_RepairWorkModelStoreActionController.startAction();
    try {
      return super.unselectPart(unselectedPart);
    } finally {
      _$_RepairWorkModelStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectTool(ToolModelStore selectedTool, {ColorCodes colorCodes}) {
    final _$actionInfo = _$_RepairWorkModelStoreActionController.startAction();
    try {
      return super.selectTool(selectedTool, colorCodes: colorCodes);
    } finally {
      _$_RepairWorkModelStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void unselectTool(ToolModelStore unselectedTool) {
    final _$actionInfo = _$_RepairWorkModelStoreActionController.startAction();
    try {
      return super.unselectTool(unselectedTool);
    } finally {
      _$_RepairWorkModelStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void writeCostDescription(String description) {
    final _$actionInfo = _$_RepairWorkModelStoreActionController.startAction();
    try {
      return super.writeCostDescription(description);
    } finally {
      _$_RepairWorkModelStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void writeCostPrice(String price) {
    final _$actionInfo = _$_RepairWorkModelStoreActionController.startAction();
    try {
      return super.writeCostPrice(price);
    } finally {
      _$_RepairWorkModelStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addCostFile(File image) {
    final _$actionInfo = _$_RepairWorkModelStoreActionController.startAction();
    try {
      return super.addCostFile(image);
    } finally {
      _$_RepairWorkModelStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addCost({ColorCodes colorCode = ColorCodes.black}) {
    final _$actionInfo = _$_RepairWorkModelStoreActionController.startAction();
    try {
      return super.addCost(colorCode: colorCode);
    } finally {
      _$_RepairWorkModelStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void serialize(Map<String, dynamic> data) {
    final _$actionInfo = _$_RepairWorkModelStoreActionController.startAction();
    try {
      return super.serialize(data);
    } finally {
      _$_RepairWorkModelStoreActionController.endAction(_$actionInfo);
    }
  }
}
