import 'dart:convert';
import 'package:flutter_vict_app/src/config/constants/config.dart';
import 'package:flutter_vict_app/errors/data_errors.dart';
import 'package:http/http.dart' as http;

class NetworkingService {
  final _httpClient = http.Client();

  Uri _getUri(String endPoint) {
    final String url = '$configHost$configPath$endPoint';
    return Uri.parse(url);
  }

  // 1. Авторизация:
  // • POST /auth/login
  Future<(DataError?, Map<String, dynamic>?)> postAuthUserData(
      {required String login, required String password}) async {
    const String endPoint = '/auth/login';

    final Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    final bodyRequest = {
      "email": login,
      "password": password,
    };
    try {
      final responce = await _httpClient.post(
        _getUri(endPoint),
        headers: requestHeaders,
        body: jsonEncode(bodyRequest),
      );

      if (responce.statusCode != 201) {
        final checkResponseJsonPost =
            jsonDecode(responce.body) as Map<String, dynamic>;
        return (
          DataErrorNetowrkBadData(errorStatusCode: responce.body),
          checkResponseJsonPost
        );
      } else {
        final checkResponseJsonPost =
            jsonDecode(responce.body) as Map<String, dynamic>;
        return (null, checkResponseJsonPost);
      }
    } catch (e) {
      return (DataErrorNetowrkUnknown(error: 'unknown error $e'), null);
    }
  }

  // 2. Обновление токена:
  // • POST /auth/refresh-token
  Future<(DataError?, Map<String, dynamic>?)> postRefreshUserData(
      {required token}) async {
    const String endPoint = '/auth/refresh-token';

    final Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    final bodyRequest = {"refreshToken": token};
    try {
      final responce = await _httpClient.post(
        _getUri(endPoint),
        headers: requestHeaders,
        body: jsonEncode(bodyRequest),
        encoding: utf8,
      );

      if (responce.statusCode != 201) {
        final checkResponseJsonPost =
            jsonDecode(responce.body) as Map<String, dynamic>;
        return (
          DataErrorNetowrkBadData(
              errorStatusCode: responce.statusCode.toString()),
          checkResponseJsonPost
        );
      } else {
        final checkResponseJsonPost =
            jsonDecode(responce.body) as Map<String, dynamic>;
        return (null, checkResponseJsonPost);
      }
    } catch (e) {
      return (DataErrorNetowrkUnknown(error: 'unknown error $e'), null);
    }
  }

  // 3. Список продуктов:
  // • GET /products
  Future<(DataError?, List<dynamic>?)> getProductsList(
      {required String token}) async {
    const String endPoint = '/products';

    final Map<String, String> requestHeaders = {
      "Authorization": "Bearer $token"
    };

    try {
      final responce = await _httpClient.get(
        _getUri(endPoint),
        headers: requestHeaders,
      );

      if (responce.statusCode != 200) {
        return (
          DataErrorNetowrkBadData(
              errorStatusCode:
                  'error on request status error -${responce.statusCode}'),
          null
        );
      } else {
        final listMap = jsonDecode(responce.body) as List<dynamic>;

        return (null, listMap);
      }
    } catch (e) {
      return (DataErrorNetowrkUnknown(error: 'unknown network error $e'), null);
    }
  }

  // 4. Детали продукта:
  // • GET /products/{id}
  Future<(DataError?, Map<String, dynamic>?)> getProductByID(
      {required int id, required String token}) async {
    final String endPoint = '/products/$id';

    final Map<String, String> requestHeaders = {
      "Authorization": "Bearer $token"
    };

    try {
      final responce = await _httpClient.get(
        _getUri(endPoint),
        headers: requestHeaders,
      );

      if (responce.statusCode != 200) {
        return (
          DataErrorNetowrkBadData(
              errorStatusCode:
                  'error on request status error -${responce.statusCode}'),
          null
        );
      } else {
        final listMap = jsonDecode(responce.body) as Map<String, dynamic>;
        return (null, listMap);
      }
    } catch (e) {
      return (DataErrorNetowrkUnknown(error: 'unknown error $e'), null);
    }
  }

  // 5. Профиль пользователя:
  // • GET /auth/profile
  Future<(DataError?, Map<String, dynamic>?)> getUserProfile(
      {required String token}) async {
    const String endPoint = '/auth/profile';
    final Map<String, String> requestHeaders = {
      "Authorization": "Bearer $token"
    };

    try {
      final responce =
          await _httpClient.get(_getUri(endPoint), headers: requestHeaders);

      if (responce.statusCode != 200) {
        return (
          DataErrorNetowrkBadData(
              errorStatusCode:
                  'error on request status error -${responce.statusCode}'),
          null
        );
      } else {
        final listMap = jsonDecode(responce.body) as Map<String, dynamic>;
        return (null, listMap);
      }
    } catch (e) {
      return (DataErrorNetowrkUnknown(error: 'unknown error $e'), null);
    }
  }
}
