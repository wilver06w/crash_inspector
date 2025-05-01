import 'package:crash_inspector/src/features/home/domain/models/sentry_config_model.dart';
import 'package:crash_inspector/src/features/list/domain/repositories/abstract_list_errors_config_repository.dart';
import 'package:crash_inspector/src/shared/http/failures.dart';
import 'package:dartz/dartz.dart';

class GetListErrorsUseCase {
  GetListErrorsUseCase({
    required this.repository,
  });
  final AbstractListErrorsRepository repository;

  Future<Either<Failure, List<SentryConfigModel>>> getListErrors() async {
    final result = await repository.getSentryConfigs();

    return result.fold(
      Left.new,
      Right.new,
    );
  }
}
