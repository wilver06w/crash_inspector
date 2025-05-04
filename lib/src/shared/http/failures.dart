import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class Failure implements Exception, EquatableMixin {
  String get message;

  @override
  List<Object?> get props => <Object?>[message];
}

class ExceptionFailure extends Failure {
  // Constructor factory que convierte una excepción en ExceptionFailure
  factory ExceptionFailure.decode(Exception? error) {
    return ExceptionFailure._(
      error: error,
      message: error.toString(),
    );
  }

  // Constructor privado con parámetros nombrados
  ExceptionFailure._({
    required this.message,
    this.error,
  });

  // Referencia a la excepción original
  final Exception? error;

  // Implementación del mensaje de error requerido por la clase base
  @override
  final String message;

  // No implementa stringify - lanzará error si se intenta usar
  @override
  bool? get stringify => throw UnimplementedError();
}

class DioFailure extends Failure {
  // Constructor factory que convierte un DioException en DioFailure
  factory DioFailure.decode(
    DioException? error,
  ) {
    return DioFailure._(
      error: error,
      statusCode: error?.response?.statusCode,
      message: error?.response?.statusMessage ?? '',
    );
  }

  // Constructor privado con parámetros nombrados
  DioFailure._({
    required this.message,
    this.statusCode,
    this.error,
  });

  // Código de estado HTTP si está disponible
  final int? statusCode;

  // Referencia al error Dio original
  final DioException? error;

  // Implementación del mensaje de error requerido por la clase base
  @override
  final String message;

  // Habilita la representación de cadena legible para depuración
  @override
  bool? get stringify => true;
}

class ErrorFailure extends Failure {
  factory ErrorFailure.decode(
    Error? error,
  ) {
    return ErrorFailure._(
      error: error,
      message: error.toString(),
    );
  }

  ErrorFailure._({
    required this.message,
    this.error,
  });

  final Error? error;

  @override
  final String message;

  @override
  bool? get stringify => true;
}
