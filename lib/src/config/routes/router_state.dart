import 'package:flutter/material.dart';

class AuthNotifier extends ValueNotifier<bool> {
  AuthNotifier(super.value);

  void update({required bool isLoggedIn}) {
    value = isLoggedIn;
    notifyListeners();
  }
}

sealed class AuthState {}

class AuthStateIsLoggined implements AuthState {}

class AuthStateErrorInvalidLogPaswd implements AuthState {}

class AuthStateErrorUnregisteredUser implements AuthState {}

class AuthStateErrorNetwork implements AuthState {}

class AuthStateErrorUnknown implements AuthState {}

// при входе включим его и заблочим кнопку авторизации
class AuthStateLoading implements AuthState {}

// после входа в приложение если токены сломаны остаемся и вводим данные
class AuthStateLogout implements AuthState {}
