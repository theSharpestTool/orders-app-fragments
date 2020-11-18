import 'package:orders_app/stores/base_store/base_model_store.dart';
import 'package:mobx/mobx.dart';


part 'sub_service_model_store.g.dart';

class SubServiceModelStore = _SubServiceModelStore with _$SubServiceModelStore;

abstract class _SubServiceModelStore extends BaseModelStore with Store {
  _SubServiceModelStore(Map<String, dynamic> data) : super(data);

  // @observable
  // ObservableList<String> faultIds = ObservableList<String>();

  // @computed
  // List<FaultModelStore> get faults =>
  //     faultStore.data.where((fault) => faultIds.contains(fault.id)).toList();

  @override
  @action
  void serialize(Map<String, dynamic> data) {
    super.serialize(data);
    // final List<dynamic> faults = data['faults'];
    // faults.forEach((f) {
    //   faultIds.add(f['id']);
    //   f['subService'] = this;
    // });
    // faultStore.populate(faults);
  }
}
