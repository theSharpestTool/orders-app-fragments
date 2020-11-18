import 'package:orders_app/config/api.dart';
import 'package:orders_app/stores/index.dart';
import 'package:orders_app/stores/sub_service_store/sub_service_model_store.dart';
import 'package:mobx/mobx.dart';
import 'package:orders_app/stores/base_store/base_list_store.dart';
part 'sub_service_store.g.dart';

class SubServiceStore = _SubServiceStore with _$SubServiceStore;

abstract class _SubServiceStore extends BaseListStore<SubServiceModelStore>
    with Store {
  @observable
  String serviceId;

  @observable
  String unitId;

  @action
  Future<void> loadByService({String serviceId, String unitId}) async {
    this.serviceId = serviceId;
    this.unitId = unitId;
    this.clear();
    faultStore.clear();
    await load(withLoadingIndicator: true);
  }

  @override
  Future<List> downloadData() async {
    final response = await api.get(
      '/api/Services/subservices',
      queryParameters: {
        'serviceId': serviceId,
        'unitId': unitId,
      },
    );
    return response.data;
  }

  @override
  SubServiceModelStore createNew(Map<String, dynamic> data) {
    return SubServiceModelStore(data);
  }
}
