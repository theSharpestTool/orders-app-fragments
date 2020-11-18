import 'package:orders_app/config/api.dart';
import 'package:orders_app/services/cache_service.dart';
import 'package:orders_app/stores/task_store/task_model_store.dart';
import 'package:orders_app/stores/repair_work_store/repair_work_model_store.dart';
import 'package:mobx/mobx.dart';
import 'package:orders_app/stores/base_store/base_list_store.dart';
part 'task_store.g.dart';

class TaskStore = _TaskStore with _$TaskStore;

abstract class _TaskStore extends BaseListStore<TaskModelStore> with Store {
  @override
  String get cacheKey => 'task';

  @override
  Future<List> downloadData() async {
    final states = TaskState.values
        .where((state) => state != TaskState.done)
        .map((state) => state.index)
        .toList();
    final filter = {
      "sortColumn": "serial",
      "sortDirection": "desc",
      "skipPagination": true,
      "filter": [
        {
          "key": "state",
          "value": states,
        }
      ]
    };
    final response = await api.post('/api/ScheduledTasks/list', data: filter);

    totalCount = response.data['count'];
    CacheService.saveToCache(countCacheKey, totalCount.toString());
    
    return response.data['data'];
  }

  TaskModelStore getByRepairWork(RepairWorkModelStore completedOrder) {
    if (completedOrder.task == null) return null;
    return get(completedOrder.task.id);
  }

  @override
  TaskModelStore createNew(Map<String, dynamic> data) {
    return TaskModelStore(data);
  }
}
