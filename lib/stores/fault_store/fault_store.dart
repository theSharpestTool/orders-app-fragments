import 'package:orders_app/config/api.dart';
import 'package:orders_app/stores/fault_store/fault_model_store.dart';
import 'package:mobx/mobx.dart';
import 'package:orders_app/stores/base_store/base_list_store.dart';
part 'fault_store.g.dart';

class FaultStore = _FaultStore with _$FaultStore;

abstract class _FaultStore extends BaseListStore<FaultModelStore> with Store {
  @observable
  String subserviceId;

  @action
  Future<void> loadBySubService(String subserviceId) async {
    this.subserviceId = subserviceId;
    this.clear();
    await load(withLoadingIndicator: true);
  }

  @override
  Future<List> downloadData() async {
    final response = await api.get(
      '/api/Services/problems',
      queryParameters: {'subServiceId': subserviceId},
    );
    return response.data;
  }

  @override
  FaultModelStore createNew(Map<String, dynamic> data) {
    return FaultModelStore(data);
  }
}
