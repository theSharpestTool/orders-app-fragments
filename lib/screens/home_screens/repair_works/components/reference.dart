import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:orders_app/components/buttons/gk_outline_button.dart';
import 'package:orders_app/components/card_info/card_info.dart';
import 'package:orders_app/screens/home_screens/orders/single_order.dart';
import 'package:orders_app/screens/home_screens/tasks/single_task.dart';
import 'package:orders_app/screens/home_screens/repair_works/single_repair_work.dart';
import 'package:orders_app/stores/index.dart';
import 'package:orders_app/stores/task_store/task_model_store.dart';
import 'package:orders_app/stores/repair_work_store/repair_work_model_store.dart';

class OrderReferense extends StatelessWidget {
  const OrderReferense({
    @required this.completedOrder,
  });

  final RepairWorkModelStore completedOrder;

  @override
  Widget build(BuildContext context) {
    if (!completedOrder.orderIsLoaded) {
      completedOrder.loadOrder();
    }
    return CardInfo(
      text: 'Order #R${completedOrder.order.serial}',
      primary: true,
      options: <Widget>[
        Observer(
          builder: (_) => GKOutlineButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                SingleOrderScreen.name,
                arguments: completedOrder.order,
              );
            },
            loading: completedOrder.orderIsLoading,
            text: 'Go To Order',
          ),
        ),
      ],
    );
  }
}

class TaskReferense extends StatelessWidget {
  const TaskReferense({
    @required this.completedOrder,
  });

  final RepairWorkModelStore completedOrder;

  @override
  Widget build(BuildContext context) {
    return CardInfo(
      text: 'Task #T${completedOrder.task.serial}',
      primary: true,
      options: <Widget>[
        GKOutlineButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(
              SingleTaskScreen.name,
              arguments: taskStore.getByRepairWork(completedOrder),
            );
          },
          text: 'Go To Task',
        ),
      ],
    );
  }
}

class RepairWorkReference extends StatelessWidget {
  final TaskModelStore task;

  const RepairWorkReference({this.task});

  @override
  Widget build(BuildContext context) {
    return CardInfo(
      text: 'Repair Work #T${task.completedOrder.serial}',
      primary: true,
      options: <Widget>[
        GKOutlineButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(
              SingleRepairWorkScreen.name,
              arguments: completedOrderStore.getByTask(task),
            );
          },
          text: 'Go To Repair Work',
        ),
      ],
    );
  }
}
