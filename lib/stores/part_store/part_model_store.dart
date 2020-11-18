import 'package:orders_app/stores/repair_work_store/repair_work_model_store.dart';
import 'package:mobx/mobx.dart';
import 'package:orders_app/stores/base_store/base_model_store.dart';

part 'part_model_store.g.dart';

class PartModelStore = _PartModelStore with _$PartModelStore;

abstract class _PartModelStore extends BaseModelStore with Store {
  _PartModelStore(Map<String, dynamic> data) : super(data);

  @observable
  bool isAdded = true;

  @observable
  String number;

  @observable
  double price;

  @observable
  int quantity = 1;

  @observable
  ObservableList<RepairWorkModelStore> completedOrders;

  @observable
  BaseModelStore category;

  @observable
  String unit;

  @override
  @action
  void serialize(Map<String, dynamic> data) {
    super.serialize(data);
    isAdded = false;
    number = data['number'];
    price = data['price'];
    unit = data['unit'];
    quantity = data['quantity'] ?? 1;
    if (data.containsKey('part')) {
      final partData = data['part'];
      name = partData['name'];
      unit = partData['unit'];
      id = partData['id'];
    }
    completedOrders = ObservableList();
    if (data['category'] != null) category = BaseModelStore(data['category']);
  }

  @action
  void setQuantity(String value) {
    quantity = value.isEmpty ? 1 : int.parse(value);
  }

  Map<String, dynamic> toJsonWithRepairWork(String completedOrderId) => {
        "completedOrderId": completedOrderId,
        "partId": id,
        "price": price,
        "quantity": quantity,
        "textColorCode": textColorCode.index,
      };
}
