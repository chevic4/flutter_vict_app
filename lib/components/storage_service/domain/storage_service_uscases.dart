part of '../storage_service_lib.dart';

class StorageServiceUscases {
  final StorageServiceRepository storageServiceRepository;

  StorageServiceUscases({required this.storageServiceRepository});

  Future<void> clearStorage() async {
    storageServiceRepository.clearAll();
  }

// token Entity
  void setTokenEntity(TokensEntity value) {
    String dataForStore =
        jsonEncode(TokensMapper.entityToModel(value).toJson());
    storageServiceRepository.setToSecureStore(
        _StorageServiceConst._tokenData, dataForStore);
  }

  Future<TokensEntity?> getTokensEntity() async {
    final data = await storageServiceRepository
        .getFromSecureStore(_StorageServiceConst._tokenData);
    if (data == null) {
      return null;
    } else {
      final model = TokensModel.fromMap(jsonDecode(data));
      return TokensMapper.modelToEnity(model);
    }
  }
}
