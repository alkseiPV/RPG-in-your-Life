import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  FlutterSecureStorage _flutterSecureStorage = FlutterSecureStorage();

  void writeInfo(String key, String value) {
    _flutterSecureStorage.write(key: key, value: value);
  }

  Future<String?> readInfo(String key) async {
    return await _flutterSecureStorage.read(key: key);
  }
}
