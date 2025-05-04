import 'package:dartz/dartz.dart';

import '../../../../shared/http/failures.dart';
import '../../domain/models/sentry_config_model.dart';
import '../../domain/repositories/abstract_sentry_config_repository.dart';
import '../data_sources/remote/home_impl_api.dart';

class SentryRepositoryImpl extends AbstractSentryConfigRepository {
  SentryRepositoryImpl({
    required this.apiRemote,
  });
  final HomeImplApiRemote apiRemote;

  @override
  Future<Either<Failure, List<SentryConfigModel>>> getSentryConfigs() async {
    try {
      final List<SentryConfigModel> result = await apiRemote.getSentryConfigs();
      return Right<Failure, List<SentryConfigModel>>(result);
    } on Failure catch (e) {
      return Left<Failure, List<SentryConfigModel>>(e);
    }
  }

  @override
  Future<Either<Failure, SentryConfigModel>> removeSentryConfig(
    int index,
  ) async {
    try {
      final SentryConfigModel result = await apiRemote.removeSentryConfig(
        index,
      );
      return Right<Failure, SentryConfigModel>(result);
    } on Failure catch (e) {
      return Left<Failure, SentryConfigModel>(e);
    }
  }
}
