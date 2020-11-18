import 'package:orders_app/stores/base_store/base_model_store.dart';
import 'package:mobx/mobx.dart';

part 'client_model_store.g.dart';

class ClientModelStore = _ClientModelStore with _$ClientModelStore;

abstract class _ClientModelStore extends BaseModelStore with Store {
  _ClientModelStore(Map<String, dynamic> data) : super(data);

  @observable
  String providerId;

  @observable
  String userRef;

  @override
  void serialize(Map<String, dynamic> data) {
    super.serialize(data);
    name = data['name'];
    providerId = data['providerId'];
    userRef = data['userRef'];
  }

  Map<String, dynamic> toJson() => {
        "userRef": userRef,
        "id": id,
        "name": name,
      };
}
