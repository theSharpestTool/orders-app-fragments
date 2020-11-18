import 'dart:convert';
import 'dart:typed_data';

import 'package:orders_app/stores/index.dart';
import 'package:orders_app/stores/order_store/order_model_store.dart';
import 'package:orders_app/stores/repair_work_store/repair_work_model_store.dart';
import 'package:mobx/mobx.dart';
import 'package:orders_app/stores/base_store/base_model_store.dart';

part 'repairer_model_store.g.dart';

class RepairerModelStore = _RepairerModelStore with _$RepairerModelStore;

abstract class _RepairerModelStore extends BaseModelStore with Store {
  _RepairerModelStore(Map<String, dynamic> data) : super(data);

  @observable
  String email;

  @observable
  Uint8List profileImage;

  @computed
  int get ordersAmount {
    return orders.length;
  }

  @computed
  ObservableList<RepairWorkModelStore> get completedOrders {
    return ObservableList.of(completedOrderStore.data
        .where((completedOrder) => completedOrder.assignedTo.userId == id));
  }

  @computed
  ObservableList<OrderModelStore> get orders {
    final completedOrdersWithOrder = completedOrders.where((completedOrder) => completedOrder.order != null);
    return ObservableList.of(completedOrdersWithOrder.map((completedOrder) => completedOrder.order));
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "fullName": name,
      };

  @override
  @action
  void serialize(Map<String, dynamic> data) {
    super.serialize(data);
    name = data['fullName'];
    email = data['email'];
    if (data['profileImage'] != null)
      profileImage = base64.decode(data['profileImage']);
  }
}
