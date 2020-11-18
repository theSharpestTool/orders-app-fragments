import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orders_app/components/card_info/index.dart';
import 'package:orders_app/components/gallery_view/gallery_view.dart';
import 'package:orders_app/constants/colors.dart';
import 'package:orders_app/icons/orders_app_icons_icons.dart';
import 'package:orders_app/stores/card_store/card_model_store.dart';
import 'package:orders_app/stores/order_store/order_model_store.dart';
import 'package:orders_app/stores/task_store/task_model_store.dart';
import 'package:orders_app/stores/repair_work_store/repair_work_model_store.dart';
import 'package:orders_app/style/index.dart';
import 'package:timer_builder/timer_builder.dart';

class GKCard extends StatelessWidget {
  final CardModelStore order;
  final String onPressedRoute;
  final String defaultSvg;

  GKCard({
    @required this.order,
    @required this.onPressedRoute,
    @required this.defaultSvg,
  });

  @override
  Widget build(BuildContext context) {
    String state, prefix;

    if (order.state is OrderState) {
      state = orderStateString[order.state];
      prefix = 'R';
    } else if (order.state is RepairWorkState) {
      state = completedOrderStateString[order.state];
      prefix = 'W';
    } else if (order.state is TaskState) {
      state = taskStateString[order.state];
      prefix = 'T';
    } else {
      state = 'unknown';
      prefix = '';
    }

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          onPressedRoute,
          arguments: order,
        );
      },
      child: Observer(
        builder: (_) => ClipRRect(
          borderRadius: BorderRadius.circular(BorderDim.radius),
          child: Container(
            margin: EdgeInsets.symmetric(
              vertical: 7,
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(BorderDim.radius),
              border: Border.all(
                color: Colors.blueGrey,
                width: BorderDim.width,
              ),
            ),
            child: Column(
              children: <Widget>[
                Stack(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(BorderDim.radius),
                      topRight: Radius.circular(BorderDim.radius),
                    ),
                    child: order.titleImage == null
                        ? Container(
                            child: SvgPicture.asset(
                              defaultSvg,
                              fit: BoxFit.fitWidth,
                            ),
                            width: double.infinity,
                            height: MediaQuery.of(context).size.width / 3,
                          )
                        : GKImageNetwork(
                            image: order.titleImage,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: MediaQuery.of(context).size.width / 3,
                          ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    height: MediaQuery.of(context).size.width / 2.99,
                    width: double.infinity,
                    alignment: Alignment.bottomLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(BorderDim.radius),
                        topRight: Radius.circular(BorderDim.radius),
                      ),
                      gradient: LinearGradient(
                          colors: [Colors.transparent, Colors.white],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                    ),
                    child: Text(
                      'Maintenance #$prefix${order.serial}',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ]),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CardInfo(
                        options: <Widget>[
                          if (order.deadline != null)
                            DeadlineTimer(order: order),
                        ],
                        icon: OrdersAppIcons.clock,
                        text: state,
                        primary: true,
                      ),
                      if (order.isWaitingApproval)
                        CardInfo(
                          icon: OrdersAppIcons.clock,
                          text: 'Waiting Approval',
                          primary: true,
                          color: GKColors.red,
                        ),
                      CardInfo(
                        icon: OrdersAppIcons.calendar,
                        text: order.createdDateString,
                      ),
                      if (order.unit != null)
                        CardInfo(
                          icon: OrdersAppIcons.building,
                          text: order.unit.name,
                        ),
                      if (order.name != null)
                        CardInfo(
                          icon: OrdersAppIcons.building,
                          text: order.name,
                        ),
                      if (order.submittedBy != null &&
                          order.submittedBy.name != null)
                        CardInfo(
                          icon: OrdersAppIcons.user,
                          text: order.submittedBy.name,
                        ),
                      if (order.assignedTo != null &&
                          order.assignedTo.name != null)
                        CardInfo(
                          icon: OrdersAppIcons.user,
                          text: order.assignedTo.name,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DeadlineTimer extends StatelessWidget {
  const DeadlineTimer({
    Key key,
    @required this.order,
  }) : super(key: key);

  final CardModelStore order;

  @override
  Widget build(BuildContext context) {
    return TimerBuilder.periodic(
      Duration(seconds: 1),
      builder: (context) => Text(
        order.deadlineString,
        style: TextStyle(
          color: order.deadlineExpired ? GKColors.blue : GKColors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
