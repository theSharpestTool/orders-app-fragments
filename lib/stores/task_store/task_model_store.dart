import 'package:orders_app/config/api.dart';
import 'package:orders_app/stores/asset_store/asset_model_store.dart';
import 'package:orders_app/stores/card_store/card_model_store.dart';
import 'package:orders_app/stores/index.dart';
import 'package:orders_app/stores/site_service_store/site_service_model_store.dart';
import 'package:orders_app/stores/repair_work_store/repair_work_model_store.dart';
import 'package:mobx/mobx.dart';

part 'task_model_store.g.dart';

class TaskModelStore = _TaskModelStore with _$TaskModelStore;

enum TaskState {
  unknown1,
  created,
  done,
  completedOrderCreated,
  unknown5,
  pendingApproval,
}

final Map<TaskState, String> taskStateString = {
  TaskState.created: 'New',
  TaskState.done: 'Done',
  TaskState.completedOrderCreated: 'Repair Work Created',
  TaskState.unknown1: 'unknown1',
  TaskState.unknown5: 'unknown5',
  TaskState.pendingApproval: 'Pending Approval',
};

final actionCreateRepairWork = 'CREATEWORKORDERTASKSTATEACTION';
final actionSetDone = 'SETDONETASKSTATEACTION';

abstract class _TaskModelStore extends CardModelStore with Store {
  _TaskModelStore(Map<String, dynamic> data) : super(data);
  _TaskModelStore.plain() : super.plain();

  @observable
  DateTime scheduledDate;

  @observable
  SiteServiceModelStore siteService;

  @observable
  AssetModelStore asset;

  @observable
  String description;

  @computed
  RepairWorkModelStore get completedOrder => completedOrderStore.data.firstWhere(
        (completedOrder) => completedOrder.task != null && completedOrder.task.id == this.id,
        orElse: () => null,
      );

  @action
  Future<void> createRepairWork() async {
    await api.post('/api/ScheduledTasks/action', data: {
      "scheduledTaskId": id,
      "action": actionCreateRepairWork,
    });
    state = TaskState.completedOrderCreated;
    taskStore.get(id).state = TaskState.completedOrderCreated;
  }

  @action
  Future<void> markAsDone() async {
    await api.post('/api/ScheduledTasks/action', data: {
      "scheduledTaskId": id,
      "action": actionSetDone,
    });
    state = TaskState.done;
    taskStore.get(id).state = TaskState.done;
  }

  @override
  @action
  void serialize(Map<String, dynamic> data) {
    super.serialize(data);
    state = TaskState.values[data['state']];
    deadline = DateTime.parse(data['deadline']);
    scheduledDate = DateTime.parse(data['scheduledDate']);
    description = data['description'];
    if (data['siteService'] != null)
      siteService = SiteServiceModelStore(data['siteService']);
    if (data['asset'] != null) asset = AssetModelStore(data['asset']);
  }

  Map<String, dynamic> toJson() => {
        "createDate": createdDate.toIso8601String(),
        "scheduledDate": scheduledDate.toIso8601String(),
        "state": state.index + 1,
        "serial": serial,
        "id": id,
      };
}
