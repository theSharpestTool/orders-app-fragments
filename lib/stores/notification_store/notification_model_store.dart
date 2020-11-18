import 'package:orders_app/services/push_notification_service.dart';
import 'package:orders_app/stores/card_store/card_model_store.dart';
import 'package:mobx/mobx.dart';
import 'package:orders_app/stores/base_store/base_model_store.dart';
part 'notification_model_store.g.dart';

class NotificationModelStore = _NotificationModelStore with _$NotificationModelStore;

abstract class _NotificationModelStore extends BaseModelStore with Store {
  _NotificationModelStore(Map<String, dynamic> data) : super(data);

  @computed
  String get title => '${notificationTitle[type]} #${card.serial}';
  
  @computed
  String get body => notificationBody[type];

  @observable
  CardModelStore card;

  @observable
  NotificationType type;

  @override
  void serialize(Map<String, dynamic> json) {
    card = json['card'];
    type = json['type'];
  }
}
