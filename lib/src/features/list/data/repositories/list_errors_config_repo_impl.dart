import 'package:crash_inspector/src/features/home/data/data_sources/remote/sentry_impl_api.dart';
import 'package:crash_inspector/src/features/home/domain/models/sentry_config_model.dart';
import 'package:crash_inspector/src/features/list/domain/repositories/abstract_list_errors_config_repository.dart';
import 'package:dartz/dartz.dart';

import 'package:crash_inspector/src/shared/http/failures.dart';

class ListErrorsRepositoryImpl extends AbstractListErrorsRepository {
  ListErrorsRepositoryImpl({
    required this.apiRemote,
  });
  final SentryImplApiRemote apiRemote;

  @override
  Future<Either<Failure, List<SentryConfigModel>>> getSentryConfigs() async {
    try {
      final result = await apiRemote.getSentryConfigs();
      return Right(result);
    } on Failure catch (e) {
      return Left<Failure, List<SentryConfigModel>>(e);
    }
  }

  @override
  Future<Either<Failure, SentryConfigModel>> removeSentryConfig(
    int index,
  ) async {
    try {
      final result = await apiRemote.removeSentryConfig(
        index,
      );
      return Right(result);
    } on Failure catch (e) {
      return Left<Failure, SentryConfigModel>(e);
    }
  }
}
