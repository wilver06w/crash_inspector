import 'package:dio/dio.dart';
import 'package:effective_error_handling/src/shared/http/dio.dart';

export 'package:dio/dio.dart';
export 'package:flutter_modular/flutter_modular.dart';

class HttpClient {
  factory HttpClient() {
    _singleton._msDio = SharedDio(
      baseUrl: 'https://db.ygoprodeck.com/api',
      enableLogs: true,
    );
    return _singleton;
  }

  HttpClient._();
  static final _singleton = HttpClient._();

  late SharedDio _msDio;

  Dio get msDio => _msDio.dio;
}
