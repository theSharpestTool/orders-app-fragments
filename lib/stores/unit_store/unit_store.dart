import 'package:orders_app/config/api.dart';
import 'package:orders_app/stores/unit_store/unit_model_store.dart';
import 'package:mobx/mobx.dart';
import 'package:orders_app/stores/base_store/base_list_store.dart';

import '../index.dart';
part 'unit_store.g.dart';

class UnitStore = _UnitStore with _$UnitStore;

abstract class _UnitStore extends BaseListStore<UnitModelStore> with Store {
  
  @override
  Future<List> downloadData() async {
    final response = await api.get('/api/Units');
    serviceStore.clear();
    subServiceStore.clear();
    faultStore.clear();
    return response.data;
  }

  @override
  UnitModelStore createNew(Map<String, dynamic> data) {
    return UnitModelStore(data);
  }
}
