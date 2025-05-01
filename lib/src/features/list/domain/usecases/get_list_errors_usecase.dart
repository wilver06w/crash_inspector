import 'package:crash_inspector/src/features/list/data/models/list_errors_models.dart';
import 'package:crash_inspector/src/features/list/domain/repositories/abstract_list_errors_config_repository.dart';
import 'package:crash_inspector/src/shared/http/failures.dart';
import 'package:dartz/dartz.dart';

class GetListErrorsUseCase {
  GetListErrorsUseCase({
    required this.repository,
  });
  final AbstractListErrorsRepository repository;

  Future<Either<Failure, ListErrorsModels>> getListErrors() async {
    final result = await repository.getListErrors();

    return result.fold(
      Left.new,
      Right.new,
    );
  }
}
