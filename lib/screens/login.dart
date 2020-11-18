import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:orders_app/constants/colors.dart';
import 'package:orders_app/stores/index.dart';

class LoginScreen extends StatelessWidget {
  static String name = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              child: Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [GKColors.green, GKColors.blue]),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.elliptical(100.0, 50.0),
                        bottomRight: Radius.elliptical(100.0, 50.0),
                      ),
                    ),
                  ),
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        color: Colors.white,
                        child: Image.asset(
                          'assets/logo/logo_big.png',
                          height: 150,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String _username =
      ''; // AdetoroAbdulahiAdewale@ordersapp.com  manager@demo.com
  String _password = ''; //gkfm_tech manager@demo
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3 * 2,
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(children: [
              LoginInput(
                  initialValue: _username,
                  icon: Icons.account_circle,
                  hint: "Email Address",
                  marginBottom: 25,
                  onChanged: (v) => _username = v),
              Column(children: [
                LoginInput(
                  initialValue: _password,
                  icon: Icons.lock,
                  hint: "Password",
                  isPassword: true,
                  onChanged: (v) => _password = v,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16, right: 32),
                    child: Text(
                      'Forgot Password ?',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ]),
            ]),
          ),
          GestureDetector(
            onTap: () async {
              if (_formKey.currentState.validate())
                authStore.login(username: _username, password: _password);
            },
            child: Container(
              height: 45,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        GKColors.darkBlue,
                        GKColors.blue,
                      ])),
              child: Center(
                child: Observer(
                  builder: (BuildContext context) {
                    return !authStore.loading
                        ? Text(
                            "LOGIN",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : CircularProgressIndicator(
                            backgroundColor: GKColors.darkBlue);
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class LoginInput extends StatelessWidget {
  final String hint;
  final icon;
  final bool isPassword;
  final String initialValue;

  final double marginBottom;
  final Function onChanged;

  LoginInput({
    this.icon,
    this.hint,
    this.isPassword = false,
    this.marginBottom = 0,
    this.onChanged,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: this.marginBottom),
      child: TextFormField(
        initialValue: initialValue,
        validator: (value) {
          return value.isEmpty ? 'Should not be empty' : null;
        },
        onChanged: onChanged,
        style: TextStyle(color: Colors.blue),
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(
            icon,
            color: Colors.blue,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: Colors.black45,
              width: 0.3,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: Colors.black45,
              width: 0.3,
            ),
          ),
          focusColor: Colors.orange,
        ),
      ),
    );
  }
}
