import 'dart:convert';

import 'package:crash_inspector/src/shared/models/sentry_config.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Preferences {
  factory Preferences() => _singleton;

  Preferences._();
  static final Preferences _singleton = Preferences._();

  SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void initTests() {
    final values = <String, Object>{};
    // ignore: invalid_use_of_visible_for_testing_member
    SharedPreferences.setMockInitialValues(values);
  }

  int get idUser => _prefs?.getInt('idUser') ?? 0;
  set idUser(int value) => _prefs?.setInt('idUser', value);

  SentryConfig? get sentryConfig {
    final value = _prefs?.getString('sentryConfig');

    if (value != null) {
      final configData = json.decode(value);
      return SentryConfig.fromJson(configData as Map<String, dynamic>);
    }

    return null;
  }

  set sentryConfig(SentryConfig? value) {
    if (value == null) {
      _prefs?.remove('sentryConfig');
      return;
    }

    final configJson = json.encode(value.toJson());
    _prefs?.setString('sentryConfig', configJson);
  }

  Future<void> clear() async {
    await _prefs?.clear();
  }

  Future<void> reload() async {
    await _prefs?.reload();
  }
}
