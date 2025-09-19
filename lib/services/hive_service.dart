// lib/services/hive_service.dart
import 'package:hive/hive.dart';

class HiveService {
  static const String authBox = 'authBox';
  static const String emailKey = 'email';
  static const String isAuthenticatedKey = 'isAuthenticated';

  late Box _box;

  Future<void> init() async {
    _box = await Hive.openBox(authBox);
  }

  Future<void> saveEmail(String email) async {
    await _box.put(emailKey, email);
  }

  String? getEmail() {
    return _box.get(emailKey);
  }

  Future<void> setAuthenticated(bool value) async {
    await _box.put(isAuthenticatedKey, value);
  }

  bool getAuthenticated() {
    return _box.get(isAuthenticatedKey, defaultValue: false);
  }

  Future<void> clear() async {
    await _box.clear();
  }
}
