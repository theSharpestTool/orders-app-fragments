import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:orders_app/components/card_info/card_info.dart';
import 'package:orders_app/components/gallery_view/gallery_view.dart';
import 'package:orders_app/constants/colors.dart';
import 'package:orders_app/screens/home_screens/repair_works/components/add_button.dart';
import 'package:orders_app/screens/home_screens/repair_works/repair_work_flow.dart';
import 'package:orders_app/stores/base_store/base_model_store.dart';
import 'package:orders_app/stores/repair_work_store/repair_work_model_store.dart';

abstract class DetailsList extends StatelessWidget {
  final RepairWorkModelStore completedOrder;
  final bool withButton;
  final ColorCodes selectedColorCode;

  DetailsList({
    @required this.completedOrder,
    this.withButton = true,
    this.selectedColorCode,
  });
}

final Map<ColorCodes, Color> colorCodes = {
  ColorCodes.black: Colors.black,
  ColorCodes.green: GKColors.green,
  ColorCodes.orange: GKColors.red
};

class Instructions extends DetailsList {
  Instructions({@required RepairWorkModelStore completedOrder})
      : super(completedOrder: completedOrder);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (completedOrder.instructions != null &&
            completedOrder.instructions.isNotEmpty) ...[
          SizedBox(height: 10),
          CardInfo(
            text: 'Instructions',
            primary: true,
          ),
          Text(completedOrder.instructions)
        ],
      ],
    );
  }
}

class CostsList extends DetailsList {
  CostsList({
    @required RepairWorkModelStore completedOrder,
    bool withButton = true,
    ColorCodes selectedCostCode,
  }) : super(
          completedOrder: completedOrder,
          withButton: withButton,
          selectedColorCode: selectedCostCode,
        );

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (completedOrder.costs.isNotEmpty) ...[
            SizedBox(height: 10),
            CardInfo(
              text: 'Expenses',
              primary: true,
            ),
            for (final cost in completedOrder.costs)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '${cost.description} (${cost.amount})',
                    style: TextStyle(
                      color: cost.isAdded
                          ? GKColors.blue
                          : colorCodes[cost.textColorCode],
                    ),
                  ),
                  // for (int i = 0; i < cost.files.length; i++)
                  //   Padding(
                  //     padding: EdgeInsets.only(left: 8.0),
                  //     child: CardInfo(
                  //       text: 'File${i + 1}.png',
                  //       icon: 'svgs/attach.svg',
                  //       color: GKColors.blue,
                  //     ),
                  //   ),
                  if (cost.filesGallery.isNotEmpty)
                    GalleryViewNetwork(images: cost.filesGallery),
                  if (cost.userFiles.isNotEmpty)
                    GalleryViewMemory(images: cost.userFiles),
                ],
              ),
          ],
          if (completedOrder.state == RepairWorkState.workInProgress && withButton)
            AddButton(
              text: 'ADD EXPENSES',
              onTap: () async {
                await showDialog(
                  context: context,
                  builder: (_) => AddExpensesDialog(
                    completedOrder: completedOrder,
                    isSingle: true,
                    selectedExpenseCode: selectedColorCode,
                  ),
                );
                completedOrder.currentCost.userFiles.clear();
              },
            ),
        ],
      ),
    );
  }
}

class ToolsList extends DetailsList {
  ToolsList({
    @required RepairWorkModelStore completedOrder,
    ColorCodes selectedToolCode,
    bool withButton = true,
  }) : super(
          completedOrder: completedOrder,
          withButton: withButton,
          selectedColorCode: selectedToolCode,
        );

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (completedOrder.tools.isNotEmpty) ...[
            SizedBox(height: 10),
            CardInfo(
              text: 'Tools',
              primary: true,
            ),
            for (final tool in completedOrder.tools) ...[
              Text(
                tool.name ?? 'null',
                style: TextStyle(
                    color: tool.isAdded
                        ? GKColors.blue
                        : colorCodes[tool.textColorCode]),
              ),
              SizedBox(height: 10),
            ]
          ],
          if (completedOrder.state == RepairWorkState.workInProgress && withButton)
            AddButton(
              text: 'ADD TOOLS',
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => SelectToolsDialog(
                    completedOrder: completedOrder,
                    isSingle: true,
                    selectedToolCode: selectedColorCode,
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}

class PartsList extends DetailsList {
  PartsList(
      {@required RepairWorkModelStore completedOrder,
      bool withButton = true,
      ColorCodes selectedPartCode})
      : super(
          completedOrder: completedOrder,
          withButton: withButton,
          selectedColorCode: selectedPartCode,
        );

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (completedOrder.parts.isNotEmpty) ...[
            CardInfo(
              text: 'Parts',
              primary: true,
            ),
            for (final part in completedOrder.parts) ...[
              Text(
                '${part.name} (${part.quantity} ${part.unit})',
                style: TextStyle(
                  color: part.isAdded
                      ? GKColors.blue
                      : colorCodes[part.textColorCode],
                ),
              ),
              SizedBox(height: 10),
            ]
          ],
          if (completedOrder.state == RepairWorkState.workInProgress && withButton)
            AddButton(
              text: 'ADD PARTS',
              onTap: () => showDialog(
                context: context,
                builder: (_) => SelectPartDialog(
                  completedOrder: completedOrder,
                  isSingle: true,
                  selectedPartCode: selectedColorCode,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
