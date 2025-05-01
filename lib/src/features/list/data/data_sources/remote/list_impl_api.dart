import 'package:crash_inspector/src/features/list/data/data_sources/remote/abstract_list_api_remote.dart';
import 'package:crash_inspector/src/features/list/data/models/list_errors_models.dart';
import 'package:crash_inspector/src/shared/http/failures.dart';
import 'package:crash_inspector/src/shared/http/http_client.dart';
import 'package:crash_inspector/src/shared/utils/preferences.dart';
import 'dart:io';

class ListErrorsImplApiRemote extends AbstractListErrorApiRemote {
  ListErrorsImplApiRemote({
    required this.httpClient,
    required this.preferences,
  });

  final Preferences preferences;

  final HttpClient httpClient;
  final baseUrl = 'https://us.sentry.io/api/0/projects/';
  final issuesUrl = 'issues/';

  @override
  Future<ListErrorsModels> getListErrors() async {
    try {
      final response = await httpClient.msDio.get<dynamic>(
        '${preferences.selectedSentryConfig?.organizationId ?? ''}/${preferences.selectedSentryConfig?.projectId ?? ''}/$issuesUrl',
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader:
                'Bearer ${preferences.selectedSentryConfig?.token}',
          },
        ),
      );
      final value = response.data as Map<String, dynamic>;
      return ListErrorsModels.fromJson(value);
    } on DioException catch (error) {
      throw DioFailure.decode(error);
    } on Exception catch (error) {
      throw ExceptionFailure.decode(error);
    }
  }
}
