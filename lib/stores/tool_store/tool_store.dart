import 'package:orders_app/config/api.dart';
import 'package:orders_app/stores/tool_store/tool_model_store.dart';
import 'package:mobx/mobx.dart';
import 'package:orders_app/stores/base_store/base_list_store.dart';

part 'tool_store.g.dart';

class ToolStore = _ToolStore with _$ToolStore;

abstract class _ToolStore extends BaseListStore<ToolModelStore> with Store {
  
  Future<List> downloadData() async {
    final response = await api.get('/api/RepairWorks/tools');
    return response.data;
  }

  @override
  ToolModelStore createNew(Map<String, dynamic> data) {
    return ToolModelStore(data);
  }
}
