import 'package:orders_app/stores/cost_store/cost_model_store.dart';
import 'package:mobx/mobx.dart';
part 'file_model_store.g.dart';

class FileModelStore = _FileModelStore with _$FileModelStore;

abstract class _FileModelStore with Store{

  @observable
  int id;

  @observable
  String orderId;

  @observable
  String fileKey;

  @observable
  String fileUrl;

  _FileModelStore(Map<String,dynamic> data){
    this.serialize(data);
  }

  _FileModelStore.plain();

  @action
  void serialize(Map<String,dynamic> data){
    id = data['id'];
    orderId = data['orderId'];
    fileKey = data['fileKey'];
    fileUrl = data['fileUrl'];
  }


  bool operator ==(o) => o is _FileModelStore && o.id == id;   //New
  int get hashCode => id.hashCode;
}