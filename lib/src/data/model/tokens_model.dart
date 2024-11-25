import 'package:flutter_vict_app/src/domain/entity/tokens_entity.dart';

class TokensModel extends TokensEntity {
  TokensModel({required super.accessToken, required super.refreshToken});

  factory TokensModel.fromMap(Map<String, dynamic> json) {
    return TokensModel(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'refresh_token': refreshToken,
    };
  }
}
