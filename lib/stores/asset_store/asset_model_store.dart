import 'package:mobx/mobx.dart';
import 'package:orders_app/stores/base_store/base_model_store.dart';

part 'asset_model_store.g.dart';

class AssetModelStore = _AssetModelStore with _$AssetModelStore;

abstract class _AssetModelStore extends BaseModelStore with Store {
  _AssetModelStore(Map<String, dynamic> data) : super(data);
  _AssetModelStore.plain() : super.plain();

  @observable
  String typeId;

  @observable
  String unitId;

  @observable
  String model;

  @observable
  String brand;

  @observable
  String specs;

  @override
  @action
  void serialize(Map<String, dynamic> data) {
    super.serialize(data);
    typeId = data['typeId'];
    unitId = data['unitId'];
    model = data['model'];
    brand = data['brand'];
    specs = data['specs'];
  }
}
