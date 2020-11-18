import 'package:orders_app/stores/service_store/service_model_store.dart';
import 'package:mobx/mobx.dart';
import 'package:orders_app/stores/base_store/base_model_store.dart';

part 'unit_type_model_store.g.dart';

class UnitTypeModelStore = _UnitTypeModelStore with _$UnitTypeModelStore;

abstract class _UnitTypeModelStore extends BaseModelStore with Store {
  _UnitTypeModelStore(Map<String, dynamic> data) : super(data);

  @observable
  bool enableLeaserOrder;

  @observable
  ObservableList<ServiceModelStore> services;

  @override
  @action
  void serialize(Map<String, dynamic> data) {
    super.serialize(data);
    enableLeaserOrder = data['type'];
    services = ObservableList();
  }
}
