import 'package:crash_inspector/generated/l10n.dart';
import 'package:crash_inspector/src/features/home/data/data_sources/remote/abstract_sentry_api_remote.dart';
import 'package:crash_inspector/src/features/home/domain/models/sentry_config_model.dart';
import 'package:crash_inspector/src/shared/http/failures.dart';
import 'package:crash_inspector/src/shared/http/http_client.dart';
import 'package:crash_inspector/src/shared/utils/preferences.dart';

class SentryImplApiRemote extends AbstractSentryApiRemote {
  SentryImplApiRemote({
    required this.preferences,
  });

  final Preferences preferences;

  @override
  Future<List<SentryConfigModel>> getSentryConfigs() async {
    try {
      final configs = preferences.sentryConfigs;
      return configs
          .map((config) => SentryConfigModel.fromEntity(config))
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
      final configs = preferences.sentryConfigs;
      if (index >= 0 && index < configs.length) {
        final configToRemove = configs[index];
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
