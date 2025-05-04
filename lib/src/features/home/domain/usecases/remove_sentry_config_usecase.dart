import 'package:dartz/dartz.dart';

import '../../../../shared/http/failures.dart';
import '../models/sentry_config_model.dart';
import '../repositories/abstract_sentry_config_repository.dart';

class RemoveSentryConfigUseCase {
  RemoveSentryConfigUseCase({
    required this.repository,
  });
  final AbstractSentryConfigRepository repository;

  Future<Either<Failure, SentryConfigModel>> call(int index) async {
    final Either<Failure, SentryConfigModel> result = await repository.removeSentryConfig(index);

    return result.fold(
      Left.new,
      Right.new,
    );
  }
}
