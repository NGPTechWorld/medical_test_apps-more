import 'package:dartz/dartz.dart';
import '../../../app/core/errors/failure.dart';
import '../../../app/core/params/params.dart';
import '../../entities/template.dart';
import '../../repositories/template_repository.dart';

class GetTemp {
  final TemplateRepository repository;

  GetTemp({required this.repository});

  Future<Either<Failure, TemplateEntity>> call(
      {required TemplateParams params}) {
    return repository.getTemp(params: params);
  }
}
