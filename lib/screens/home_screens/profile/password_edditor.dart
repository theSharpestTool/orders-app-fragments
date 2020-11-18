import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:orders_app/components/buttons/gk_button.dart';
import 'package:orders_app/components/dialogs/gk_dialog.dart';
import 'package:orders_app/components/form/index.dart';
import 'package:orders_app/constants/colors.dart';
import 'package:orders_app/stores/index.dart';
import 'package:orders_app/style/index.dart';

class PasswordAdditor extends StatefulWidget {
  @override
  _PasswordAdditorState createState() => _PasswordAdditorState();
}

class _PasswordAdditorState extends State<PasswordAdditor> {
  final currentPasswordControler = TextEditingController();
  final newPasswordController = TextEditingController();
  final newPasswordCopyController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Dialog(
        shape: Decorations.dialogShape,
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  InputLabel(
                    "Change Password",
                    textColor: GKColors.green,
                  ),
                  SizedBox(height: 25),
                  InputLabel("Enter Current Password"),
                  TextField(
                    obscureText: true,
                    controller: currentPasswordControler,
                    decoration: Decorations.inputDecoraion
                        .copyWith(hintText: 'Enter your current password'),
                  ),
                  SizedBox(height: 20.0),
                  InputLabel("Enter New Password"),
                  TextFormField(
                    obscureText: true,
                    validator: (value) {
                      if (value.isEmpty) return 'Password should not be empty';
                      if (value != newPasswordCopyController.text)
                        return 'Passwords do not match';
                      return null;
                    },
                    controller: newPasswordController,
                    decoration: Decorations.inputDecoraion
                        .copyWith(hintText: 'Enter your new password'),
                  ),
                  SizedBox(height: 20.0),
                  InputLabel("Re Enter Password"),
                  TextFormField(
                    obscureText: true,
                    validator: (value) {
                      if (value.isEmpty) return 'Password should not be empty';
                      if (value != newPasswordController.text)
                        return 'Passwords do not match';
                      return null;
                    },
                    controller: newPasswordCopyController,
                    decoration: Decorations.inputDecoraion
                        .copyWith(hintText: 'Re enter your new password'),
                  ),
                  SizedBox(height: 20),
                  GKButton(
                    loading: authStore.loading,
                    text: 'ORDER APPROVAL',
                    onTap: () async {
                      if (!_formKey.currentState.validate()) return;
                      try {
                        final repsponse = await authStore.changePassword(
                          oldPassword: currentPasswordControler.text,
                          password: newPasswordController.text,
                        );
                        Navigator.pop(context);
                        if (repsponse != null)
                          GKDialog.show(
                            context: context,
                            reason: DialogReason.success,
                            text: 'Password was changed',
                          );
                      } catch (e) {
                        final DioError dioError = e;
                        GKDialog.show(
                          context: context,
                          reason: DialogReason.error,
                          text: dioError.response.data,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
