import 'package:dartz/dartz.dart';
import 'package:medical_test/app/config/string_manager.dart';
import 'package:medical_test/app/core/errors/expentions.dart';
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
}
