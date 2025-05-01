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

  List<SentryConfig> get sentryConfigs {
    final value = _prefs?.getString('sentryConfigs');

    if (value != null) {
      final List<dynamic> configsData = json.decode(value);
      return configsData
          .map((data) => SentryConfig.fromJson(data as Map<String, dynamic>))
          .toList();
    }

    return [];
  }

  void addSentryConfig(SentryConfig config) {
    final currentConfigs = sentryConfigs;
    currentConfigs.add(config);
    final configsJson = json.encode(
      currentConfigs.map((config) => config.toJson()).toList(),
    );
    _prefs?.setString('sentryConfigs', configsJson);
  }

  void removeSentryConfig(int index) {
    final currentConfigs = sentryConfigs;
    if (index >= 0 && index < currentConfigs.length) {
      currentConfigs.removeAt(index);
      final configsJson = json.encode(
        currentConfigs.map((config) => config.toJson()).toList(),
      );
      _prefs?.setString('sentryConfigs', configsJson);
    }
  }

  void clearSentryConfigs() {
    _prefs?.remove('sentryConfigs');
  }

  int? get selectedSentryConfigIndex =>
      _prefs?.getInt('selectedSentryConfigIndex');
  set selectedSentryConfigIndex(int? value) {
    if (value == null) {
      _prefs?.remove('selectedSentryConfigIndex');
    } else {
      _prefs?.setInt('selectedSentryConfigIndex', value);
    }
  }

  SentryConfig? get selectedSentryConfig {
    final index = selectedSentryConfigIndex;
    if (index != null && index >= 0 && index < sentryConfigs.length) {
      return sentryConfigs[index];
    }
    return null;
  }

  Future<void> clear() async {
    await _prefs?.clear();
  }

  Future<void> reload() async {
    await _prefs?.reload();
  }
}
