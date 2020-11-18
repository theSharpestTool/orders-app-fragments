import 'package:orders_app/stores/service_store/service_model_store.dart';
import 'package:mobx/mobx.dart';
import 'package:orders_app/stores/base_store/base_model_store.dart';

part 'fault_model_store.g.dart';

class FaultModelStore = _FaultModelStore with _$FaultModelStore;

abstract class _FaultModelStore extends BaseModelStore with Store {
  _FaultModelStore(Map<String, dynamic> data) : super(data);

  @observable
  double daysToDueDate;

  @observable
  ServiceModelStore service;

  @observable
  String serviceId;

  @observable
  double hoursToDueDate;

  @observable
  double hoursForRepairer;

  @override
  @action
  void serialize(Map<String, dynamic> json) {
    super.serialize(json);
    daysToDueDate = json['daysToDueDate'];
    if (json["service"] != null) service = ServiceModelStore(json["service"]);
    serviceId = json["serviceId"];
    hoursToDueDate = json["hoursToDueDate"];
    hoursForRepairer = json["hoursForRepairer"];
    daysToDueDate = json["daysToDueDate"];
  }

  Map<String, dynamic> toJson() => {
        "service": service.toJson(),
        "serviceId": serviceId,
        "hoursToDueDate": hoursToDueDate,
        "hoursForRepairer": hoursForRepairer,
        "daysToDueDate": daysToDueDate,
        "id": id,
        "name": name,
      };
}
