import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:orders_app/components/card_info/card_info.dart';
import 'package:orders_app/constants/colors.dart';
import 'package:orders_app/icons/orders_app_icons_icons.dart';
import 'package:orders_app/screens/home_screens/profile/address_additor.dart';
import 'package:orders_app/screens/home_screens/profile/password_edditor.dart';
import 'package:orders_app/screens/home_screens/subscriptions/subscription.dart';
import 'package:orders_app/stores/index.dart';
import 'package:orders_app/stores/user_store/user_store.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void showAddressModal(BuildContext context) {
    showModalBottomSheet(context: context, builder: (_) => AddressAdditor());
  }

  void showPasswordModal(BuildContext context) {
    showDialog(context: context, builder: (_) => PasswordAdditor());
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(15),
      child: Container(
        child: Observer(
            builder: (_) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SectionTitle(
                      text: "Contact Information",
                    ),
                    CardInfo(
                      icon: OrdersAppIcons.profile,
                      text: "${userStore.name}",
                      options: <Widget>[
                        if (userStore.role == Role.repairer) ...[
                          Icon(OrdersAppIcons.star),
                          // Container(
                          //   margin: EdgeInsets.only(left: 5),
                          //   child: Text(
                          //     "4.5/5",
                          //     style: TextStyle(
                          //         color: GKColors.green,
                          //         fontWeight: FontWeight.bold),
                          //   ),
                          // ),
                        ]
                      ],
                    ),
                    CardInfo(
                      icon: OrdersAppIcons.phone,
                      text: userStore.phoneNumber,
                      options: <Widget>[
                        GestureDetector(
                          child: Text(
                            "EDIT",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).disabledColor,
                            ),
                          ),
                        )
                      ],
                    ),
                    Observer(
                      builder: (_) => CardInfo(
                        icon: 'svgs/email.svg',
                        text: userStore.email ?? "no email",
                        options: <Widget>[
                          GestureDetector(
                            child: Text(
                              "EDIT",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).disabledColor,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Splitter(),
                    SectionTitle(text: "Password"),
                    CardInfo(
                      icon: OrdersAppIcons.password,
                      text: "* * * * * * * * *",
                      options: <Widget>[
                        OutlineButton(
                          onPressed: null,
                          //onPressed: () => showPasswordModal(context),
                          child: Text("CHANGE PASSWORD"),
                          textColor: GKColors.green,
                          highlightedBorderColor: GKColors.green,
                        ),
                      ],
                    ),
                    SectionTitle(text: "Settings"),
                    CardInfo(
                      icon: 'svgs/sounds.svg',
                      text: "Notification Sound",
                      options: <Widget>[
                        CupertinoSwitch(
                          value: true,
                          onChanged: (bool value) {},
                          activeColor: GKColors.green,
                        )
                      ],
                    ),
                    CardInfo(
                      icon: OrdersAppIcons.bell,
                      text: "Push Notifications",
                      options: <Widget>[
                        CupertinoSwitch(
                          value: false,
                          onChanged: (bool value) {},
                          activeColor: GKColors.green,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        OutlineButton(
                          child: Text("Log Out"),
                          onPressed: authStore.logout,
                          textColor: GKColors.green,
                          highlightedBorderColor: GKColors.green,
                        ),
                      ],
                    ),
                  ],
                )),
      ),
    );
  }
}
