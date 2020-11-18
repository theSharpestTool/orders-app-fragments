import 'dart:typed_data';

import 'package:date_format/date_format.dart';
import 'package:orders_app/services/helper_service.dart';
import 'package:orders_app/stores/service_store/service_model_store.dart';
import 'package:orders_app/stores/unit_store/unit_model_store.dart';
import 'package:orders_app/stores/user_store/user_store.dart';
import 'package:mobx/mobx.dart';
import 'package:orders_app/stores/base_store/base_model_store.dart';

part 'card_model_store.g.dart';

class CardModelStore = _CardModelStore with _$CardModelStore;

abstract class _CardModelStore extends BaseModelStore with Store {
  _CardModelStore(Map<String, dynamic> data) : super(data);
  _CardModelStore.plain() : super.plain();

  @observable
  dynamic state;

  @observable
  UnitModelStore unit;

  @observable
  ObservableList<String> images = ObservableList();

  @observable
  ObservableList<Uint8List> userImages = ObservableList();

  @observable
  String titleImage;

  @observable
  DateTime createdDate;

  @observable
  DateTime lastStateChangeDate;

  @computed
  String get createdDateString => formatDate(
      createdDate, [dd, ' ', M, ' ', yyyy, ', ', HH, ':', nn, ' ', am]);

  @observable
  num serial;

  @observable
  UserStore submittedBy;

  @observable
  UserStore assignedTo;

  @observable
  ObservableList transactions = ObservableList();

  @observable
  int priority;

  @observable
  ServiceModelStore service;

  @observable
  DateTime deadline;

  @computed
  bool get isWaitingApproval => false;

  @computed
  bool get deadlineExpired => deadline.isBefore(DateTime.now());

  @computed
  String get deadlineString =>
      deadlineExpired ? stringDate(deadline) : stringTimer(deadline);

  @action
  void addImage(Uint8List image) {
    userImages.add(image);
  }

  @override
  bool containsPatern(String pattern) {
    return unit.name.toLowerCase().contains(pattern) ||
        serial.toString().contains(pattern);
  }

  @override
  @action
  void serialize(Map<String, dynamic> data) {
    super.serialize(data);
    if (data['unit'] != null) unit = UnitModelStore(data['unit']);
    createdDate = DateTime.parse(data['createDate']);
    if (data.containsKey('files') &&
        data['files'] is List &&
        data['files'].isNotEmpty) {
      final files = data['files'] as List;
      final filesUrls = files.map((file) {
        final url = file['fileUrl'] as String;
        return url;
      });
      images = ObservableList.of(filesUrls);
    }
    final transactions = data['transactions'];
    if (transactions != null && transactions is List) {
      lastStateChangeDate = DateTime.parse(transactions.last['createDate']);
    }

    serial = data['serial'];
    submittedBy = UserStore(data: data['submittedBy']);
    assignedTo = UserStore(data: data['assignedTo']);
    priority = data['priority'];
    if (data.containsKey('service'))
      service = ServiceModelStore(data['service']);
  }
}
