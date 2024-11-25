part of '../storage_service_lib.dart';

abstract interface class StorageServiceRepository {
  final FlutterSecureStorage flutterSecureStorage;

  StorageServiceRepository({required this.flutterSecureStorage});

  Future<String?> getFromSecureStore(String storageName);
  Future<void> setToSecureStore(String storageName, String value);
  Future<void> clearAll();
}
