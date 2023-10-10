import 'package:mmorpg_life/data/datasources/local_data_storage.dart';

class LocalStorageUseCases {
  final SecureStorage secureStorage;
  LocalStorageUseCases(this.secureStorage);

  void writeInfo(String key, String value) {
    secureStorage.writeInfo(key, value);
  }

  Future<String> readInfo(String key) async {
    String? result = await secureStorage.readInfo(key);

    return result ?? "empty";
  }
}
