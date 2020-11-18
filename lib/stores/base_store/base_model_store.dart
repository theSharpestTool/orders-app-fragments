import 'package:mobx/mobx.dart';
part 'base_model_store.g.dart';

class BaseModelStore = _BaseModelStore with _$BaseModelStore;

enum ColorCodes {
  black,
  orange,
  green,
}

abstract class _BaseModelStore with Store {
  @observable
  bool loading = false;

  @observable
  bool loaded = false;

  @observable
  String id;

  @observable
  String name;

  @observable
  ColorCodes textColorCode = ColorCodes.black;

  _BaseModelStore(Map<String, dynamic> data) {
    this.serialize(data);
  }

  _BaseModelStore.plain();

  bool containsPatern(String pattern) {
    return name.toLowerCase().contains(pattern);
  }

  @action
  void serialize(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    if (data.containsKey('textColorCode'))
      textColorCode = ColorCodes.values[data['textColorCode']];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "textColorCode": textColorCode.index,
      };

  bool operator ==(o) => o is _BaseModelStore && o.id == id; //New
  int get hashCode => id.hashCode;
}
