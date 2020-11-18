import 'package:orders_app/config/api.dart';
import 'package:orders_app/stores/part_store/part_model_store.dart';
import 'package:mobx/mobx.dart';
import 'package:orders_app/stores/base_store/base_list_store.dart';

part 'part_store.g.dart';

class PartStore = _PartStore with _$PartStore;

abstract class _PartStore extends BaseListStore<PartModelStore>
    with Store {

  @override
  Future<List> downloadData() async{
    final response = await api.get('/api/RepairWorks/parts');
    return response.data;
  }

  @override
  PartModelStore createNew(Map<String, dynamic> data) {
    return PartModelStore(data);
  }
}
