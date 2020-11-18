import 'dart:convert';
import 'dart:core';
import 'dart:io';

import 'package:orders_app/config/api.dart';
import 'package:orders_app/services/push_notification_service.dart';
import 'package:orders_app/stores/base_store/base_model_store.dart';
import 'package:orders_app/stores/card_store/card_model_store.dart';
import 'package:orders_app/stores/cost_store/cost_model_store.dart';
import 'package:orders_app/stores/index.dart';
import 'package:orders_app/stores/part_store/part_model_store.dart';
import 'package:orders_app/stores/order_store/order_model_store.dart';
import 'package:orders_app/stores/task_store/task_model_store.dart';
import 'package:orders_app/stores/repairers_store/repairer_model_store.dart';
import 'package:orders_app/stores/tool_store/tool_model_store.dart';
import 'package:mobx/mobx.dart';

part 'repair_work_model_store.g.dart';

class RepairWorkModelStore = _RepairWorkModelStore with _$RepairWorkModelStore;

final actionWaitingQuotation =
    'WORKORDERINSPECTEDAWAITINGVENDORQUOTATIONACTION';
final actionWaitingParts = 'WORKORDERINSPECTEDAWAITINGPARTSACTION';
final actionWaitingApproval = 'WORKORDERINSPECTEDAWAITINGCLIENTAPPROVALACTION';
final actionWorkInProgress = 'WORKORDERWORKINPROGRESSACTION';
final actionCanceled = 'WORKORDERCANCELLEDACTION';
final actionPendingApproval = 'WORKORDERPENDINGAPPROVALACTION';
final actionMarkAsCompleted = 'WORKORDERCOMPLETEDACTION';
final actionWorkCompleted = 'WORKCOMPLETEDACTION';
final actionApproveQuotation = 'WORKORDERQUOTATIONAPPROVALACTION';
final actionRejectQuotation = 'WORKORDERQUOTATIONREJECTIONACTION';

enum RepairWorkState {
  unknown1,
  created,
  inspectedWaitingParts,
  inspectedWaitingQuotaion,
  inspectedWaingClientApproval,
  quotationApproved,
  quotationRejected,
  declined,
  workInProgress,
  pendingApproval,
  unknown10,
  orderCompleted,
  unknown12,
  completedOrderCompleted,
}

final Map<RepairWorkState, String> completedOrderStateString = {
  RepairWorkState.unknown1: 'unknown1',
  RepairWorkState.created: 'Created',
  RepairWorkState.inspectedWaitingParts: 'Waiting Parts',
  RepairWorkState.inspectedWaitingQuotaion: 'Waiting Quotation',
  RepairWorkState.inspectedWaingClientApproval: 'Waiting Client Approval',
  RepairWorkState.quotationApproved: 'Quotation Approved',
  RepairWorkState.quotationRejected: 'Quotatoion Rejected',
  RepairWorkState.declined: 'Declined',
  RepairWorkState.workInProgress: 'Work In Progress',
  RepairWorkState.pendingApproval: 'Pending Approval',
  RepairWorkState.unknown10: 'unknown10',
  RepairWorkState.orderCompleted: 'Order Completed',
  RepairWorkState.unknown12: 'unknown12',
  RepairWorkState.completedOrderCompleted: 'Repair Work Completed'
};

abstract class _RepairWorkModelStore extends CardModelStore with Store {
  _RepairWorkModelStore(Map<String, dynamic> data) : super(data);
  _RepairWorkModelStore.plain() : super.plain();

  @observable
  OrderModelStore order;

  @observable
  TaskModelStore task;

  @observable
  double totalCost;

  @observable
  RepairerModelStore repairer;

  @observable
  ObservableList<PartModelStore> parts = ObservableList();

  @observable
  ObservableList<ToolModelStore> tools = ObservableList();

  @observable
  ObservableList<CostModelStore> costs = ObservableList();

  @observable
  String instructions;

  @observable
  String description;

  @observable
  DateTime pendingApprovalDate;

  @observable
  DateTime deadLineDateTime;

  @observable
  DateTime deadLineDateTimeForTech;

  @observable
  DateTime assignedDate;

  @observable
  CostModelStore currentCost = CostModelStore.plain();

  @observable
  bool approvalNeeded = false;

  @observable
  bool orderIsLoading = false;

  @observable
  bool orderIsLoaded = false;

  @computed
  bool get hasParts => parts.isNotEmpty;

  @action
  Future<void> createByOrder() async {
    loading = true;
    await order.createRepairWork();
    await completedOrderStore.load(withLoadingIndicator: false);
    final currentRepairWork = completedOrderStore.getByOrder(order);
    id = currentRepairWork.id;

    await post();

    await completedOrderStore.load(withLoadingIndicator: false);
    final completedOrder = completedOrderStore.getByOrder(order);
    await completedOrder.workInProgress();

    if (completedOrder.parts.isNotEmpty ||
        completedOrder.tools.isNotEmpty ||
        completedOrder.costs.isNotEmpty) {
      await completedOrder.orderApproval(withNotification: false);
      await PushNotificationsService.sendClientEvent(
        order: completedOrder.order,
        type: NotificationType.completedOrderCreated,
      );
    }
    PushNotificationsService.sendRepairerEvent(
      completedOrder: completedOrder,
      type: NotificationType.techAssisgned,
      techId: completedOrder.repairer.id,
    );

    loading = false;
  }

  @action
  Future<void> createByTask() async {
    loading = true;
    await task.createRepairWork();
    await completedOrderStore.load(withLoadingIndicator: false);
    final currentRepairWork = completedOrderStore.getByTask(task);
    id = currentRepairWork.id;

    await post();

    await completedOrderStore.load(withLoadingIndicator: false);
    final completedOrder = completedOrderStore.getByTask(task);
    await completedOrder.workInProgress();

    if (completedOrder.parts.isNotEmpty ||
        completedOrder.tools.isNotEmpty ||
        completedOrder.costs.isNotEmpty) await completedOrder.orderApproval();

    loading = false;
  }

  @action
  Future<void> orderApproval({bool withNotification = true}) async {
    await post();
    await sendAction(actionWaitingApproval);
    approvalNeeded = false;
    await completedOrderStore.load(withLoadingIndicator: false);
    final updatedRepairWork = completedOrderStore.get(this.id);
    this.parts = updatedRepairWork.parts;
    this.tools = updatedRepairWork.tools;
    this.costs = updatedRepairWork.costs;
    this.state = RepairWorkState.inspectedWaingClientApproval;
    completedOrderStore.get(this.id).state =
        RepairWorkState.inspectedWaingClientApproval;
    if (withNotification)
      PushNotificationsService.sendClientEvent(
        order: order,
        type: NotificationType.newItemsAdded,
      );
  }

  @action
  Future<void> approveQuotation() async {
    await sendAction(actionApproveQuotation);
    this.state = RepairWorkState.quotationApproved;
    completedOrderStore.get(this.id).state = RepairWorkState.quotationApproved;
  }

  @action
  Future<void> rejectQuotation() async {
    await sendAction(actionRejectQuotation);
    this.state = RepairWorkState.quotationRejected;
    completedOrderStore.get(this.id).state = RepairWorkState.quotationRejected;
  }

  @action
  Future<void> workInProgress() async {
    await sendAction(actionWorkInProgress);
    this.state = RepairWorkState.workInProgress;
    completedOrderStore.get(this.id).state = RepairWorkState.workInProgress;
  }

  @action
  Future<void> markOrderAsCompleted() async {
    await sendAction(actionMarkAsCompleted);

    if (order != null) {
      await order.complete();
      if (orderStore.data.contains(order))
        orderStore.data.remove(order);
    } else if (task != null) {
      if (taskStore.data.contains(task)) taskStore.data.remove(task);
    }
    this.state = RepairWorkState.orderCompleted;
    completedOrderStore.get(this.id).state = RepairWorkState.orderCompleted;
    completedOrderStore.data.remove(this);
  }

  Future<void> workCompleted() async {
    await post();
    await sendAction(actionWorkCompleted);
    PushNotificationsService.sendManagerEvent(
      card: this,
      type: NotificationType.techFinished,
    );
    this.state = RepairWorkState.completedOrderCompleted;
    completedOrderStore.get(this.id).state = RepairWorkState.completedOrderCompleted;
  }

  Future<void> sendAction(String action) async {
    await api.post(
      '/api/RepairWorks/action',
      data: {
        'completedOrderId': id,
        'action': action,
        'notes': '',
      },
    );
  }

  @action
  void selectPart(PartModelStore selectedPart, {ColorCodes colorCodes}) {
    approvalNeeded = true;
    final index = parts.indexWhere((part) => part.id == selectedPart.id);
    selectedPart.isAdded = true;
    selectedPart.textColorCode = colorCodes;
    if (index == -1) parts.add(selectedPart);
  }

  @action
  void unselectPart(PartModelStore unselectedPart) {
    parts.removeWhere((part) => part.id == unselectedPart.id);
  }

  @action
  void selectTool(ToolModelStore selectedTool, {ColorCodes colorCodes}) {
    approvalNeeded = true;
    final index = tools.indexWhere((tool) => tool.id == selectedTool.id);
    selectedTool.isAdded = true;
    selectedTool.textColorCode = colorCodes;
    if (index == -1) tools.add(selectedTool);
  }

  @action
  void unselectTool(ToolModelStore unselectedTool) {
    tools.removeWhere((tool) => tool.id == unselectedTool.id);
  }

  @action
  void writeCostDescription(String description) {
    currentCost.description = description;
  }

  @action
  void writeCostPrice(String price) {
    currentCost.amount = price.isNotEmpty ? double.parse(price) : null;
  }

  @action
  void addCostFile(File image) {
    final imageBytes = image.readAsBytesSync();
    currentCost.userFiles.add(imageBytes);
  }

  @action
  void addCost({ColorCodes colorCode = ColorCodes.black}) {
    if (currentCost.isValid) {
      approvalNeeded = true;
      costs.add(currentCost.clone());
      costs.last.isAdded = true;
      costs.last.textColorCode = colorCode;
      currentCost = CostModelStore.plain();
    }
  }

  Future<void> post() async {
    final json = this.toJson();
    await api.put(
      '/api/RepairWorks',
      data: json,
    );
  }

  @override
  @action
  void serialize(Map<String, dynamic> data) {
    super.serialize(data);
    if (data['order'] != null) {
      order = OrderModelStore(data['order']);
      titleImage = order.images != null && order.images.isNotEmpty
          ? order.images.first
          : null;
    } else if (data['scheduledTask'] != null) {
      task = TaskModelStore(data['scheduledTask']);
    }
    if (data.containsKey('photos') &&
        data['photos'] is List &&
        data['photos'].isNotEmpty) {
      final files = data['photos'] as List;
      final filesUrls = files.map((file) {
        final url = file['fileUrl'] as String;
        return url;
      });
      images = ObservableList.of(filesUrls);
    }
    serial = data['serial'];
    totalCost = data['totalCost'];
    state = RepairWorkState.values[data['state']];
    instructions = data['instructions'];
    description = data['description'];
    if (data['assignedTo'] != null) {
      repairer = RepairerModelStore(data['assignedTo']);
    }

    final partsData = data['parts'] as List;
    if (partsData != null)
      parts = ObservableList.of(partsData.map((item) => PartModelStore(item)));

    final toolsData = data['tools'] as List;
    if (toolsData != null)
      tools = ObservableList.of(toolsData.map((item) => ToolModelStore(item)));

    final costsData = data['costs'] as List;
    if (costsData != null)
      costs = ObservableList.of(costsData.map((item) => CostModelStore(item)));

    if (data['pendingApprovalDate'] != null)
      pendingApprovalDate = DateTime.parse(data['pendingApprovalDate']);
    if (data['deadLineDateTime'] != null) {
      deadLineDateTime = DateTime.parse(data['deadLineDateTime']);
    }

    if (data['deadLineDateTimeForTech'] != null) {
      deadLineDateTimeForTech = DateTime.parse(data['deadLineDateTimeForTech']);
      deadline = deadLineDateTimeForTech;
    } else if (task != null && task.deadline != null) {
      deadline = task.deadline;
    }
  }

  @action
  Future<OrderModelStore> loadOrder() async {
    try {
      orderIsLoading = true;
      final response = await api.get(
        '/api/Orders/details/${order.id}',
        queryParameters: {'id': order.id},
      );
      orderIsLoading = false;
      final loadedOrder = OrderModelStore(response.data);
      order = loadedOrder;
      orderIsLoaded = true;
      return loadedOrder;
    } catch (_) {
      orderIsLoading = false;
      return order;
    }
  }

  RepairWorkModelStore copy() {
    final completedOrder = RepairWorkModelStore.plain();

    completedOrder
      ..assignedDate = assignedDate
      ..assignedTo = assignedTo
      ..costs = ObservableList.of(costs)
      ..createdDate = createdDate
      ..deadline = deadline
      ..deadLineDateTime = deadLineDateTime
      ..deadLineDateTimeForTech = deadLineDateTimeForTech
      ..description = description
      ..id = id
      ..images = ObservableList.of(images)
      ..instructions = instructions
      ..name = name
      ..parts = ObservableList.of(parts)
      ..pendingApprovalDate = pendingApprovalDate
      ..priority = priority
      ..order = order
      ..serial = serial
      ..service = service
      ..state = state
      ..submittedBy = submittedBy
      ..task = task
      ..repairer = repairer
      ..titleImage = titleImage
      ..tools = ObservableList.of(tools)
      ..totalCost = totalCost
      ..transactions = ObservableList.of(transactions)
      ..unit = unit;

    return completedOrder;
  }

  Map<String, dynamic> toJson() => {
        "parts": parts.map((part) => part.toJsonWithRepairWork(id)).toList(),
        "assignedTo": repairer.toJson(),
        "assigneDate": DateTime.now().toIso8601String(),
        "instructions": instructions ?? "",
        "equipment": tools.map((tool) => tool.toJson()).toList(),
        "isCommonArea": true,
        "description": description ?? "",
        "files": userImages.map((imgFile) => base64.encode(imgFile)).toList(),
        "priority": 1,
        "costs": costs.map((cost) => cost.toJson()).toList(),
        "id": id,
      };
}
