import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:medical_test/app/services/api/api_services.dart';
import 'package:medical_test/app/services/api/end_points.dart';
import 'package:medical_test/app/services/local_storage/cache_service_getstorage.dart';
import '../../core/errors/expentions.dart';
import 'package:get/get.dart' as getx;

class DioConsumer implements ApiServices {
  final Dio dio = Dio();
  CacheServiceGetStorage cacheService = getx.Get.find<CacheServiceGetStorage>();
  DioConsumer();

  Future<dynamic> request({
    required String url,
    required Method method,
    required bool requiredToken,
    Map<String, dynamic>? queryParameters,
    bool uploadImage = false,
    //Map<String, dynamic>? params,
    Object? params,
  }) async {
    Response response;

    Map<String, dynamic> headers = {};

    headers.addAll({
      'Content-Type': 'application/json',
      "Accept": "application/json",
    });

    if (requiredToken) {
      String? token = await cacheService.getUserToken();
      debugPrint("token => $token");

      headers.addAll({
        "Authorization": "Bearer $token",
      });
    }

    if (uploadImage) {
      headers['Accept'] = 'text/plain';
      headers['Content-Type'] = 'multipart/form-data';
      /*headers = {
        'Content-Type': 'multipart/form-data',
        "Authorization": "Bearer ${await sessionService.getUserToken()}",
      };*/
    }

    Options options = Options(
      headers: headers,
    );

    /*try {*/
    if (method == Method.post) {
      response = await dio.post(
        EndPoints.baserUrl + url,
        data: params,
        options: options,
      );
    } else if (method == Method.delete) {
      response = await dio.delete(
        url,
        options: options,
        data: params,
      );
    } else if (method == Method.patch) {
      response = await dio.patch(
        url,
        options: options,
        data: params,
      );
    } else if (method == Method.put) {
      response = await dio.put(
        url,
        options: options,
        data: params,
      );
    } else {
      response = await dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
      );
    }
    return response;
  }

// //!POST
//   @override
//   Future post(String path,
//       {dynamic data,
//       Map<String, dynamic>? queryParameters,
//       bool isFormData = false}) async {
//     try {
//       var res = await dio.post(path,
//           data: isFormData ? FormData.fromMap(data) : data,
//           queryParameters: queryParameters,
//           options: Options(headers: headers));
//       return res.data;
//     } on DioException catch (e) {
//       print("=================error=======");
//       handleDioException(e);
//     }
//   }

// //!GET
//   @override
//   Future get(String path,
//       {Object? data, Map<String, dynamic>? queryParameters}) async {
//     try {
//       var res =
//           await dio.get(path, data: data, queryParameters: queryParameters);
//       return res.data;
//     } on DioException catch (e) {
//       handleDioException(e);
//     }
//   }

// //!DELETE
//   @override
//   Future delete(String path,
//       {Object? data, Map<String, dynamic>? queryParameters}) async {
//     try {
//       var res = await dio.delete(
//         path,
//         data: data,
//         queryParameters: queryParameters,
//       );
//       return res.data;
//     } on DioException catch (e) {
//       handleDioException(e);
//     }
//   }

// //!PATCH
//   @override
//   Future patch(String path,
//       {dynamic data,
//       Map<String, dynamic>? queryParameters,
//       bool isFormData = false}) async {
//     try {
//       var res = await dio.patch(
//         path,
//         data: isFormData ? FormData.fromMap(data) : data,
//         queryParameters: queryParameters,
//       );
//       return res.data;
//     } on DioException catch (e) {
//       handleDioException(e);
//     }
//   }
}

enum Method { get, post, put, delete, patch }

class TokenExpiredException implements Exception {
  String message;
  TokenExpiredException(this.message);
}
