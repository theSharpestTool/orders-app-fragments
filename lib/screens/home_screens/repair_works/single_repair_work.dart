import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:orders_app/components/card_info/index.dart';
import 'package:orders_app/components/cost_label/cost_label.dart';
import 'package:orders_app/components/gallery_view/gallery_view.dart';
import 'package:orders_app/constants/colors.dart';
import 'package:orders_app/icons/orders_app_icons_icons.dart';
import 'package:orders_app/screens/home_screens/repair_works/components/action_buttons.dart';
import 'package:orders_app/screens/home_screens/repair_works/components/reference.dart';
import 'package:orders_app/screens/home_screens/repair_works/components/repair_work_details.dart';
import 'package:orders_app/screens/home_screens/repair_works/components/repair_work_number_label.dart';
import 'package:orders_app/stores/base_store/base_model_store.dart';
import 'package:orders_app/stores/index.dart';
import 'package:orders_app/stores/user_store/user_store.dart';
import 'package:orders_app/stores/repair_work_store/repair_work_model_store.dart';

class SingleRepairWorkScreen extends StatelessWidget {
  static const String name = '/single_repair_work';

  @override
  Widget build(BuildContext context) {
    final RepairWorkModelStore args = ModalRoute.of(context).settings.arguments;
    final completedOrder = args.copy();

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: GKColors.getRepairWorkStatusColor(completedOrder.state),
        centerTitle: true,
        title: Text(
          "Order Nbr ${completedOrder.serial}",
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
          child: Observer(
            builder: (_) => Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      RepairWorkNumberLabel(completedOrder: completedOrder),
                      if (completedOrder.order != null)
                        OrderReferense(completedOrder: completedOrder),
                      if (completedOrder.task != null)
                        TaskReferense(completedOrder: completedOrder),
                      if (completedOrder.service != null)
                        CardInfo(
                          icon: OrdersAppIcons.gear,
                          text: completedOrder.service.name,
                          primary: true,
                        ),
                      CardInfo(
                        icon: OrdersAppIcons.clock,
                        text: completedOrderStateString[completedOrder.state],
                      ),
                      if (completedOrder.assignedTo != null &&
                          completedOrder.assignedTo.name != null)
                        CardInfo(
                          icon: 'svgs/repairer.svg',
                          text: completedOrder.assignedTo.name,
                        ),
                      if (completedOrder.totalCost != null)
                        CostLabel(cost: completedOrder.totalCost.toString()),
                      PartsList(
                        withButton: userStore.role != Role.repairer,
                        completedOrder: completedOrder,
                        selectedPartCode: ColorCodes.orange,
                      ),
                      ToolsList(
                        withButton: userStore.role != Role.repairer,
                        completedOrder: completedOrder,
                        selectedToolCode: ColorCodes.orange,
                      ),
                      CostsList(
                        withButton: userStore.role != Role.repairer,
                        completedOrder: completedOrder,
                        selectedCostCode: ColorCodes.orange,
                      ),
                      Instructions(completedOrder: completedOrder),
                    ],
                  ),
                ),
                if (completedOrder.order != null)
                  GalleryViewNetwork(images: completedOrder.order.images),
                if (completedOrder.state == RepairWorkState.workInProgress) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25.0,
                      vertical: 10,
                    ),
                    child: CardInfo(
                      text: 'Add images to complete the Repair Work',
                      primary: true,
                    ),
                  ),
                  CardGalleryView(order: completedOrder),
                  SizedBox(height: 10),
                ],
                if (completedOrder.images != null &&
                    completedOrder.images.isNotEmpty) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25.0,
                      vertical: 10,
                    ),
                    child: CardInfo(
                      text: 'Repair Work images:',
                      primary: true,
                    ),
                  ),
                  GalleryViewNetwork(images: completedOrder.images),
                  SizedBox(height: 10),
                ],
                if (completedOrder.state == RepairWorkState.workInProgress &&
                    userStore.role == Role.manager)
                  OrderApprovalButton(completedOrder: completedOrder),
                if (completedOrder.state == RepairWorkState.created ||
                    completedOrder.state == RepairWorkState.quotationApproved)
                  WorkInProgressButton(completedOrder: completedOrder),
                if (completedOrder.state == RepairWorkState.workInProgress &&
                    userStore.role == Role.repairer)
                  CompleteRepairWorkButton(completedOrder: completedOrder),
                if ((completedOrder.state == RepairWorkState.workInProgress ||
                        completedOrder.state == RepairWorkState.completedOrderCompleted) &&
                    userStore.role == Role.manager)
                  MarkOrderAsCompletedButton(completedOrder: completedOrder),
                // GKButton(
                //   text: 'allowed actions',
                //   onTap: () async {
                //     final response = await api.get(
                //       '/api/RepairWorks/allowedactions/${completedOrder.id}',
                //       queryParameters: {
                //         'completedOrderId': completedOrder.id,
                //       },
                //     );
                //     print(response);
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
