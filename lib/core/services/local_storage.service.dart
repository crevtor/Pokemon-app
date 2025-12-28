import 'dart:convert';
import 'package:pokemon/core/models/export.models.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'services_injector.service.dart';

LocalStorageService get localStorageService => locator<LocalStorageService>();

class LocalStorageService {
  static LocalStorageService? _instance;
  static SharedPreferences? _preferences;

  static Future<LocalStorageService> getInstance() async {
    _instance ??= LocalStorageService();
    _preferences ??= await SharedPreferences.getInstance();
    return _instance!;
  }

  // Generic save for primitive types
  Future<void> saveToDisk<T>(String key, T content) async {
    if (content is String) {
      await _preferences!.setString(key, content);
    } else if (content is bool) {
      await _preferences!.setBool(key, content);
    } else if (content is int) {
      await _preferences!.setInt(key, content);
    } else if (content is double) {
      await _preferences!.setDouble(key, content);
    } else if (content is List<String>) {
      await _preferences!.setStringList(key, content);
    }
  }

  // Save model
  Future<bool> saveModel<T extends SavableModel>(String key, T model) async {
    final encoded = jsonEncode(model.toJson());
    return _preferences!.setString(key, encoded);
  }

  // Restore model (pass in the model's fromJson function)
  T? getSavedModel<T extends SavableModel>(
      String key, T Function(Map<String, dynamic>) fromJson) {
    try {
      final value = _preferences?.getString(key);
      if (value == null) return null;
      final decoded = jsonDecode(value) as Map<String, dynamic>;
      return fromJson(decoded);
    } catch (_) {
      return null;
    }
  }

  // Save list of models
  Future<bool> saveModelList<T extends SavableModel>(
      String key, List<T> models) async {
    final encodedList =
    models.map((m) => jsonEncode(m.toJson())).toList();
    return _preferences!.setStringList(key, encodedList);
  }

  // Restore list of models
  List<T> getSavedModelList<T extends SavableModel>(
      String key, T Function(Map<String, dynamic>) fromJson) {
    try {
      final values = _preferences?.getStringList(key) ?? [];
      return values
          .map((e) => jsonDecode(e) as Map<String, dynamic>)
          .map(fromJson)
          .toList();
    } catch (_) {
      return [];
    }
  }

  dynamic getFromDisk(String key) => _preferences!.get(key);

  Future<void> removeFromDisk(String key) async {
    await _preferences!.remove(key);
  }

  Future<void> empty() async {
    await _preferences!.clear();
  }
}
