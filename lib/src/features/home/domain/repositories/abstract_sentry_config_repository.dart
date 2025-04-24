import 'package:crash_inspector/src/features/home/domain/models/sentry_config_model.dart';
import 'package:crash_inspector/src/shared/http/failures.dart';
import 'package:dartz/dartz.dart';

abstract class AbstractSentryConfigRepository {
  Future<Either<Failure, List<SentryConfigModel>>> getSentryConfigs();
  Future<Either<Failure, SentryConfigModel>> removeSentryConfig(int index);
}
