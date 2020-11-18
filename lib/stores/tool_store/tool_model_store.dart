import 'package:mobx/mobx.dart';
import 'package:orders_app/stores/base_store/base_model_store.dart';

part 'tool_model_store.g.dart';

class ToolModelStore = _ToolModelStore with _$ToolModelStore;

abstract class _ToolModelStore extends BaseModelStore with Store {
  _ToolModelStore(Map<String, dynamic> data) : super(data);

  @observable
  bool isAdded = false;

  @override
  @action
  void serialize(Map<String, dynamic> data) {
    data.containsKey('tool')
        ? super.serialize(data['tool'])
        : super.serialize(data);
  }
}
