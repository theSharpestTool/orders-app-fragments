import 'package:orders_app/stores/sub_service_store/sub_service_model_store.dart';
import 'package:orders_app/stores/unit_type_store/unit_type_model_store.dart';
import 'package:mobx/mobx.dart';
import 'package:orders_app/stores/base_store/base_model_store.dart';

part 'service_model_store.g.dart';

class ServiceModelStore = _ServiceModelStore with _$ServiceModelStore;

abstract class _ServiceModelStore extends BaseModelStore with Store {
  _ServiceModelStore(Map<String, dynamic> data) : super(data);

  @observable
  String categoryId;

  @observable
  BaseModelStore category;

  @observable
  num order;

  @observable
  ObservableList<UnitTypeModelStore> unitTypes;

  @observable
  ObservableList<SubServiceModelStore> subServices;

  @override
  @action
  void serialize(Map<String, dynamic> data) {
    super.serialize(data);
    if (data['category'] != null) category = BaseModelStore(data['category']);
    categoryId = data['categoryId'];
    order = data['order'];
    unitTypes = ObservableList();
    subServices = ObservableList();
  }

  Map<String, dynamic> toJson() => {
        "category": category.toJson(),
        "categoryId": categoryId,
        "order": order,
        "assetTypes": [],
        "unitTypes": List<dynamic>.from(unitTypes.map((x) => x.toJson())),
        "id": id,
        "name": name,
      };
}
