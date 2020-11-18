import 'dart:io';
import 'package:dio/dio.dart';
import 'package:orders_app/interceptors/log_interceptor.dart';

BaseOptions _options = BaseOptions(
  baseUrl: '',
  connectTimeout: 50000,
  receiveTimeout: 300000,
  headers: {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json'
  },
);

Dio api = Dio(_options);
void initApi() {
   api.interceptors.add(LoggingInterceptors());
}
