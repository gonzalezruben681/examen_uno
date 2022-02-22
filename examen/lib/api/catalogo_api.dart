import 'dart:convert';

import 'package:dio/dio.dart';

class CatalogoApi{
   static final Dio _dio = Dio();
  static Future post(String path, Map<String, dynamic> data) async {
    _dio.options.baseUrl = "https://apitestcotizamatico.azurewebsites.net/api";

    try {
      final resp = await _dio.post(path, data: json.encode(data));
      return resp.data['CatalogoJsonString'];
    } catch (e) {
      print(e);
      throw ('Error en el post');
    }
  }
}