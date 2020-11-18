import 'package:flutter/material.dart';
import 'package:orders_app/components/card_info/index.dart';
import 'package:orders_app/components/cost_label/cost_label.dart';
import 'package:orders_app/components/gallery_view/gallery_view.dart';
import 'package:orders_app/components/rate/gk_rating_bar.dart';
import 'package:orders_app/constants/colors.dart';
import 'package:orders_app/icons/orders_app_icons_icons.dart';
import 'package:orders_app/screens/home_screens/orders/components/buttons.dart';
import 'package:orders_app/screens/home_screens/orders/components/labes.dart';
import 'package:orders_app/screens/home_screens/repair_works/components/repair_work_details.dart';
import 'package:orders_app/screens/rate.dart';
import 'package:orders_app/stores/index.dart';
import 'package:orders_app/stores/order_store/order_model_store.dart';
import 'package:orders_app/stores/user_store/user_store.dart';

class SingleOrderScreen extends StatelessWidget {
  static const String name = '/single_order';

  @override
  Widget build(BuildContext context) {
    final OrderModelStore order = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: GKColors.getOrderStatusColor(order.state),
        centerTitle: true,
        title: Text(
          "Order Nbr ${order.serial}",
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
          padding: EdgeInsets.symmetric(vertical: 15),
          margin: EdgeInsets.only(bottom: 15),
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CardInfo(
                      text: "Nbr ${order.serial}",
                      primary: true,
                    ),
                    if (order.submittedBy != null &&
                        order.submittedBy.name != null)
                      CardInfo(
                        icon: 'svgs/repairer.svg',
                        text: order.submittedBy.name,
                        primary: true,
                      ),
                    if (order.fault != null)
                      CardInfo(
                        icon: OrdersAppIcons.gear,
                        text: order.fault.name,
                      ),
                    CardInfo(
                      icon: OrdersAppIcons.clock,
                      text: orderStateString[order.state],
                      primary: true,
                    ),
                    if (order.isWaitingApproval)
                      CardInfo(
                        icon: OrdersAppIcons.clock,
                        text: 'Waiting Approval',
                        primary: true,
                        color: GKColors.red,
                      ),
                    if (order.completedOrder != null &&
                        order.completedOrder.totalCost != null)
                      CostLabel(
                        cost: order.completedOrder.totalCost.toString(),
                      ),
                    if (order.description != null &&
                        order.description.isNotEmpty)
                      OrderDescription(order: order),
                    if (order.completedOrder != null) ...[
                      Divider(),
                      PartsList(
                        completedOrder: order.completedOrder,
                        withButton: false,
                      ),
                      ToolsList(
                        completedOrder: order.completedOrder,
                        withButton: false,
                      ),
                      CostsList(
                        completedOrder: order.completedOrder,
                        withButton: false,
                      ),
                    ]
                  ],
                ),
              ),
              if (order.images != null && order.images.isNotEmpty)
                GalleryViewNetwork(images: order.images),
              if (userStore.role == Role.manager &&
                  order.state == OrderState.pending)
                PendingOrderOptions(order: order),
              if (userStore.role == Role.manager &&
                  order.state == OrderState.confirmed)
                CreateRepairWorkButton(order: order),
              if (order.isWaitingApproval && userStore.role != Role.manager)
                ApprovalOrderOptions(
                  order: order,
                ),
              if (userStore.role == Role.manager &&
                  (order.state == OrderState.completed ||
                      order.state == OrderState.addedToRepairWork)) ...[
                PrintExcelButton(order: order),
                PrintPdfButton(order: order),
              ],

              if (!order.isRated &&
                  order.state == OrderState.completed &&
                  userStore.role != Role.manager) ...[
                GKRatingBar(
                  initialRating: order.ratingDetails.rating,
                  onRatingUpdate: (rating) {
                    order.setRating(rating);
                    Navigator.of(context)
                        .pushNamed(RateScreen.name, arguments: order);
                  },
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
