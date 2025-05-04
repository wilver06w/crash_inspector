import 'package:dartz/dartz.dart';

import '../../../../shared/http/failures.dart';
import '../models/sentry_config_model.dart';
import '../repositories/abstract_sentry_config_repository.dart';

class GetSentryConfigsUseCase {
  GetSentryConfigsUseCase({
    required this.repository,
  });
  final AbstractSentryConfigRepository repository;

  Future<Either<Failure, List<SentryConfigModel>>> getSentryConfigs() async {
    final Either<Failure, List<SentryConfigModel>> result = await repository.getSentryConfigs();

    return result.fold(
      Left.new,
      Right.new,
    );
  }
}
