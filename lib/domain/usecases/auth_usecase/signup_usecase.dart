import 'package:dartz/dartz.dart';
import 'package:medical_test/domain/entities/sign_up.dart';
import 'package:medical_test/domain/repositories/auth_repositories.dart';
import '../../../app/core/errors/failure.dart';
import '../../../app/core/params/params.dart';

class SignupUsecase {
  final AuthRepository repository;

  SignupUsecase({required this.repository});

  Future<Either<Failure, SignUpEntity>> call({required SignUpParams params}) {
    return repository.register(params: params);
  }
}
