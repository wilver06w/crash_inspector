import 'package:dartz/dartz.dart';

import '../../../../shared/http/failures.dart';
import '../models/sentry_config_model.dart';

abstract class AbstractSentryConfigRepository {
  Future<Either<Failure, List<SentryConfigModel>>> getSentryConfigs();
  Future<Either<Failure, SentryConfigModel>> removeSentryConfig(int index);
}
