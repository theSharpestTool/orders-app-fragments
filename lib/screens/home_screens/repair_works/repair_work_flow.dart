import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orders_app/components/buttons/gk_button.dart';
import 'package:orders_app/components/buttons/gk_outline_button.dart';
import 'package:orders_app/components/dialogs/gk_dialog.dart';
import 'package:orders_app/components/gallery_view/gallery_view.dart';
import 'package:orders_app/components/loading_indicator/gk_loader.dart';
import 'package:orders_app/components/text_fields/search_field.dart';
import 'package:orders_app/constants/colors.dart';
import 'package:orders_app/screens/home_screens/orders/select_repairer.dart';
import 'package:orders_app/stores/base_store/base_model_store.dart';
import 'package:orders_app/stores/index.dart';
import 'package:orders_app/stores/order_store/order_model_store.dart';
import 'package:orders_app/stores/task_store/task_model_store.dart';
import 'package:orders_app/stores/repair_work_store/repair_work_model_store.dart';
import 'package:orders_app/style/index.dart';
import 'package:image_picker/image_picker.dart';

class RepairWorkFlow {
  static RepairWorkModelStore completedOrder = RepairWorkModelStore.plain();

  static void start(
      {BuildContext context, OrderModelStore order, TaskModelStore task}) {
    assert(order == null || task == null);
    completedOrder = RepairWorkModelStore.plain();
    completedOrder.order = order;
    completedOrder.task = task;
    showDialog(context: context, builder: (_) => AddRepairerDialog());
  }
}

class AddRepairerDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      shape: Decorations.dialogShape,
      child: Container(
        constraints: BoxConstraints(
          maxHeight: 600,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: GreenHeader(
                leftText: 'ADD REPAIRERS',
                rightText: '1/5',
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: SearchField(
                suggestionsCallback: (pattern) async {
                  Future.delayed(Duration(milliseconds: 1))
                      .then((_) => repairerStore.search(pattern));
                  return null;
                },
              ),
            ),
            Observer(builder: (_) {
              final repairers = repairerStore.searchResults;
              if (repairerStore.loading)
                return Flexible(
                  child: Center(
                    child: GKLoader(),
                  ),
                );
              else
                return Expanded(
                  child: ListView.builder(
                    itemCount: repairers.length,
                    itemBuilder: (context, index) {
                      return RepairerCard(
                        repairer: repairers[index],
                        onSelected: () async {
                          RepairWorkFlow.completedOrder.repairer =
                              repairers[index];
                          Navigator.pop(context);
                          showDialog(
                            context: context,
                            builder: (_) => SelectPartDialog(
                              completedOrder: RepairWorkFlow.completedOrder,
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
            }),
          ],
        ),
      ),
    );
  }
}

class SelectPartDialog extends StatelessWidget {
  final RepairWorkModelStore completedOrder;
  final bool isSingle;
  final ColorCodes selectedPartCode;

  const SelectPartDialog({
    @required this.completedOrder,
    this.isSingle = false,
    this.selectedPartCode = ColorCodes.black,
  });

  @override
  Widget build(BuildContext context) {
    partStore.load();

    return Dialog(
      elevation: 0,
      shape: Decorations.dialogShape,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              GreenHeader(
                leftText: 'SELECT A PART',
                rightText: isSingle ? '' : '2/5',
                previousDialog: isSingle ? null : AddRepairerDialog(),
              ),
              SizedBox(height: 15),
              SearchField(
                suggestionsCallback: (pattern) {
                  partStore.search(pattern);
                  return partStore.searchResults;
                },
                onSuggestionSelected: (selected) {
                  completedOrder.selectPart(
                    selected,
                    colorCodes: selectedPartCode,
                  );
                },
              ),
              SizedBox(height: 15),
              Center(
                child: Observer(
                  builder: (_) {
                    if (completedOrder.parts.isEmpty) {
                      return Text(
                        'No Parts Selected',
                        style: TextStyle(fontSize: 18),
                      );
                    } else {
                      return Wrap(
                        spacing: 10,
                        alignment: WrapAlignment.center,
                        children: completedOrder.parts.map((part) {
                          return Chip(
                            label: Text(part.name),
                            backgroundColor: GKColors.grey,
                            deleteIcon: Icon(Icons.clear),
                            onDeleted: () {
                              completedOrder.unselectPart(part);
                            },
                          );
                        }).toList(),
                      );
                    }
                  },
                ),
              ),
              SizedBox(height: 15),
              Observer(
                builder: (_) => isSingle
                    ? DoneButton(
                        onTap: () {
                          if (completedOrder.hasParts)
                            showDialog(
                              context: context,
                              builder: (_) => SetPartQuantityDialog(
                                completedOrder: completedOrder,
                                isSingle: true,
                                selectedPartCode: selectedPartCode,
                              ),
                            );
                        },
                      )
                    : NextSkipButtons(
                        nextDialog: completedOrder.hasParts
                            ? SetPartQuantityDialog(
                                completedOrder: completedOrder,
                              )
                            : SelectToolsDialog(
                                completedOrder: completedOrder,
                              ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SetPartQuantityDialog extends StatelessWidget {
  final RepairWorkModelStore completedOrder;
  final bool isSingle;
  final ColorCodes selectedPartCode;

  const SetPartQuantityDialog({
    @required this.completedOrder,
    this.isSingle = false,
    this.selectedPartCode = ColorCodes.black,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Dialog(
        elevation: 0,
        shape: Decorations.dialogShape,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              GreenHeader(
                leftText: 'SET PART QUANTITY',
                rightText: '',
                previousDialog: isSingle
                    ? null
                    : SelectPartDialog(
                        completedOrder: completedOrder,
                        isSingle: isSingle,
                        selectedPartCode: selectedPartCode,
                      ),
              ),
              SizedBox(height: 15),
              for (final part in completedOrder.parts)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: 150,
                        ),
                        child: Text(part.name),
                      ),
                      SizedBox(
                        width: 80,
                        height: 40,
                        child: TextFormField(
                          onChanged: part.setQuantity,
                          keyboardType: TextInputType.number,
                          initialValue: part.quantity.toString(),
                          decoration: Decorations.inputDecoraion
                              .copyWith(suffixText: part.unit),
                        ),
                      ),
                    ],
                  ),
                ),
              SizedBox(height: 20),
              isSingle
                  ? DoneButton()
                  : NextSkipButtons(
                      nextDialog: SelectToolsDialog(
                        completedOrder: completedOrder,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectToolsDialog extends StatelessWidget {
  final RepairWorkModelStore completedOrder;
  final bool isSingle;
  final ColorCodes selectedToolCode;

  const SelectToolsDialog({
    @required this.completedOrder,
    this.isSingle = false,
    this.selectedToolCode = ColorCodes.black,
  });

  @override
  Widget build(BuildContext context) {
    toolStore.load();

    return Dialog(
      elevation: 0,
      shape: Decorations.dialogShape,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            GreenHeader(
              leftText: 'SELECT TOOLS',
              rightText: '3/5',
              previousDialog: SelectPartDialog(
                completedOrder: completedOrder,
              ),
            ),
            SizedBox(height: 15),
            SearchField(
              suggestionsCallback: (pattern) {
                toolStore.search(pattern);
                return toolStore.searchResults;
              },
              onSuggestionSelected: (selected) {
                completedOrder.selectTool(
                  selected,
                  colorCodes: selectedToolCode,
                );
              },
            ),
            SizedBox(height: 15),
            Center(
              child: Observer(
                builder: (_) {
                  if (completedOrder.tools.isEmpty) {
                    return Text(
                      'No Tools Selected',
                      style: TextStyle(fontSize: 18),
                    );
                  } else {
                    return Wrap(
                      spacing: 10,
                      alignment: WrapAlignment.center,
                      children: completedOrder.tools.map((tool) {
                        return Chip(
                          label: Text(tool.name),
                          backgroundColor: GKColors.grey,
                          deleteIcon: Icon(Icons.clear),
                          onDeleted: () {
                            completedOrder.unselectTool(tool);
                          },
                        );
                      }).toList(),
                    );
                  }
                },
              ),
            ),
            SizedBox(height: 15),
            isSingle
                ? DoneButton()
                : NextSkipButtons(
                    nextDialog: AddExpensesDialog(
                      completedOrder: completedOrder,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class AddExpensesDialog extends StatelessWidget {
  final RepairWorkModelStore completedOrder;
  final bool isSingle;
  final TextEditingController _descriptionController;
  final TextEditingController _priceController;
  final ColorCodes selectedExpenseCode;

  AddExpensesDialog({
    @required this.completedOrder,
    this.isSingle = false,
    this.selectedExpenseCode = ColorCodes.black,
  })  : _descriptionController =
            TextEditingController(text: completedOrder.currentCost.description),
        _priceController = TextEditingController(
            text: completedOrder.currentCost.amount?.toString() ?? '');

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Dialog(
        elevation: 0,
        shape: Decorations.dialogShape,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22),
            child: Observer(
              builder: (_) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(height: 5),
                    GreenHeader(
                      leftText: 'ADD EXPENSES',
                      rightText: isSingle ? '' : '4/5',
                      previousDialog: isSingle
                          ? null
                          : SelectToolsDialog(
                              completedOrder: completedOrder,
                            ),
                    ),
                    BlueHeader(text: 'Write Expenses'),
                    TextField(
                      controller: _descriptionController,
                      onChanged: completedOrder.writeCostDescription,
                      maxLines: 4,
                      decoration: InputDecoration(
                        hintText: 'Write Something',
                        contentPadding: EdgeInsets.all(10),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                        ),
                      ),
                    ),
                    BlueHeader(text: 'Add Price'),
                    TextField(
                      controller: _priceController,
                      onChanged: completedOrder.writeCostPrice,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Medium Input',
                        contentPadding: EdgeInsets.all(10),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Input caption message.'),
                    SizedBox(height: 5),
                    BlueHeader(text: 'Upload Quitation File'),
                    GestureDetector(
                      onTap: () async {
                        FocusScope.of(context).unfocus();
                        ImageSource source;
                        await showDialog(
                          context: context,
                          builder: (context) => CupertinoAlertDialog(
                            title: Text('Select source'),
                            actions: <Widget>[
                              CupertinoDialogAction(
                                child: Text("Camera"),
                                onPressed: () {
                                  source = ImageSource.camera;
                                  Navigator.pop(context);
                                },
                              ),
                              CupertinoDialogAction(
                                child: Text("Gallery"),
                                onPressed: () {
                                  source = ImageSource.gallery;
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        );
                        if (source == null) return;
                        final image = await ImagePicker.pickImage(
                          source: source,
                          maxWidth: 800,
                          maxHeight: 800,
                        );
                        if (image == null) return;
                        completedOrder.addCostFile(image);
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.black12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: SvgPicture.asset(
                                'svgs/upload.svg',
                                width: 15,
                              ),
                            ),
                            Text('Upload'),
                            SizedBox(width: 30),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    if (completedOrder.currentCost != null &&
                        completedOrder.currentCost.userFiles.isNotEmpty)
                      GalleryViewMemory(
                        images: completedOrder.currentCost.userFiles,
                      ),
                    if (completedOrder.currentCost != null &&
                        completedOrder.currentCost.files.isNotEmpty)
                      GalleryViewNetwork(
                        images: completedOrder.currentCost.filesGallery,
                      ),
                    SizedBox(height: 10),
                    if (!isSingle) ...[
                      Container(
                        width: double.infinity,
                        height: 40,
                        child: GKOutlineButton(
                          onPressed: completedOrder.currentCost.isValid
                              ? () {
                                  completedOrder.addCost();
                                }
                              : null,
                          text: 'ADD ANOTHER EXPENSE',
                        ),
                      ),
                      SizedBox(height: 40),
                    ],
                    isSingle
                        ? DoneButton(
                            enabled: completedOrder.currentCost.isValid,
                            onTap: () => completedOrder.addCost(
                                colorCode: selectedExpenseCode),
                          )
                        : NextSkipButtons(
                            nextDialog: AddInstructionDialog(),
                          ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class AddInstructionDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final completedOrder = RepairWorkFlow.completedOrder;
    return Dialog(
      elevation: 0,
      shape: Decorations.dialogShape,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: 5),
            GreenHeader(
              leftText: 'ADD INSTRUCTIONS',
              rightText: '5/5',
              previousDialog: AddExpensesDialog(
                completedOrder: completedOrder,
              ),
            ),
            BlueHeader(text: 'Write Instructions For Repairer'),
            TextField(
              onChanged: (value) => completedOrder.instructions = value,
              maxLines: 8,
              decoration: InputDecoration(
                hintText: 'Write Something',
                contentPadding: EdgeInsets.all(10),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black12),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: Observer(
                builder: (_) => GKButton(
                  loading: completedOrder.loading,
                  text: 'SUBMIT',
                  onTap: () async {
                    try {
                      completedOrder.addCost();
                      if (completedOrder.order != null)
                        await completedOrder.createByOrder();
                      else if (completedOrder.task != null)
                        await completedOrder.createByTask();
                      else
                        throw Exception('Order and task are null');
                      Navigator.pop(context);
                      await GKDialog.show(
                        context: context,
                        reason: DialogReason.success,
                        text: 'You successfully create an Repair Work',
                      );
                      if (completedOrder.order != null)
                        await completedOrderStore.goToRepairWork(
                          order: completedOrder.order,
                        );
                      else if (completedOrder.task != null)
                        await completedOrderStore.goToRepairWork(
                          task: completedOrder.task,
                        );
                    } catch (e) {
                      GKDialog.show(
                        context: context,
                        reason: DialogReason.error,
                        text: 'Something went wrong',
                      );
                    }
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class DoneButton extends StatelessWidget {
  final Function onTap;
  final bool enabled;

  const DoneButton({this.onTap, this.enabled = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 20),
      child: GKButton(
        text: 'DONE',
        onTap: enabled
            ? () {
                Navigator.pop(context);
                if (onTap != null) onTap();
              }
            : null,
      ),
    );
  }
}

class GreenHeader extends StatelessWidget {
  final String rightText;
  final String leftText;
  final Widget previousDialog;

  const GreenHeader({
    @required this.rightText,
    @required this.leftText,
    this.previousDialog,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 13,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          previousDialog != null
              ? InkWell(
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: GKColors.green,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    if (previousDialog != null) {
                      showDialog(
                          context: context, builder: (_) => previousDialog);
                    }
                  },
                )
              : Text(''),
          Text(
            leftText,
            style: TextStyle(
                color: GKColors.green,
                fontWeight: FontWeight.bold,
                fontSize: 17),
          ),
          Text(
            rightText,
            style: TextStyle(
              color: GKColors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class NextSkipButtons extends StatelessWidget {
  final Widget nextDialog;

  NextSkipButtons({this.nextDialog});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          child: GKButton(
            text: 'NEXT',
            onTap: () async {
              Navigator.pop(context);
              if (nextDialog != null)
                showDialog(context: context, builder: (_) => nextDialog);
            },
          ),
        ),
        SizedBox(height: 20),
        Container(
          height: 45,
          width: double.infinity,
          child: GKOutlineButton(
            text: 'SKIP',
            onPressed: () {
              Navigator.pop(context);
              if (nextDialog != null)
                showDialog(context: context, builder: (_) => nextDialog);
            },
          ),
        ),
        SizedBox(height: 23),
      ],
    );
  }
}

class BlueHeader extends StatelessWidget {
  final String text;

  const BlueHeader({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Text(
        text,
        style: TextStyle(
          color: GKColors.blue,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
