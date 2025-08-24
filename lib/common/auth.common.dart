import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthCommon {
  static const _tokenKey = "token";
  static final FlutterSecureStorage _storage = const FlutterSecureStorage();

  // Setter
  static Future<void> setToken(String? value) async {
    if (value != null && value.isNotEmpty) {
      await _storage.write(key: _tokenKey, value: value);
    }
  }

  // Getter
  static Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  // Clear
  static Future<void> clearToken() async {
    await _storage.delete(key: _tokenKey);
  }
}
