import 'package:dio/dio.dart';
import 'package:medical_test/app/core/errors/network_failure_model.dart';

class AppResponse<T> {
  bool success;
  T? data;
  String? errorMessage;
  NetworkFailureModel? networkFailure;

  void setErrorMessage(String value) {
    errorMessage = value;
  }

  String getErrorMessage() {
    return errorMessage ?? networkFailure?.message ?? "•Unknown error";
  }

  AppResponse({
    required this.success,
    this.errorMessage,
    this.data,
    this.networkFailure,
  });

  factory AppResponse.fromServer(Response response, {T? data}) {
    return AppResponse<T>(
      success: response.data["succeeded"],
      errorMessage: !response.data["succeeded"]
          ? response.data["message"] == null
              ? null
              : response.data["message"]["message"]
          : null,
      data: data,
    );
  }
}
