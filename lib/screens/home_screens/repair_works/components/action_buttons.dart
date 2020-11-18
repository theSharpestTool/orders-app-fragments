import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:orders_app/components/buttons/gk_outline_button.dart';
import 'package:orders_app/components/dialogs/gk_dialog.dart';
import 'package:orders_app/constants/colors.dart';
import 'package:orders_app/stores/index.dart';
import 'package:orders_app/stores/user_store/user_store.dart';
import 'package:orders_app/stores/repair_work_store/repair_work_model_store.dart';

class OrderApprovalButton extends StatelessWidget {
  const OrderApprovalButton({
    @required this.completedOrder,
  });

  final RepairWorkModelStore completedOrder;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => RepairWorkActionButton(
        questionText:
            'Are you sure you want to set this Repair Work as awaiting client approval?',
        afterDoneText: 'Approval Ordered',
        action: completedOrder.orderApproval,
        buttonText: 'ORDER APPROVAL',
        disabled: !completedOrder.approvalNeeded,
      ),
    );
  }
}

class WorkInProgressButton extends StatelessWidget {
  final RepairWorkModelStore completedOrder;

  const WorkInProgressButton({Key key, this.completedOrder}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RepairWorkActionButton(
      questionText:
          'Are you sure you want to set this Repair Work as work in progress? ',
      afterDoneText: 'Work is in progress',
      action: completedOrder.workInProgress,
      buttonText: 'WORK IN PROGRESS',
    );
  }
}

class MarkOrderAsCompletedButton extends StatelessWidget {
  final RepairWorkModelStore completedOrder;

  const MarkOrderAsCompletedButton({Key key, this.completedOrder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepairWorkActionButton(
      questionText: completedOrder.state == RepairWorkState.workInProgress
          ? 'Are you sure you want to mark this order as completed? Repairer is working on it.'
          : 'Are you sure you want to mark this order as completed?',
      afterDoneText: 'Order is completed',
      action: completedOrder.markOrderAsCompleted,
      buttonText: 'WORK IS COMPLETED',
      color: completedOrder.state == RepairWorkState.workInProgress
          ? GKColors.yellow
          : GKColors.green,
    );
  }
}

class CompleteRepairWorkButton extends StatelessWidget {
  final RepairWorkModelStore completedOrder;

  const CompleteRepairWorkButton({Key key, this.completedOrder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => RepairWorkActionButton(
        questionText:
            'Are you sure you want to set this Repair Work as completed? ',
        afterDoneText: 'Work is competed',
        action: completedOrder.workCompleted,
        buttonText: 'WORK IS COMPLETED',
        disabled:
            completedOrder.userImages.isEmpty && userStore.role == Role.repairer,
      ),
    );
  }
}

class RepairWorkActionButton extends StatelessWidget {
  final String buttonText;
  final String questionText;
  final String afterDoneText;
  final bool disabled;
  final Future<void> Function() action;
  final Color color;

  const RepairWorkActionButton({
    Key key,
    @required this.questionText,
    @required this.afterDoneText,
    @required this.action,
    @required this.buttonText,
    this.disabled = false,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonContainer(
      child: GKOutlineButton(
        color: color,
        onPressed: disabled
            ? null
            : () {
                GKQuestionDialog.show(
                    context: context,
                    questionColor: QuestionColor.green,
                    text: questionText,
                    onConfirm: () async {
                      Navigator.pop(context);
                      try {
                        await action();
                        await GKDialog.show(
                          context: context,
                          reason: DialogReason.success,
                          text: afterDoneText,
                        );
                      } catch (e) {
                        GKDialog.showHttpError(
                          context: context,
                          error: e,
                        );
                      }
                    });
              },
        text: buttonText,
      ),
    );
  }
}

class ButtonContainer extends StatelessWidget {
  final Widget child;

  ButtonContainer({this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45,
      margin: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 7,
      ),
      child: child,
    );
  }
}
