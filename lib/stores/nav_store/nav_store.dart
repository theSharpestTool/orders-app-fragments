import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'nav_store.g.dart';

class NavStore = _NavStore with _$NavStore;

abstract class _NavStore with Store {
  final GlobalKey<NavigatorState> navKey;
  _NavStore({this.navKey});

  NavigatorState get navigator => navKey.currentState;

  BuildContext get overlayContext => navigator.overlay.context;
}
