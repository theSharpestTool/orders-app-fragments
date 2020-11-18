import 'package:orders_app/config/api.dart';
import 'package:mobx/mobx.dart';
part 'kpi_store.g.dart';

class KPIStore = _KPIStore with _$KPIStore;

abstract class _KPIStore with Store {
  @observable
  bool loading = false;

  @observable
  bool loaded = false;

  @observable
  int createdOrdersCount;

  @observable
  int createdRepairWorksCount;

  @computed
  String get createdOrdersString =>
      createdOrdersCount != null ? createdOrdersCount.toString() : null;

  @computed
  String get createdRepairWorksString =>
      createdRepairWorksCount != null ? createdRepairWorksCount.toString() : null;

  @action
  Future<void> load() async {
    loading = true;
    final response = await api.get('/api/KPI/kpis');
    createdOrdersCount = response.data['createdOrdersCount'];
    createdRepairWorksCount = response.data['createdRepairWorksCount'];
    loading = false;
    loaded = true;
  }
}
