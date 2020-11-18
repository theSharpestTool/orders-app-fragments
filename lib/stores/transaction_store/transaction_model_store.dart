import 'package:orders_app/stores/user_store/user_store.dart';
import 'package:mobx/mobx.dart';
import 'package:orders_app/stores/base_store/base_model_store.dart';

part 'transaction_model_store.g.dart';

class TransactionModelStore = _TransactionModelStore
    with _$TransactionModelStore;

abstract class _TransactionModelStore extends BaseModelStore with Store {
  _TransactionModelStore(Map<String, dynamic> data) : super(data);

  @observable
  DateTime createDate;

  @observable
  int state;

  @observable
  String notes;

  @observable
  UserStore submittedBy;

  @override
  @action
  void serialize(Map<String, dynamic> data) {
    super.serialize(data);
    submittedBy = UserStore(data: data["user"]);
    createDate = DateTime.parse(data["createDate"]);
    state = data["state"];
    notes = data["notes"] == null ? null : data["notes"];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": submittedBy.toJson(),
        "createDate": createDate.toIso8601String(),
        "state": state,
        "notes": notes == null ? null : notes,
    };
}
