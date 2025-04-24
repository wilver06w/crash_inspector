import 'package:crash_inspector/generated/l10n.dart';
import 'package:crash_inspector/src/features/home/data/data_sources/remote/abstract_sentry_api_remote.dart';
import 'package:crash_inspector/src/features/home/domain/models/sentry_config_model.dart';
import 'package:crash_inspector/src/shared/http/exceptions.dart';
import 'package:crash_inspector/src/shared/utils/preferences.dart';

class SentryImplApiRemote extends AbstractSentryApiRemote {
  SentryImplApiRemote({
    required this.preferences,
  });

  final Preferences preferences;

  final archetypeUrl = '/v7/archetypes.php';

  @override
  Future<List<SentryConfigModel>> getSentryConfigs() async {
    try {
      final configs = preferences.sentryConfigs;
      return configs
          .map((config) => SentryConfigModel.fromEntity(config))
          .toList();
    } catch (e) {
      throw ServerException(
        S.current.errorGettingSentryConfigs,
        500,
      );
    }
  }

  @override
  Future<SentryConfigModel> removeSentryConfig(int index) async {
    try {
      final configs = preferences.sentryConfigs;
      if (index >= 0 && index < configs.length) {
        final configToRemove = configs[index];
        preferences.removeSentryConfig(index);
        return SentryConfigModel.fromEntity(configToRemove);
      }
      throw ServerException(
        S.current.invalidSentryConfigIndex,
        400,
      );
    } catch (e) {
      throw ServerException(
        S.current.errorGettingSentryConfigs,
        500,
      );
    }
  }
}
