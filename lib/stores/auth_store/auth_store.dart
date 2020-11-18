import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:orders_app/config/api.dart';
import 'package:orders_app/screens/home.dart';
import 'package:orders_app/screens/login.dart';
import 'package:orders_app/services/push_notification_service.dart';
import 'package:orders_app/stores/index.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  @observable
  String token;

  @observable
  String role;

  @observable
  bool loading = false;

  @computed
  bool get authorised => token != null;

  @action
  Future<Response> changePassword({String oldPassword, String password}) async {
    loading = true;
    try {
      final response =
          await api.get('/api/Account/ChangePassword', queryParameters: {
        'email': userStore.email,
        'oldPassword': oldPassword,
        'password': password,
      });
      loading = false;
      return response;
    } catch (e) {
      loading = false;
      throw e;
    }
  }

  @action
  Future login({String username, String password}) async {
    loading = true;
    try {
      final response = await api.post('/api/Token',
          data: <String, dynamic>{'userName': username, 'password': password});
      if (response.statusCode == 200) {
        token = response.data;
        await FlutterSecureStorage().write(key: 'token', value: token);
        await FlutterSecureStorage().write(key: 'email', value: username);
        setAuthorizationHeader();
        await userStore.load();
      }
    } catch (e) {
      print('error');
    }
    loading = false;
    if (token != null) navStore.navigator.pushReplacementNamed(HomeScreen.name);
  }

  @action
  Future<void> logout() async {
    authStore.token = null;
    orderStore.clear();
    completedOrderStore.clear();
    siteStore.clear();
    PushNotificationsService.unsubscribeFromAll();
    await FlutterSecureStorage().delete(key: 'token');
    screenStore.setScreenByIndex(0);
    navStore.navigator.pushReplacementNamed(LoginScreen.name);
  }

  void setAuthorizationHeader() async {
    if (token != null)
      api.options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
  }
}
