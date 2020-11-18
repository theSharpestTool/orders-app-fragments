import 'package:orders_app/config/api.dart';
import 'package:orders_app/stores/site_store/site_model_store.dart';
import 'package:orders_app/stores/unit_type_store/unit_type_model_store.dart';
import 'package:mobx/mobx.dart';
import 'package:orders_app/stores/base_store/base_model_store.dart';

part 'unit_model_store.g.dart';

class UnitModelStore = _UnitModelStore with _$UnitModelStore;

abstract class _UnitModelStore extends BaseModelStore with Store {
  _UnitModelStore(Map<String, dynamic> data) : super(data);

  @observable
  bool isCommonArea;

  @observable
  SiteModelStore site;

  @observable
  UnitTypeModelStore unitType;

  @override
  @action
  void serialize(Map<String, dynamic> data) {
    super.serialize(data);
    isCommonArea = data['isCommonArea'];
    site = data['site'] != null ? SiteModelStore(data['site']) : null;
    unitType =
        data['unitType'] != null ? UnitTypeModelStore(data['unitType']) : null;
  }

  @action
  Future<void> assign({Function onError(error)}) async {
    try {
      loading = true;
      await api.post('/api/Units/assign', data: {
        'unitId': id,
      });
      loading = false;
    } catch (e) {
      loading = false;
      onError(e);
    }
  }

  Map<String, dynamic> toJson() => {
        "siteId": site.id,
        "unitTypeId": unitType?.id,
        "site": site.toJson(),
        "isCommonArea": isCommonArea,
        "assets": [],
        "id": id,
        "name": name,
      };
}
