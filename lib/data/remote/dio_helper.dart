// ignore_for_file: avoid_print

// import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
// import 'package:magdsoft_flutter_structure/data/models/account_model.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/login_response.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseURL,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData(
      {required String url, required Map<String, dynamic> query}) async {
    return await dio!.get(url, queryParameters: query);
  }

  static Future<dynamic> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> body,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
    };

    Response jsonResponse = await dio!.post(url, data: body);
    MyResponse response = MyResponse.fromJson(jsonResponse.data);
    return response;
    ////////////************************************** */
    // option 2
    // Accounts response = Accounts.fromJson(jsonResponse.data);
    // if (response.status == 200) {
    //   Person person = Person.fromJson(response.persons![0]);
    //   return person;
    // } else {
    //   // ApiResponse response = ApiResponse.fromjson(jsonResponse.data);
    //   return response.message;
    // }
  }
  // static Future<Response> postData({
  //   required String url,
  //   Map<String, dynamic>? query,
  //   required Map<String, String> body,
  // }) async {
  //   dio!.options.headers = {
  //     'Content-Type': 'application/json',
  //   };
  //   var data = await dio!.post(url, data: body);
  //   return data;
  // }
}
