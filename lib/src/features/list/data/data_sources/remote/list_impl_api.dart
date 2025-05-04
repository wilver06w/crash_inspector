import 'dart:io';

import '../../../../../shared/http/failures.dart';
import '../../../../../shared/http/http_client.dart';
import '../../../../../shared/utils/preferences.dart';
import '../../models/errors_model.dart';
import 'list_api_remote.dart';

class ListErrorsImplApiRemote extends AbstractListErrorApiRemote {
  ListErrorsImplApiRemote({
    required this.httpClient,
    required this.preferences,
  });

  final Preferences preferences;

  final HttpClient httpClient;
  final String baseUrl = 'https://us.sentry.io/api/0/projects/';
  final String issuesUrl = 'issues/';

  @override
  Future<List<ErrorsModel>> getListErrors() async {
    try {
      httpClient.msDio.options.baseUrl = baseUrl;
      final Response<dynamic> response = await httpClient.msDio.get<dynamic>(
        '${preferences.selectedSentryConfig?.organizationId ?? ''}/${preferences.selectedSentryConfig?.projectId ?? ''}/$issuesUrl',
        options: Options(
          headers: <String, String>{
            HttpHeaders.authorizationHeader:
                'Bearer ${preferences.selectedSentryConfig?.token}',
          },
        ),
      );
      final List<ErrorsModel> errors = (response.data as List<dynamic>)
          .map((dynamic e) => ErrorsModel.fromJson(e as Map<String, dynamic>))
          .toList();
      return errors;
    } on DioException catch (error) {
      throw DioFailure.decode(error);
    } on Exception catch (error) {
      throw ExceptionFailure.decode(error);
    } on Error catch (error) {
      throw ErrorFailure.decode(error);
    }
  }
}
