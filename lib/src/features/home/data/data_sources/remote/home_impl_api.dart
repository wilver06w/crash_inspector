import '../../../../../../generated/l10n.dart';
import '../../../../../shared/http/failures.dart';
import '../../../../../shared/http/http_client.dart';
import '../../../../../shared/models/sentry_config.dart';
import '../../../../../shared/utils/preferences.dart';
import '../../../domain/models/sentry_config_model.dart';
import 'home_api_remote.dart';

class HomeImplApiRemote extends HomeApiRemote {
  HomeImplApiRemote({
    required this.preferences,
  });

  final Preferences preferences;

  @override
  Future<List<SentryConfigModel>> getSentryConfigs() async {
    try {
      final List<SentryConfig> configs = preferences.sentryConfigs;
      return configs
          .map((SentryConfig config) => SentryConfigModel.fromEntity(config))
          .toList();
    } on DioException catch (error) {
      throw DioFailure.decode(error);
    } on Exception catch (error) {
      throw ExceptionFailure.decode(error);
    }
  }

  @override
  Future<SentryConfigModel> removeSentryConfig(int index) async {
    try {
      final List<SentryConfig> configs = preferences.sentryConfigs;
      if (index >= 0 && index < configs.length) {
        final SentryConfig configToRemove = configs[index];
        preferences.removeSentryConfig(index);
        return SentryConfigModel.fromEntity(configToRemove);
      }
      throw ExceptionFailure.decode(
        Exception(
          S.current.invalidSentryConfigIndex,
        ),
      );
    } on DioException catch (error) {
      throw DioFailure.decode(error);
    } on Exception catch (error) {
      throw ExceptionFailure.decode(error);
    }
  }
}
