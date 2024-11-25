part of '../storage_service_lib.dart';

class StorageServiceRepositoryImpl implements StorageServiceRepository {
  @override
  FlutterSecureStorage flutterSecureStorage;
  StorageServiceRepositoryImpl({
    required this.flutterSecureStorage,
  });

  @override
  Future<String?> getFromSecureStore(String storageName) async {
    try {
     
      final res = await flutterSecureStorage.read(key: storageName);
      return res;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> setToSecureStore(String storageName, String value) async {
    
    await flutterSecureStorage.write(key: storageName, value: value);
  }

  @override
  Future<void> clearAll() async {

    await flutterSecureStorage.deleteAll();
  }
}
