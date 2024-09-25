import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:medical_test/app/config/string_manager.dart';
import 'package:medical_test/app/core/errors/error_handler.dart';
import 'package:medical_test/app/core/errors/expentions.dart';
import 'package:medical_test/app/services/api/api_response_model.dart';
import 'package:medical_test/app/services/api/api_services.dart';
import 'package:medical_test/app/services/api/dio_consumer.dart';
import 'package:medical_test/app/services/api/end_points.dart';
import 'package:medical_test/app/services/connection/network_info.dart';
import 'package:medical_test/data/datasources/auth_datasources/auth_local_datasource.dart';
import 'package:medical_test/data/datasources/auth_datasources/auth_remot_datasource.dart';
import 'package:medical_test/domain/entities/sign_up.dart';
import '../../app/core/errors/failure.dart';
import '../../app/core/params/params.dart';
import 'package:get/get.dart';

abstract class AuthRepository {
  Future<Either<Failure, SignUpEntity>> register(
      {required SignUpParams params});
}

class AuthRepositoryImpl extends AuthRepository {
  final NetworkInfo networkInfo = Get.find<NetworkInfoImpl>();
  final AuthRemoteDataSource remoteDataSource = Get.find();
  final AuthLocalDataSource localDataSource = Get.find();
  AuthRepositoryImpl();

  @override
  Future<Either<Failure, SignUpEntity>> register(
      {required SignUpParams params}) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteTemplate = await remoteDataSource.register(params);
        print("==========6");
        localDataSource.cacheToken(remoteTemplate.data);
        return Right(remoteTemplate);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      return Left(Failure(errMessage: StringManager.nointernet));
    }
  }

  DioConsumer apiService = Get.find<DioConsumer>();
  Future<AppResponse> signUp(
    String firstName,
    String lastName,
    String password,
    String email,
  ) async {
    AppResponse appResponse = AppResponse(success: false);

    var data = jsonEncode({
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password,
    });
    try {
      dio.Response response = await apiService.request(
        url: EndPoints.register,
        method: Method.post,
        params: data,
        requiredToken: false,
      );
      debugPrint(response.data);
      // appResponse.success = response.data['succeeded'];
      // if (!appResponse.success) {
      //   debugPrint(response.data['errors'][1]['description']);
      //   appResponse.data = response.data['errors'][1]['description'];
      // }
    } catch (e) {
      appResponse.success = false;
      debugPrint(e.toString());
      appResponse.networkFailure = ErrorHandler.handle(e).failure;
    }
    return appResponse;
  }
}
