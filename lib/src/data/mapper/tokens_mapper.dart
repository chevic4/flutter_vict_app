import 'package:flutter_vict_app/src/data/model/tokens_model.dart';
import 'package:flutter_vict_app/src/domain/entity/tokens_entity.dart';

class TokensMapper {
  static TokensEntity modelToEnity(TokensModel model) {
    final TokensEntity entity = model;
    return entity;
  }

  static TokensModel entityToModel(TokensEntity entity) {
    final TokensModel model = TokensModel(
        accessToken: entity.accessToken, refreshToken: entity.refreshToken);

    return model;
  }
}
