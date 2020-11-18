import 'package:mobx/mobx.dart';
import 'package:orders_app/stores/base_store/base_model_store.dart';

import '../site_store/site_model_store.dart';

part 'compliance_model_store.g.dart';

class ComplianceModelStore = _ComplianceModelStore
    with _$ComplianceModelStore;

abstract class _ComplianceModelStore extends BaseModelStore with Store {
  _ComplianceModelStore(Map<String, dynamic> data) : super(data);

  @observable
  ChartData month;

  @observable
  ChartData quater;

  @observable
  ChartData year;

  @observable
  ChartData current;

  @override
  void serialize(Map<String, dynamic> data) {
    if (data['type'] == Compliance.ppm) {
      month = ChartData.fromTaskMap(data['month']);
      quater = ChartData.fromTaskMap(data['quarter']);
      year = ChartData.fromTaskMap(data['year']);
    } else {
      month = ChartData.fromOrderMap(data['month']);
      quater = ChartData.fromOrderMap(data['quarter']);
      year = ChartData.fromOrderMap(data['year']);
    }

    current = month;
  }

  @action
  void statsChanged(ChartData tasks) {
    current = tasks;
  }
}

class ChartData {
  int pending;
  int delayed;
  int completed;
  int total;
  double complianceRatio;

  ChartData.fromTaskMap(Map<String, dynamic> data) {
    pending = data['pendingTasks'];
    delayed = data['delayedTasks'];
    completed = data['completedTasks'];
    complianceRatio = data['complianceRatio'];
  }

  ChartData.fromOrderMap(Map<String, dynamic> data) {
    pending = data['pendingOrders'];
    delayed = data['delayedOrders'];
    completed = data['completedOrders'];
    total = data['totalOrders'];
    complianceRatio = data['complianceRatio'];
  }

  List<TaskAmount> get asList => [
        TaskAmount(task: 'Delayed', amount: delayed),
        TaskAmount(task: 'Pending', amount: pending),
        TaskAmount(task: 'Completed', amount: completed),
      ];
}

class TaskAmount {
  final String task;
  final int amount;

  TaskAmount({this.task, this.amount});
}
