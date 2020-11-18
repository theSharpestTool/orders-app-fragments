import 'package:dio/dio.dart';
import 'package:orders_app/config/api.dart';

abstract class BaseService {
  String entity;

  Future<Response<dynamic>> getObject(int id) {
    return api.get('$entity/$id');
  }

  Future<Response<dynamic>> getList({Map<String, dynamic> params}) {
    return api.get('$entity',
        queryParameters:
            params);
  }

  Future<Response<dynamic>> post(Map<String, dynamic> params) {
    return api.post('$entity', queryParameters: params);
  }

  Future<Response<dynamic>> delete(int id) => api.delete('$entity/$id');

  Future<Response<dynamic>> update(int id, {Map<String, dynamic> params}) {
    return api.put('$entity/$id', queryParameters: params);
  }
}

class Service with BaseService{
  Service({String entity}){
    super.entity = entity;
  }
}