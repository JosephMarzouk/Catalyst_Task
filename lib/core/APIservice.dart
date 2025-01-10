import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://test.catalystegy.com/api/';
  final Dio _dio;
  ApiService(this._dio);

  Future<List<dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint');

    return response.data;
  }

  Future<Map<String, dynamic>> post(
      {required String endPoint, required Map<String, dynamic> body}) async {
    var response = await _dio.post('$_baseUrl$endPoint', data: body);

    return response.data;
  }

  Future<List<dynamic>> put(
      {required String endPoint, required Map<String, dynamic> body}) async {
    var response = await _dio.put('$_baseUrl$endPoint');

    return response.data;
  }

  Future<List<dynamic>> delete({required String endPoint,required String id}) async {
    var response = await _dio.delete('$_baseUrl$endPoint/$id');

    return response.data;
  }
}
