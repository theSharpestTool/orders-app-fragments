import 'package:orders_app/stores/schedule_store/schedule_model_store.dart';
import 'package:orders_app/stores/service_store/service_model_store.dart';
import 'package:orders_app/stores/site_store/site_model_store.dart';
import 'package:mobx/mobx.dart';
import 'package:orders_app/stores/base_store/base_model_store.dart';

part 'site_service_model_store.g.dart';

class SiteServiceModelStore = _SiteServiceModelStore
    with _$SiteServiceModelStore;

abstract class _SiteServiceModelStore extends BaseModelStore with Store {
  _SiteServiceModelStore(Map<String, dynamic> data) : super(data);

  @observable
  String siteId;

  @observable
  SiteModelStore site;

  @observable
  ServiceModelStore service;

  @observable
  int serviceType;

  @observable
  ScheduleModelStore schedule;

  @observable
  bool isActive;

  @observable
  DateTime createDate;

  @observable
  bool tasksGenerated;

  @observable
  int slaDays;

  @override
  @action
  void serialize(Map<String, dynamic> data) {
    super.serialize(data);
    siteId = data['siteId'];
    site = SiteModelStore(data['site']);
    service = ServiceModelStore(data['service']);
    serviceType = data['serviceType'];
    schedule = ScheduleModelStore(data['schedule']);
    isActive = data['isActive'];
    createDate = DateTime.parse(data['createDate']);
    tasksGenerated = data['tasksGenerated'];
    slaDays = data['slaDays'];
  }
}
