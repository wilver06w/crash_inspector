import 'package:effective_error_handling/generated/l10n.dart';
import 'package:effective_error_handling/src/features/home/data/data_sources/remote/abstract_orders_api_remote.dart';
import 'package:effective_error_handling/src/features/home/data/models/archetype.dart';
import 'package:effective_error_handling/src/features/home/data/models/get_orders.dart';
import 'package:effective_error_handling/src/shared/http/exceptions.dart';
import 'package:effective_error_handling/src/shared/http/http_client.dart';

class OrdersImplApiRemote extends AbstractOrdersApiRemote {
  OrdersImplApiRemote({
    required this.xigoHttpClient,
  });

  final HttpClient xigoHttpClient;

  final archetypeUrl = '/v7/archetypes.php';

  @override
  Future<List<Archetype>> getOrders() async {
    try {
      final response = await xigoHttpClient.msDio.get<dynamic>(archetypeUrl);

      final List<dynamic> rawListData = response.data as List<dynamic>;
      final list = rawListData.map((p) => Archetype.fromJson(p)).toList();

      return list;
    } on ServerException catch (e) {
      throw ServerException(e.message, e.statusCode);
    } catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode == 500) {
          throw ServerException(
            S.current.serviceNotAvailable,
            e.response?.statusCode,
          );
        }
        final responseData = e.response?.data;
        String message = '';
        if (responseData != null && responseData is Map<String, dynamic>) {
          message = responseData['error']?.toString() ??
              responseData['message']?.toString() ??
              responseData['error_description']?.toString() ??
              S.current.serviceNotAvailable;
        }

        throw ServerException(message, e.response?.statusCode);
      }
      throw ServerException(e.toString(), 500);
    }
  }

  @override
  Future<GetOrders> setSearchOrder(
    String search,
  ) async {
    try {
      final response = await xigoHttpClient.msDio.get<dynamic>(
        archetypeUrl,
        queryParameters: {
          'search': search,
        },
      );
      final value = response.data as Map<String, dynamic>;
      return GetOrders.fromJson(value);
    } on ServerException catch (e) {
      throw ServerException(e.message, e.statusCode);
    } catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode == 500) {
          throw ServerException(
            S.current.serviceNotAvailable,
            e.response?.statusCode,
          );
        }
        final responseData = e.response?.data;
        String message = '';
        if (responseData != null && responseData is Map<String, dynamic>) {
          message = responseData['error']?.toString() ??
              responseData['message']?.toString() ??
              responseData['error_description']?.toString() ??
              S.current.serviceNotAvailable;
        }

        throw ServerException(message, e.response?.statusCode);
      }
      throw ServerException(e.toString(), 500);
    }
  }
}
