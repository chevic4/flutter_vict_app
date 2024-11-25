part of 'storage_service_lib.dart';

class StorageService {
  final StorageServiceRepository storageServiceRepository;

  StorageService({required this.storageServiceRepository})
      : _usCases = StorageServiceUscases(
            storageServiceRepository: storageServiceRepository);
  final StorageServiceUscases _usCases;

  Future<void> clearStorage() async {
    _usCases.clearStorage();
  }

  // tokens
  Future<TokensEntity?> getTokenEntity() async {
    return _usCases.getTokensEntity();
  }

  Future<void> setTokensEntity(TokensEntity tokensEntity) async {
    _usCases.setTokenEntity(tokensEntity);
  }
}
