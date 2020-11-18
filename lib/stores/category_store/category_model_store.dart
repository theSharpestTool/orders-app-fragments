import 'package:mobx/mobx.dart';
import 'package:orders_app/stores/base_store/base_model_store.dart';

part 'category_model_store.g.dart';

class CategoryModelStore = _CategoryModelStore with _$CategoryModelStore;

abstract class _CategoryModelStore extends BaseModelStore with Store {
  _CategoryModelStore(Map<String, dynamic> data) : super(data);

  @override
  @action
  void serialize(Map<String, dynamic> data) {
    super.serialize(data);
  }
}
