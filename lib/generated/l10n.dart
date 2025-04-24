// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `No conexion`
  String get noConection {
    return Intl.message('No conexion', name: 'noConection', desc: '', args: []);
  }

  /// `Bievenido`
  String get welcome {
    return Intl.message('Bievenido', name: 'welcome', desc: '', args: []);
  }

  /// `Error {code} \nSi el error persiste, contacta a soporte`
  String weHaveAErrorContactSuport(Object code) {
    return Intl.message(
      'Error $code \nSi el error persiste, contacta a soporte',
      name: 'weHaveAErrorContactSuport',
      desc: '',
      args: [code],
    );
  }

  /// `Servicio no disponible`
  String get serviceNotAvailable {
    return Intl.message(
      'Servicio no disponible',
      name: 'serviceNotAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Pedido # {value}`
  String orderNumber(Object value) {
    return Intl.message(
      'Pedido # $value',
      name: 'orderNumber',
      desc: '',
      args: [value],
    );
  }

  /// `de`
  String get ofOf {
    return Intl.message('de', name: 'ofOf', desc: '', args: []);
  }

  /// `Buscar`
  String get search {
    return Intl.message('Buscar', name: 'search', desc: '', args: []);
  }

  /// `Detalles del archetype # {value}`
  String detailArchetype(Object value) {
    return Intl.message(
      'Detalles del archetype # $value',
      name: 'detailArchetype',
      desc: '',
      args: [value],
    );
  }

  /// `Cliente {value}`
  String clientValue(Object value) {
    return Intl.message(
      'Cliente $value',
      name: 'clientValue',
      desc: '',
      args: [value],
    );
  }

  /// `Crash Inspector`
  String get crashInspector {
    return Intl.message(
      'Crash Inspector',
      name: 'crashInspector',
      desc: '',
      args: [],
    );
  }

  /// `Agregar nueva fuente`
  String get addNewSource {
    return Intl.message(
      'Agregar nueva fuente',
      name: 'addNewSource',
      desc: '',
      args: [],
    );
  }

  /// `Puedes agregar una nueva fuente entre Sentry, Crashlytics y otras opciones disponibles`
  String get addNewSourceOptions {
    return Intl.message(
      'Puedes agregar una nueva fuente entre Sentry, Crashlytics y otras opciones disponibles',
      name: 'addNewSourceOptions',
      desc: '',
      args: [],
    );
  }

  /// `Selecciona la fuente de crash`
  String get selectCrashSource {
    return Intl.message(
      'Selecciona la fuente de crash',
      name: 'selectCrashSource',
      desc: '',
      args: [],
    );
  }

  /// `Selecciona una fuente`
  String get selectASource {
    return Intl.message(
      'Selecciona una fuente',
      name: 'selectASource',
      desc: '',
      args: [],
    );
  }

  /// `Organization ID`
  String get organizationId {
    return Intl.message(
      'Organization ID',
      name: 'organizationId',
      desc: '',
      args: [],
    );
  }

  /// `Project ID`
  String get projectId {
    return Intl.message('Project ID', name: 'projectId', desc: '', args: []);
  }

  /// `Token`
  String get token {
    return Intl.message('Token', name: 'token', desc: '', args: []);
  }

  /// `Guardar configuración`
  String get saveConfiguration {
    return Intl.message(
      'Guardar configuración',
      name: 'saveConfiguration',
      desc: '',
      args: [],
    );
  }

  /// `Guardando configuración`
  String get savingConfiguration {
    return Intl.message(
      'Guardando configuración',
      name: 'savingConfiguration',
      desc: '',
      args: [],
    );
  }

  /// `No hay configuraciones de Sentry`
  String get noSentryConfigs {
    return Intl.message(
      'No hay configuraciones de Sentry',
      name: 'noSentryConfigs',
      desc: '',
      args: [],
    );
  }

  /// `Error al obtener las configuraciones de Sentry`
  String get errorGettingSentryConfigs {
    return Intl.message(
      'Error al obtener las configuraciones de Sentry',
      name: 'errorGettingSentryConfigs',
      desc: '',
      args: [],
    );
  }

  /// `Índice de configuración inválido`
  String get invalidSentryConfigIndex {
    return Intl.message(
      'Índice de configuración inválido',
      name: 'invalidSentryConfigIndex',
      desc: '',
      args: [],
    );
  }

  /// `Configuración de Sentry eliminada`
  String get sentryConfigRemoved {
    return Intl.message(
      'Configuración de Sentry eliminada',
      name: 'sentryConfigRemoved',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'es')];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
