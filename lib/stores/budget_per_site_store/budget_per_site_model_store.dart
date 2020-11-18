import 'package:orders_app/config/api.dart';
import 'package:mobx/mobx.dart';
import 'package:orders_app/stores/base_store/base_model_store.dart';

part 'budget_per_site_model_store.g.dart';

class BudgetPerSiteModelStore = _BudgetPerSiteModelStore
    with _$BudgetPerSiteModelStore;

abstract class _BudgetPerSiteModelStore extends BaseModelStore with Store {
  _BudgetPerSiteModelStore(Map<String, dynamic> data) : super(data);

  @observable
  ObservableList<TimeValue> monthlyStats;

  @observable
  ObservableList<TimeValue> quaterlyStats;

  @observable
  ObservableList<TimeValue> yearlyStats;

  @observable
  ObservableList<TimeValue> currentStats;

  @observable
  double total;

  @computed
  bool get currentStatsIsEmpty => statIsEmpty(currentStats);

  bool statIsEmpty(ObservableList<TimeValue> stats) =>
      stats.isEmpty || stats.every((stat) => stat.value == 0);

  @override
  @action
  void serialize(Map<String, dynamic> data) {
    final monthlyStatsList =
        (data['monthlyStats'] as List).map((item) => TimeValue.fromMap(item));
    monthlyStats = ObservableList.of(monthlyStatsList);

    final quaterlyStatsList =
        (data['quaterlyStats'] as List).map((item) => TimeValue.fromMap(item));
    quaterlyStats = ObservableList.of(quaterlyStatsList);

    final yearlyStatsList =
        (data['yearlyStats'] as List).map((item) => TimeValue.fromMap(item));
    yearlyStats = ObservableList.of(yearlyStatsList);
    while (yearlyStats.length < 3 && yearlyStats.isNotEmpty) {
      final yearDouble = int.parse(yearlyStats.last.time) + 1;
      yearlyStats.add(TimeValue(
        time: yearDouble.toString(),
        value: 0.0,
      ));
    }

    total = data['totalBudget'];

    currentStats = monthlyStats;
  }

  @action
  void statsChanged(ObservableList<TimeValue> stats) {
    currentStats = stats;
  }

  @action
  Future<void> load(String siteId) async {
    loading = true;
    final response =
        await api.get('/api/Statistics/budgetpersite', queryParameters: {
      'siteId': id,
    });
    serialize(response.data);
    loading = false;
  }
}

class TimeValue {
  String time;
  double value;

  TimeValue({this.time, this.value});

  TimeValue.fromMap(Map<String, dynamic> data) {
    value = data['value'];
    if (data.containsKey('month'))
      time = data['month'];
    else if (data.containsKey('quater'))
      time = data['quater'];
    else if (data.containsKey('year')) time = data['year'];
    else{
      data.forEach((time, value){
        if(time == 'complianceRatio') return;
        this.time = time;
        this.value = value is int ? value.toDouble() : value;
      });
    }
  }
}
