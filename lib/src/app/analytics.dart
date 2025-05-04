import 'dart:async';
import 'dart:developer' as developer;

import 'package:dio/dio.dart';

class AppAnalytics {
  AppAnalytics._();
  static final AppAnalytics instance = AppAnalytics._();

  Future<void> captureError(
    dynamic error, {
    Map<String, dynamic>? extraData,
    String? errorType,
    StackTrace? stackTrace,
    String? endpoint,
  }) async {
    // Crear mapa base de datos extra
    final Map<String, dynamic> fullExtraData = extraData ?? <String, dynamic>{};

    // Si se proporciona un endpoint, añadirlo a los datos extra
    if (endpoint != null && endpoint.isNotEmpty) {
      fullExtraData['endpoint'] = endpoint;
    }

    // Determinar el tipo de error y extraer información relevante
    String actualErrorType = errorType ?? 'unknown_error';

    // Procesar diferentes tipos de errores
    if (error is DioException) {
      actualErrorType = errorType ?? 'dio_exception';
      fullExtraData['dio_error_type'] = error.type.toString();
      fullExtraData['status_code'] = error.response?.statusCode;

      // Extraer datos de respuesta si están disponibles
      if (error.response?.data != null) {
        if (error.response!.data is Map) {
          fullExtraData['response_data'] = error.response!.data;
        } else {
          fullExtraData['response_data_type'] =
              error.response!.data.runtimeType.toString();
        }
      }

      // Añadir detalles de la solicitud
      fullExtraData['request_method'] = error.requestOptions.method;
      fullExtraData['request_path'] = error.requestOptions.path;
    } else if (error is FormatException) {
      actualErrorType = errorType ?? 'format_exception';
      fullExtraData['error_source'] = error.source;
    } else if (error is TypeError) {
      actualErrorType = errorType ?? 'type_error';
    }

    // Log the error with all collected data
    developer.log(
      'Error captured',
      error: error,
      stackTrace: stackTrace ?? StackTrace.current,
      name: actualErrorType,
      time: DateTime.now(),
    );

    // Log additional context
    fullExtraData.forEach((String key, dynamic value) {
      developer.log(
        'Error context: $key',
        error: value,
        name: actualErrorType,
      );
    });
  }
}
