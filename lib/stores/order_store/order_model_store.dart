import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:orders_app/config/api.dart';
import 'package:orders_app/services/pdf_service.dart';
import 'package:orders_app/services/push_notification_service.dart';
import 'package:orders_app/stores/card_store/card_model_store.dart';
import 'package:orders_app/stores/cost_store/cost_model_store.dart';
import 'package:orders_app/stores/fault_store/fault_model_store.dart';
import 'package:orders_app/stores/index.dart';
import 'package:orders_app/stores/part_store/part_model_store.dart';
import 'package:orders_app/stores/rating_details_store/rating_details_model_store.dart';
import 'package:orders_app/stores/service_store/service_model_store.dart';
import 'package:orders_app/stores/sub_service_store/sub_service_model_store.dart';
import 'package:orders_app/stores/repairers_store/repairer_model_store.dart';
import 'package:orders_app/stores/unit_store/unit_model_store.dart';
import 'package:orders_app/stores/repair_work_store/repair_work_model_store.dart';
import 'package:mobx/mobx.dart';

part 'order_model_store.g.dart';

class OrderModelStore = _OrderModelStore with _$OrderModelStore;

enum OrderState {
  unknown0,
  pending,
  declined,
  confirmed,
  unknown4,
  addedToRepairWork,
  unknown6,
  pendingApproval,
  unknown8,
  completed,
}

final Map<OrderState, String> orderStateString = {
  OrderState.unknown0: 'unknown0',
  OrderState.pending: 'Pending',
  OrderState.declined: 'Declined',
  OrderState.confirmed: 'Confirmed',
  OrderState.unknown4: 'unknown4',
  OrderState.addedToRepairWork: 'Added to Repair Work',
  OrderState.unknown6: 'unknown6',
  OrderState.pendingApproval: 'Pending approval',
  OrderState.unknown8: 'unknown8',
  OrderState.completed: 'Completed',
};

final confirmActionName = 'SETCONFIRMEDORDERSTATEACTION';
final declineActionName = 'SETDECLINEDORDERSTATEACTION';
final createRepairWorkName = 'CREATEWORKORDERORDERSTATEACTION';
final completeActionName = 'SETCOMPLETEDORDERSTATEACTION';

abstract class _OrderModelStore extends CardModelStore with Store {
  _OrderModelStore(Map<String, dynamic> data) : super(data);
  _OrderModelStore.plain() : super.plain();

  @observable
  SubServiceModelStore subservice;

  @observable
  FaultModelStore fault;

  @observable
  bool isCommonArea;

  @observable
  String description;

  @observable
  bool isDeleted;

  @observable
  DateTime deletedOn;

  @observable
  String deletedBy;

  @observable
  RatingModelStore ratingDetails = RatingModelStore.plain();

  @override
  bool get isWaitingApproval {
    if (completedOrder == null) return false;
    return completedOrder.state == RepairWorkState.inspectedWaingClientApproval;
  }

  @observable
  bool isRated = false;

  @observable
  bool loadingExcel = false;

  @observable
  bool loadingPDF = false;

  @computed
  bool get isCompleted => state == OrderState.completed;

  @computed
  RepairerModelStore get repairer => repairerStore.data.firstWhere(
      (repairer) => repairer.orders.contains(this),
      orElse: () => null);

  @computed
  RepairWorkModelStore get completedOrder => completedOrderStore.data.firstWhere(
        (completedOrder) => completedOrder.order == this,
        orElse: () => null,
      );

  @override
  @action
  void serialize(Map<String, dynamic> data) {
    super.serialize(data);
    titleImage = images.isNotEmpty ? images.first : null;
    isCommonArea = data['isCommonArea'];
    description = data['description'];
    if (data['fault'] != null) fault = FaultModelStore(data['fault']);
    state = OrderState.values[data['state']];
    if (data['deletedOn'] != null)
      deletedOn = DateTime.parse(data['deletedOn']);
    if (data['ratingDetails'] != null) {
      ratingDetails = RatingModelStore(data['ratingDetails']);
      ratingDetails.orderId = id;
      if (ratingDetails.rating != null && ratingDetails.rating != 0)
        isRated = true;
    }
    deletedBy = data['deletedBy'];
  }

  @action
  void setUnit(UnitModelStore unit) {
    this.unit = unit;
    this.service = null;
    this.subservice = null;
    this.fault = null;
  }

  @action
  void setService(ServiceModelStore service) {
    this.service = service;
    this.subservice = null;
    this.fault = null;
  }

  @action
  void setSubService(SubServiceModelStore subservice) {
    this.subservice = subservice;
    this.fault = null;
  }

  @action
  void setProblem(FaultModelStore fault) {
    this.fault = fault;
  }

  @action
  void setDescription(String description) {
    this.description = description;
  }

  @action
  Future<void> confirm() async {
    await api.post('/api/Orders/action', data: {
      'orderId': id,
      'action': confirmActionName,
    });
    this.state = OrderState.confirmed;
    orderStore.get(id).state = OrderState.confirmed;
  }

  @action
  Future<void> decline() async {
    await api.post('/api/Orders/action', data: {
      'orderId': id,
      'action': declineActionName,
    });
    this.state = OrderState.declined;
    orderStore.get(id).state = OrderState.declined;
  }

  @action
  Future<void> complete() async {
    await api.post('/api/Orders/action', data: {
      'orderId': id,
      'action': completeActionName,
      'rating': 0,
    });
    this.state = OrderState.completed;
    if (orderStore.get(id) != null)
      orderStore.get(id).state = OrderState.completed;
    PushNotificationsService.sendClientEvent(
      order: this,
      type: NotificationType.orderCompleted,
    );
  }

  @action
  Future<void> createRepairWork() async {
    await api.post('/api/Orders/action', data: {
      'orderId': id,
      'action': createRepairWorkName,
    });
    this.state = OrderState.addedToRepairWork;
    orderStore.get(id).state = OrderState.addedToRepairWork;
  }

  @action
  void setCompliment(Compliment compliment) {
    if (compliment == this.ratingDetails.compliment)
      this.ratingDetails.compliment = null;
    else
      this.ratingDetails.compliment = compliment;
  }

  @action
  Future<void> approveQuotation() async {
    await completedOrder.approveQuotation();
    await PushNotificationsService.sendManagerEvent(
      card: completedOrder,
      type: NotificationType.quoteApproved,
    );
  }

  @action
  Future<void> rejectQuotation() async {
    await completedOrder.rejectQuotation();
    await PushNotificationsService.sendManagerEvent(
      card: completedOrder,
      type: NotificationType.quoteRejected,
    );
  }

  @action
  void setRating(int rating) => this.ratingDetails.rating = rating;

  @action
  void setRatingNotes(String notes) => this.ratingDetails.notes = notes;

  @action
  Future<void> sendRate() async {
    ratingDetails.loading = true;
    ratingDetails.orderId = id;
    final json = ratingDetails.toJson();
    await api.post(
      '/api/Orders/rateorder',
      data: json,
    );
    isRated = true;
    ratingDetails.loading = false;
  }

  @action
  Future<void> printExcel() async {
    loadingExcel = true;
    final response = await api.get(
      '/api/Reports/excelreport',
      queryParameters: {'orderId': id},
    );
    final file = response.data['file'];
    final fileName = response.data['fileName'];
    final fileType = response.data['fileType'];
    final decodedFile = base64.decode(file);
    await Share.file('Send Exel Report', fileName, decodedFile, fileType);
    loadingExcel = false;
  }

  @action
  Future<void> printPDF() async {
    loadingPDF = true;
    final response = await api.get(
      '/api/Reports/reportdata',
      queryParameters: {'orderId': id},
    );
    final data = response.data;
    final pdfService = PDFService(
      clientName: data['clientName'],
      costs: (data['expenses'] as List)
          .map((cost) => CostModelStore(cost))
          .toList(),
      date: data['date'],
      description: data['description'],
      workDescription: completedOrder.instructions ?? '',
      duration: data['duration'],
      fault: data['fault'],
      parts: (data['partsInfo'] as List)
          .map((part) => PartModelStore(part))
          .toList(),
      orderNumber: data['orderNumber'],
      review: data['review'],
      service: data['service'],
      siteName: data['siteName'],
      subservice: data['subservice'],
      repairerName: data['repairerName'],
      unitName: data['unitName'],
      completedOrderNumber: data['completedOrderNumber'],
    );
    final file = await pdfService.generate();
    await Share.file(
      'Send PDF Report',
      'Report Order $serial',
      file,
      'application/pdf',
    );
    loadingPDF = false;
  }

  @action
  Future<Response> create() async {
    loading = true;
    try {
      final encodedImages =
          userImages.map((imgFile) => base64.encode(imgFile)).toList();
      final response = await api.post('/api/Orders', data: {
        "serviceId": service.id,
        "subServiceId": subservice.id,
        "problemId": fault.id,
        "unitId": unit.id,
        "isCommonArea": true,
        "description": description,
        "photos": encodedImages,
        "priority": 1,
      });
      orderStore.loaded = false;
      orderStore.load(withLoadingIndicator: false).then((_) async {
        final id = response.data as String;
        final order = orderStore.get(id);
        await PushNotificationsService.sendManagerEvent(
          card: order,
          type: NotificationType.orderCreated,
        );
        PushNotificationsService.subscribeToOrder(id);
      });
      loading = false;

      return response;
    } catch (e) {
      loading = false;
      throw e;
    }
  }

  // Map<String, dynamic> toJson() => {
  //       "unit": unit.toJson(),
  //       "isCommonArea": isCommonArea,
  //       "service": service.toJson(),
  //       "createDate": createdDate.toIso8601String(),
  //       "priority": priority,
  //       "fault": fault.toJson(),
  //       "serial": serial,
  //       "files": [],
  //       "isDeleted": isDeleted,
  //       "deletedOn": deletedOn?.toIso8601String(),
  //       "deletedBy": deletedBy,
  //       "state": state.index + 1,
  //       "submittedBy": submittedBy.toJson(),
  //       "id": id,
  //     };
}
