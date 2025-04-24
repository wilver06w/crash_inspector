import 'package:crash_inspector/src/features/home/domain/models/sentry_config_model.dart';
import 'package:crash_inspector/src/features/home/domain/repositories/abstract_sentry_config_repository.dart';
import 'package:crash_inspector/src/shared/http/failures.dart';
import 'package:dartz/dartz.dart';

class GetSentryConfigsUseCase {
  GetSentryConfigsUseCase({
    required this.repository,
  });
  final AbstractSentryConfigRepository repository;

  Future<Either<Failure, List<SentryConfigModel>>> getSentryConfigs() async {
    final result = await repository.getSentryConfigs();

    return result.fold(
      Left.new,
      Right.new,
    );
  }
}
