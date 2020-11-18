import 'package:orders_app/services/push_notification_service.dart';
import 'package:orders_app/stores/card_store/card_model_store.dart';
import 'package:orders_app/stores/index.dart';
import 'package:orders_app/stores/notification_store/notification_model_store.dart';
import 'package:orders_app/stores/user_store/user_store.dart';
import 'package:mobx/mobx.dart';
import 'package:orders_app/stores/base_store/base_list_store.dart';
part 'notification_store.g.dart';

class NotificationStore = _NotificationStore with _$NotificationStore;

abstract class _NotificationStore extends BaseListStore<NotificationModelStore>
    with Store {

  @override
  int get length => notifications.length;

  @computed
  bool get isEmpty => notifications.isEmpty;

  @computed
  ObservableList<NotificationModelStore> get notifications {
    final totalList = List<NotificationModelStore>();
    if (userStore.role == Role.client) {
      final notRated = getNotificationsList(
        cards: orderStore.notRated,
        type: NotificationType.orderCompleted,
      );
      final notApproved = getNotificationsList(
        cards: orderStore.notApproved,
        type: NotificationType.newItemsAdded,
      );

      totalList.addAll([
        ...notRated,
        ...notApproved,
      ]);
    }

    if (userStore.role == Role.manager) {
      final justCreated = getNotificationsList(
        cards: orderStore.pending,
        type: NotificationType.orderCreated,
      );
      final approved = getNotificationsList(
        cards: completedOrderStore.quoteApproved,
        type: NotificationType.quoteApproved,
      );
      final rejected = getNotificationsList(
        cards: completedOrderStore.quoteRejected,
        type: NotificationType.quoteRejected,
      );
      final completed = getNotificationsList(
        cards: completedOrderStore.completedOrderCompleted,
        type: NotificationType.techFinished,
      );
      
      totalList.addAll([
        ...justCreated,
        ...approved,
        ...rejected,
        ...completed
      ]);
    }

    if (userStore.role == Role.repairer) {
      final created = getNotificationsList(
        cards: completedOrderStore.inProgress,
        type: NotificationType.techAssisgned,
      );

      totalList.addAll(created);
    }

    totalList.sort((notif1, notif2) {
      final date1 = notif1.card.createdDate;
      final date2 = notif2.card.createdDate;

      return date2.compareTo(date1);
    });
    return ObservableList.of(totalList);
  }

  List<NotificationModelStore> getNotificationsList(
      {NotificationType type, ObservableList<CardModelStore> cards}) {
    return cards
        .map((card) => NotificationModelStore({
              'type': type,
              'card': card,
            }))
        .toList();
  }
}
