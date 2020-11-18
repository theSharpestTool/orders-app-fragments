import 'package:orders_app/config/api.dart';
import 'package:orders_app/stores/base_store/base_model_store.dart';
import 'package:orders_app/stores/budget_per_site_store/budget_per_site_model_store.dart';
import 'package:orders_app/stores/client_store/client_model_store.dart';
import 'package:orders_app/stores/compliance_store/compliance_model_store.dart';
import 'package:orders_app/stores/index.dart';
import 'package:orders_app/stores/order_store/order_model_store.dart';
import 'package:orders_app/stores/service_store/service_model_store.dart';
import 'package:orders_app/stores/unit_store/unit_model_store.dart';
import 'package:orders_app/stores/repair_work_store/repair_work_model_store.dart';
import 'package:mobx/mobx.dart';

part 'site_model_store.g.dart';

class SiteModelStore = _SiteModelStore with _$SiteModelStore;

abstract class _SiteModelStore extends BaseModelStore with Store {
  _SiteModelStore(Map<String, dynamic> data) : super(data);

  @observable
  String clientId;

  @observable
  ObservableList<ServiceModelStore> services;

  @observable
  ClientModelStore client;

  @observable
  ObservableList<UnitModelStore> units;

  @observable
  int ordersOnGoing;

  @observable
  int completedOrdersOnGoing;

  @observable
  int ordersDeclined;

  @observable
  int ordersCompleted;

  @observable
  bool disabled;

  @observable
  BudgetPerSiteModelStore budgetPerSite;

  @observable
  ComplianceModelStore ppmComplianceModel;

  @observable
  ComplianceModelStore slaComplianceModel;

  @observable
  double ppmCompliance;

  @observable
  double slaCompliance;

  @observable
  ObservableList<OrderModelStore> orders = ObservableList();

  @observable
  ObservableList<RepairWorkModelStore> completedOrders = ObservableList();

  @observable
  bool loadingBudgets = false;

  @observable
  bool loadingPPM = false;

  @observable
  bool loadingSLA = false;

  @action
  Future<void> loadBudgets() async {
    loadingBudgets = true;
    final response =
        await api.get('/api/Statistics/budgetpersite', queryParameters: {
      'siteId': id,
    });
    budgetPerSite = BudgetPerSiteModelStore(response.data);
    loadingBudgets = false;
  }

  @action
  Future<void> loadPPM() async {
    loadingPPM = true;
    ppmComplianceModel = await loadCompliance(Compliance.ppm);
    loadingPPM = false;
  }

  @action
  Future<void> loadSLA() async {
    loadingPPM = true;
    slaComplianceModel = await loadCompliance(Compliance.sla);
    loadingPPM = false;
  }

  Future<ComplianceModelStore> loadCompliance(Compliance compliance) async {
    final orderString = compliance == Compliance.ppm
        ? '/api/Statistics/ppmcompliance'
        : '/api/Statistics/slacompliance';

    final currentMonth = DateTime.now().month;
    final currentQuarter = currentMonth <= 3
        ? 1
        : currentMonth <= 6
            ? 2
            : currentMonth <= 9
                ? 3
                : 4;
    final currentYear = DateTime.now().year;

    final monthResponse = await api.get(orderString, queryParameters: {
      'type': 'monthly',
      'value': currentMonth,
      'siteId': id
    });
    final quarterResponse = await api.get(orderString, queryParameters: {
      'type': 'quaterly',
      'value': currentQuarter,
      'siteId': id
    });
    final yearResponse = await api.get(orderString, queryParameters: {
      'type': 'yearly',
      'value': currentYear,
      'siteId': id
    });

    final data = {
      'month': monthResponse.data,
      'quarter': quarterResponse.data,
      'year': yearResponse.data,
      'type': compliance
    };

    return ComplianceModelStore(data);
  }

  @action
  Future<void> loadDetails() async {
    orders.clear();
    loading = true;
    final response = await api.get(
      '/api/Sites/sitedetails',
      queryParameters: {
        'siteId': id,
      },
    );
    serialize(response.data);
    loading = false;
  }

  @override
  void serialize(Map<String, dynamic> data) {
    super.serialize(data);
    clientId = data['clientId'];
    services = ObservableList();

    ordersOnGoing = data['ordersOnGoing'];
    completedOrdersOnGoing = data['ongoingRepairWorks'];
    ordersCompleted = data['ordersCompleted'];
    ordersDeclined = data['ordersDeclined'];

    ppmCompliance = data['ppmCompliance'];
    slaCompliance = data['slaCompliance'];
    if (data['ordersOnGoingList'] != null) {
      final ordersData = (data['ordersOnGoingList'] as List)
          .map((order) => OrderModelStore(order))
          .toList();
      orders = ObservableList.of(ordersData);
    }

    if (data['ongoingRepairWorksList'] != null) {
      final completedOrdersData = (data['ongoingRepairWorksList'] as List)
          .map((order) => RepairWorkModelStore(order))
          .toList();
      completedOrders = ObservableList.of(completedOrdersData);
    }

    disabled = data['disabled'] ?? false;
    if (data['client'] != null) client = ClientModelStore(data['client']);
    if (data['units'] != null) {
      final unitsData =
          (data['units'] as List).map((unit) => UnitModelStore(unit));
      units = ObservableList.of(unitsData);
    }
  }

  Map<String, dynamic> toJson() => {
        "client": client.toJson(),
        "clientId": clientId,
        "id": id,
        "name": name,
      };
}

enum Compliance { ppm, sla }
