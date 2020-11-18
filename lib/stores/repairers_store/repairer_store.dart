import 'package:orders_app/config/api.dart';
import 'package:orders_app/stores/repairers_store/repairer_model_store.dart';
import 'package:mobx/mobx.dart';
import 'package:orders_app/stores/base_store/base_list_store.dart';

part 'repairer_store.g.dart';

class RepairerStore = _RepairerStore with _$RepairerStore;

abstract class _RepairerStore extends BaseListStore<RepairerModelStore>
    with Store {
  @override
  String get cacheKey => 'repairers';

  @override
  Future<List> downloadData() async {
    final response = await api.get('/api/Users/GetTechUsers');
    return response.data;
  }

  @override
  RepairerModelStore createNew(Map<String, dynamic> data) {
    return RepairerModelStore(data);
  }
}
