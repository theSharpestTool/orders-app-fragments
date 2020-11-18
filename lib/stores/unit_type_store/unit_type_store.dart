import 'package:orders_app/stores/unit_type_store/unit_type_model_store.dart';
import 'package:mobx/mobx.dart';
import 'package:orders_app/stores/base_store/base_list_store.dart';
part 'unit_type_store.g.dart';

class UnitTypeStore = _UnitTypeStore with _$UnitTypeStore;

abstract class _UnitTypeStore extends BaseListStore<UnitTypeModelStore> with Store {

  @override
  UnitTypeModelStore createNew(Map<String, dynamic> data) {
    return UnitTypeModelStore(data);
  }
}
