import 'dart:convert';
import 'dart:typed_data';

import 'package:orders_app/stores/base_store/base_model_store.dart';
import 'package:orders_app/stores/file_store/file_model_store.dart';
import 'package:mobx/mobx.dart';
part 'cost_model_store.g.dart';

class CostModelStore = _CostModelStore with _$CostModelStore;

abstract class _CostModelStore extends BaseModelStore with Store {
  _CostModelStore(Map<String, dynamic> data) : super(data);
  _CostModelStore.plain() : super.plain();

  @observable
  String description = '';

  @observable
  bool isAdded = false;

  @observable
  double amount;

  @observable
  ObservableList<FileModelStore> files = ObservableList();

  @observable
  ObservableList<Uint8List> userFiles = ObservableList();

  @computed
  ObservableList<String> get filesGallery =>
      ObservableList.of(files.map((file) => file.fileUrl));

  @computed
  bool get isValid =>
      description != null && description.isNotEmpty && amount != null;

  @action
  void serialize(Map<String, dynamic> data) {
    super.serialize(data);
    description = data['description'];
    amount = data['amount'];
    if (data['files'] != null)
      files = ObservableList.of(
          (data['files'] as List).map((item) => FileModelStore(item)));
  }

  @override
  Map<String, dynamic> toJson() => {
        //'id': id,
        'description': description,
        'amount': amount,
        'textColorCode': textColorCode.index,
        'files': userFiles.map((file) => base64.encode(file)).toList(),
      };

  CostModelStore clone() {
    final cost = CostModelStore({
      'id': id,
      'name': name,
      'description': description,
      'amount': amount,
    });
    cost.userFiles = ObservableList.of(userFiles);
    return cost;
  }
}
