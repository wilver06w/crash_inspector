import 'package:crash_inspector/src/features/home/data/data_sources/remote/sentry_impl_api.dart';
import 'package:crash_inspector/src/features/home/domain/models/sentry_config_model.dart';
import 'package:crash_inspector/src/features/home/domain/repositories/abstract_sentry_config_repository.dart';
import 'package:dartz/dartz.dart';

import 'package:crash_inspector/src/shared/http/exceptions.dart';
import 'package:crash_inspector/src/shared/http/failures.dart';

class SentryRepositoryImpl extends AbstractSentryConfigRepository {
  SentryRepositoryImpl({
    required this.apiRemote,
  });
  final SentryImplApiRemote apiRemote;

  @override
  Future<Either<Failure, List<SentryConfigModel>>> getSentryConfigs() async {
    try {
      final result = await apiRemote.getSentryConfigs();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on CancelTokenException catch (e) {
      return Left(CancelTokenFailure(e.message, e.statusCode));
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
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on CancelTokenException catch (e) {
      return Left(CancelTokenFailure(e.message, e.statusCode));
    }
  }
}
