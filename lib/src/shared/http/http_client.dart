import 'package:dio/dio.dart';
import 'dio.dart';

export 'package:dio/dio.dart';
export 'package:flutter_modular/flutter_modular.dart';

class HttpClient {
  factory HttpClient() {
    _singleton._msDio = SharedDio(
      baseUrl: 'https://db.ygoprodeck.com/api',
    );
    return _singleton;
  }

  HttpClient._();
  static final HttpClient _singleton = HttpClient._();

  late SharedDio _msDio;

  Dio get msDio => _msDio.dio;
}
