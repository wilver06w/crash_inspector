import 'package:crash_inspector/src/features/home/domain/models/sentry_config_model.dart';

abstract class AbstractSentryApiRemote {
  Future<List<SentryConfigModel>> getSentryConfigs();
  Future<SentryConfigModel> removeSentryConfig(
    int index,
  );
}
