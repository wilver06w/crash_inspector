import '../../../domain/models/sentry_config_model.dart';

abstract class HomeApiRemote {
  Future<List<SentryConfigModel>> getSentryConfigs();
  Future<SentryConfigModel> removeSentryConfig(
    int index,
  );
}
