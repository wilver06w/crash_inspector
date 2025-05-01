import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

// Clase abstracta base para todos los tipos de fallos
// Implementa Exception para integrarse con el sistema de excepciones de Dart
// Implementa EquatableMixin para facilitar comparaciones de objetos
abstract class Failure implements Exception, EquatableMixin {
  // Cada fallo debe tener un mensaje descriptivo
  String get message;

  // Sobrescribe el método props de EquatableMixin
  // Define qué propiedades se usan para comparar dos objetos Failure
  @override
  List<Object?> get props => <Object?>[message];
}

// Clase para manejar excepciones genéricas de Dart
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

// Clase especializada para manejar errores de la biblioteca Dio (HTTP)
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

// Clase para manejar errores de programación (TypeError, RangeError, etc.)
class ErrorFailure extends Failure {
  // Constructor factory que convierte un Error en ErrorFailure
  factory ErrorFailure.decode(
    Error? error,
  ) {
    return ErrorFailure._(
      error: error,
      message: error.toString(),
    );
  }

  // Constructor privado con parámetros nombrados
  ErrorFailure._({
    required this.message,
    this.error,
  });

  // Referencia al error original
  final Error? error;

  // Implementación del mensaje de error requerido por la clase base
  @override
  final String message;

  // Habilita la representación de cadena legible para depuración
  @override
  bool? get stringify => true;
}