import 'package:dio/dio.dart';

class ApiServise {
  final Dio _dio;
  final String _baseUrl =
      'https://api3.islamhouse.com/v3/paV29H2gm56kvLPy/main/';

  ApiServise(this._dio);

  Future<dynamic> getData({required String endPoint}) async {
    Response response = await _dio.get("$_baseUrl$endPoint");
 
    return response.data;
  }
}
