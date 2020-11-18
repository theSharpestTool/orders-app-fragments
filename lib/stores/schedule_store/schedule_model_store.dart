import 'package:mobx/mobx.dart';
import 'package:orders_app/stores/base_store/base_model_store.dart';

part 'schedule_model_store.g.dart';

class ScheduleModelStore = _ScheduleModelStore with _$ScheduleModelStore;

abstract class _ScheduleModelStore extends BaseModelStore with Store {
  _ScheduleModelStore(Map<String, dynamic> data) : super(data);

  @observable
  DateTime startDate;

  @observable
  int scheduleType;

  @observable
  bool startNextCycle;

  @observable
  DateTime nextOccourenceDate;

  @override
  @action
  void serialize(Map<String, dynamic> data) {
    super.serialize(data);
    startDate = DateTime.parse(data['startDate']);
    scheduleType = data['scheduleType'];
    startNextCycle = data['startNextCycle'];
    nextOccourenceDate = DateTime.parse(data['nextOccourenceDate']);
  }
}
