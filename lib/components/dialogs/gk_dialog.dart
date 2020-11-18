import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orders_app/components/buttons/gk_button.dart';
import 'package:orders_app/components/buttons/gk_outline_button.dart';
import 'package:orders_app/constants/colors.dart';
import 'package:orders_app/stores/index.dart';
import 'package:orders_app/style/dimensions.dart';

enum DialogReason { success, error }
enum QuestionColor { green, red }

class GKDialog extends StatelessWidget {
  final DialogReason reason;
  final String text;
  final String buttonText;
  final Function onTap;

  const GKDialog(
      {this.reason = DialogReason.success,
      this.text = '',
      this.buttonText = 'OK',
      this.onTap});

  static Future show({
    BuildContext context,
    DialogReason reason,
    String text,
    String buttonText = 'OK',
    Function onTap,
  }) {
    return showDialog(
      context: context ?? navStore.overlayContext,
      builder: (_) => GKDialog(
        reason: reason,
        text: text,
        buttonText: buttonText,
        onTap: onTap,
      ),
    );
  }

  static Future showHttpError({BuildContext context, dynamic error}) {
    return showDialog(
      context: context ?? navStore.overlayContext,
      builder: (_) => GKDialog(
        reason: DialogReason.error,
        text: error is DioError
            ? error.response == null || error.response.data.isEmpty
                ? error.message.contains('Failed host lookup')
                    ? 'Bad internet connection'
                    : error.message
                : error.response.data
            : 'Error: $error',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: Decorations.dialogShape,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 25,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SvgPicture.asset(reason == DialogReason.error
                ? 'svgs/dialog_error.svg'
                : 'svgs/dialog_success.svg'),
            SizedBox(height: 10),
            Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: EdgeDim.containerPad,
              child: GKButton(
                text: buttonText,
                onTap: () {
                  Navigator.of(context).pop();
                  if (onTap != null) onTap();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GKQuestionDialog extends StatelessWidget {
  final QuestionColor questionColor;
  final String text;
  final Function onConfirm;

  GKQuestionDialog({
    @required this.questionColor,
    @required this.text,
    @required this.onConfirm,
  });

  static Future show({
    @required BuildContext context,
    @required QuestionColor questionColor,
    @required String text,
    @required Function onConfirm,
  }) {
    return showDialog(
      context: context,
      builder: (_) => GKQuestionDialog(
        questionColor: questionColor,
        text: text,
        onConfirm: onConfirm,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: Decorations.dialogShape,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 25,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SvgPicture.asset(questionColor == QuestionColor.red
                ? 'svgs/question_dialog_red.svg'
                : 'svgs/question_dialog_green.svg'),
            SizedBox(height: 10),
            Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 45,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Flexible(
                    child: Container(
                        width: double.infinity,
                        height: 44,
                        child: GKOutlineButton(
                          onPressed: () => Navigator.pop(context),
                          text: 'CANCEL',
                          color: Colors.black,
                        )),
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: RaisedButton(
                        focusElevation: 0,
                        hoverElevation: 0,
                        highlightElevation: 0,
                        elevation: 0,
                        textColor: Colors.white,
                        onPressed: () {
                          onConfirm();
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: questionColor == QuestionColor.green
                            ? GKColors.green
                            : Colors.red,
                        child: Text(
                          'YES',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
