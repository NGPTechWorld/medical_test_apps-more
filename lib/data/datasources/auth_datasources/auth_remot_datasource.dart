import 'package:medical_test/app/core/params/params.dart';
import 'package:medical_test/app/services/api/api_services.dart';

class AuthRemoteDataSource {
  final ApiServices api;

  AuthRemoteDataSource({required this.api});

  register(SignUpParams params) {}

  // Future<SignUpEntity> register(SignUpParams params) async {
  //   final response =
  //       await api.post("http://192.168.137.35:8000/api/register", data: {
  //     ApiKey.name: params.name,
  //     ApiKey.phoneNumber: params.numberPhone,
  //     ApiKey.password: params.password,
  //     ApiKey.passwordConfirmation: params.passwordConfirmation,
  //     ApiKey.type: params.type,
  //   });
  //   jsonEncode(response);
  //   return SignUpEntity.fromJson(response);
  // }
}
