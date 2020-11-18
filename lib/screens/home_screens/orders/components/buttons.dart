import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:orders_app/components/buttons/gk_outline_button.dart';
import 'package:orders_app/components/dialogs/gk_dialog.dart';
import 'package:orders_app/constants/colors.dart';
import 'package:orders_app/screens/home.dart';
import 'package:orders_app/screens/home_screens/repair_works/repair_work_flow.dart';
import 'package:orders_app/stores/order_store/order_model_store.dart';

class PrintExcelButton extends StatelessWidget {
  const PrintExcelButton({
    Key key,
    @required this.order,
  }) : super(key: key);

  final OrderModelStore order;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Container(
        width: double.infinity,
        height: 45,
        margin: EdgeInsets.symmetric(
          vertical: 7.0,
          horizontal: 15.0,
        ),
        child: GKOutlineButton(
          onPressed: order.printExcel,
          loading: order.loadingExcel,
          text: 'PRINT EXCEL REPORT',
        ),
      ),
    );
  }
}

class PrintPdfButton extends StatelessWidget {
  const PrintPdfButton({
    Key key,
    @required this.order,
  }) : super(key: key);

  final OrderModelStore order;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Container(
        width: double.infinity,
        height: 45,
        margin: EdgeInsets.symmetric(
          vertical: 7.0,
          horizontal: 15.0,
        ),
        child: GKOutlineButton(
          onPressed: order.printPDF,
          loading: order.loadingPDF,
          text: 'PRINT PDF REPORT',
        ),
      ),
    );
  }
}

class ApprovalOrderOptions extends StatelessWidget {
  const ApprovalOrderOptions({
    @required this.order,
  });

  final OrderModelStore order;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: 45,
            child: GKOutlineButton(
              onPressed: () {
                GKQuestionDialog.show(
                  context: context,
                  questionColor: QuestionColor.green,
                  text: 'Are you sure you want to accept this quotation?',
                  onConfirm: () async {
                    await order.approveQuotation();
                    Navigator.popUntil(
                        context, ModalRoute.withName(HomeScreen.name));
                  },
                );
              },
              text: 'APPROVE QUOTATION',
            ),
          ),
          SizedBox(height: 15),
          Container(
            height: 45,
            child: GKOutlineButton(
              color: GKColors.darkGrey,
              onPressed: () {
                GKQuestionDialog.show(
                  context: context,
                  questionColor: QuestionColor.red,
                  text: 'Are you sure you want to reject this quotation?',
                  onConfirm: () async {
                    await order.rejectQuotation();
                    Navigator.popUntil(
                        context, ModalRoute.withName(HomeScreen.name));
                  },
                );
              },
              text: 'REJECT QUOTATION',
            ),
          ),
        ],
      ),
    );
  }
}

class CreateRepairWorkButton extends StatelessWidget {
  const CreateRepairWorkButton({
    Key key,
    @required this.order,
  }) : super(key: key);

  final OrderModelStore order;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45,
      margin: EdgeInsets.all(15.0),
      child: GKOutlineButton(
        onPressed: () async {
          RepairWorkFlow.start(
            context: context,
            order: order,
          );
        },
        text: 'CREATE REPAIR WORK',
      ),
    );
  }
}

class PendingOrderOptions extends StatelessWidget {
  const PendingOrderOptions({
    Key key,
    @required this.order,
  }) : super(key: key);

  final OrderModelStore order;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: 45,
            child: GKOutlineButton(
              onPressed: () {
                GKQuestionDialog.show(
                  context: context,
                  questionColor: QuestionColor.green,
                  text: 'Are you sure you want to accept this order?',
                  onConfirm: () {
                    order.confirm();
                    Navigator.popUntil(
                        context, ModalRoute.withName(HomeScreen.name));
                  },
                );
              },
              text: 'CONFIRM ORDER',
            ),
          ),
          SizedBox(height: 15),
          Container(
            height: 45,
            child: GKOutlineButton(
              color: GKColors.darkGrey,
              onPressed: () {
                GKQuestionDialog.show(
                  context: context,
                  questionColor: QuestionColor.red,
                  text: 'Are you sure you want to decline this order?',
                  onConfirm: () async {
                    await order.decline();
                    Navigator.popUntil(
                        context, ModalRoute.withName(HomeScreen.name));
                  },
                );
              },
              text: 'DECLINE ORDER',
            ),
          ),
        ],
      ),
    );
  }
}
