import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:orders_app/components/buttons/gk_outline_button.dart';
import 'package:orders_app/components/card_block/gk_card.dart';
import 'package:orders_app/components/card_info/card_info.dart';
import 'package:orders_app/components/dialogs/gk_dialog.dart';
import 'package:orders_app/config/api.dart';
import 'package:orders_app/constants/colors.dart';
import 'package:orders_app/icons/orders_app_icons_icons.dart';
import 'package:orders_app/screens/home_screens/repair_works/components/reference.dart';
import 'package:orders_app/screens/home_screens/repair_works/repair_work_flow.dart';
import 'package:orders_app/stores/index.dart';
import 'package:orders_app/stores/task_store/task_model_store.dart';
import 'package:orders_app/stores/user_store/user_store.dart';

class SingleTaskScreen extends StatelessWidget {
  static final String name = '/single_task';

  @override
  Widget build(BuildContext context) {
    final TaskModelStore task = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: GKColors.getTaskStatusColor(task.state),
        centerTitle: true,
        title: Text(
          "Order Nbr ${task.serial}",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(
            horizontal: 25.0,
            vertical: 20,
          ),
          margin: EdgeInsets.only(bottom: 15),
          child: Observer(
            builder: (_) => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                CardInfo(
                  options: <Widget>[
                    if (task.deadline != null) DeadlineTimer(order: task),
                  ],
                  text: "#T${task.serial}",
                  primary: true,
                ),
                if (task.completedOrder != null) RepairWorkReference(task: task),
                if (task.siteService != null) ...[
                  CardInfo(
                    icon: OrdersAppIcons.building,
                    text: task.siteService.site.name,
                  ),
                  CardInfo(
                    icon: OrdersAppIcons.gear,
                    text: task.siteService.service.name,
                  ),
                ],
                CardInfo(
                  icon: OrdersAppIcons.clock,
                  text: taskStateString[task.state],
                ),
                CardInfo(
                  icon: OrdersAppIcons.calendar,
                  text: task.createdDateString,
                ),
                if (task.unit != null)
                  CardInfo(
                    icon: OrdersAppIcons.building,
                    text: task.unit.name,
                  ),
                if (task.name != null)
                  CardInfo(
                    icon: OrdersAppIcons.building,
                    text: task.name,
                  ),
                // GKOutlineButton(
                //   onPressed: () async {
                //     final response = await api.get(
                //       '/api/ScheduledTasks/allowedactions/${task.id}',
                //       queryParameters: {'scheduledTaskId': task.id},
                //     );
                //     print(response);
                //     final completedOrder = completedOrderStore.getByTask(task);
                //     print('w');
                //   },
                //   text: 'test',
                // ),
                if (task.description != null) ...[
                  Text(
                    'Description:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(task.description),
                ],
                SizedBox(height: 20),
                if (task.state == TaskState.created &&
                    userStore.role == Role.manager) ...[
                  GKOutlineButton(
                    onPressed: () async {
                      RepairWorkFlow.start(
                        context: context,
                        task: task,
                      );
                    },
                    text: 'CREATE A REPAIR WORK',
                  ),
                  GKOutlineButton(
                    onPressed: () async {
                      await task.markAsDone();
                      GKDialog.show(
                        context: context,
                        reason: DialogReason.success,
                        text: 'The task was marked as done',
                      );
                    },
                    text: 'MARK AS DONE',
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
