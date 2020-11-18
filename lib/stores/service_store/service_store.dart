import 'package:orders_app/config/api.dart';
import 'package:orders_app/stores/index.dart';
import 'package:orders_app/stores/service_store/service_model_store.dart';
import 'package:mobx/mobx.dart';
import 'package:orders_app/stores/base_store/base_list_store.dart';
part 'service_store.g.dart';

class ServiceStore = _ServiceStore with _$ServiceStore;

abstract class _ServiceStore extends BaseListStore<ServiceModelStore>
    with Store {
  @observable
  String unitId;

  @action
  Future<void> loadByUnit(String unitId) async {
    this.unitId = unitId;

    this.clear();
    subServiceStore.clear();
    faultStore.clear();
    await load(withLoadingIndicator: true);
  }

  @override
  Future<List> downloadData() async {
    final response = await api.get('/api/Services/$unitId');
    return response.data;
  }

  @override
  ServiceModelStore createNew(Map<String, dynamic> data) {
    return ServiceModelStore(data);
  }
}
