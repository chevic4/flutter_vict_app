import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vict_app/components/netwoking_service/networking_service.dart';
import 'package:flutter_vict_app/components/storage_service/storage_service_lib.dart';
import 'package:flutter_vict_app/errors/data_errors.dart';
import 'package:flutter_vict_app/src/config/routes/router_state.dart';
import 'package:flutter_vict_app/src/data/mapper/tokens_mapper.dart';
import 'package:flutter_vict_app/src/data/model/tokens_model.dart';

// сервис авторизации
// 1. Успешный ответ возвращает access_token и refresh_token, которые нужно сохранить для
// дальнейшей работы. Если данные неверные, показывайте сообщение об ошибке.
// 2. Обновление токена:
// • При каждом запуске приложения:
// • Проверьте, есть ли сохранённый access_token.
// • Если токен отсутствует, откройте экран авторизации.
// • Если токен есть, выполните запрос на обновление токена.
// 3. Сохраните новый access_token и используйте его для всех дальнейших запросов. Если запрос на
// обновление токена завершился ошибкой, сбросьте сохранённые данные и откройте экран
// авторизации.
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
    this.authNotifier, {
    required this.storageService,
    required this.networkingService,
  }) : super(AuthStateLogout()) {
    _initAuth();
  }

  final StorageService storageService;
  final NetworkingService networkingService;
  final AuthNotifier authNotifier;

  Future<void> _initAuth() async {
    final tokens = await storageService.getTokenEntity();

    if (tokens == null) {
      debugPrint('init app - Empty tokens');
      storageService.clearStorage();
    } else {
      // обновляем токены
      final refreshTokenData = await networkingService.postRefreshUserData(
          token: tokens.refreshToken);
      if (refreshTokenData.$1 == null && refreshTokenData.$2 != null) {
        final newTokens = TokensMapper.modelToEnity(
            TokensModel.fromMap(refreshTokenData.$2!));
        await storageService.setTokensEntity(newTokens);

        emit(AuthStateIsLoggined());
        authNotifier.update(isLoggedIn: true);
      } else {
        debugPrint('init app - error on update tokens');
        storageService.clearStorage();
      }
    }
  }

  Future<void> _authProcessingStart(
      {required String login, required String password}) async {
    // авторизация
    final loginData = await networkingService.postAuthUserData(
        login: login, password: password);
    // данные валидны? сохраняем
    if (loginData.$1 == null && loginData.$2 != null) {
      final newTokensModel = TokensModel.fromMap(loginData.$2!);
      storageService.setTokensEntity(TokensMapper.modelToEnity(newTokensModel));
      debugPrint(
          'update tokens acces-${newTokensModel.accessToken} refresh-${newTokensModel.refreshToken}');
      emit(AuthStateIsLoggined());
      authNotifier.update(isLoggedIn: true);
    } else {
      // ошибки
      // api 401 на все плохие запросы отдает поэтому обработаем 2
      loginData.$1.runtimeType == DataErrorNetowrkBadData
          ? emit(AuthStateErrorUnregisteredUser())
          : emit(AuthStateErrorNetwork());
    }
  }

  //
  //  кнопки
  //
  Future<void> login({required String login, required String password}) async {
    {
      emit(AuthStateLoading());
      // валидация
      if (login.isEmpty ||
          login.length < 5 ||
          password.isEmpty ||
          password.length < 5) {
        emit(AuthStateErrorInvalidLogPaswd());
      } else {
        //
        _authProcessingStart(login: login, password: password);
      }
    }
  }

  // на футере
  Future<void> loginMOCK() async {
    _authProcessingStart(login: 'john@mail.com', password: 'changeme');
  }

  Future<void> logout() async {
    await storageService.clearStorage();
    authNotifier.update(isLoggedIn: false);
    emit(AuthStateLogout());
  }
}
