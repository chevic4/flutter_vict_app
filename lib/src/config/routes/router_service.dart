import 'package:flutter_vict_app/src/config/routes/router_state.dart';
import 'package:flutter_vict_app/src/screens/login_screen/login_screen.dart';
import 'package:flutter_vict_app/src/screens/product_preview_screen/product_preview_screen.dart';
import 'package:flutter_vict_app/src/screens/products_screen/products_screen.dart';
import 'package:flutter_vict_app/src/screens/profile_screen/profile_screen.dart';
import 'package:flutter_vict_app/src/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter/material.dart';

class AppRouter {
  AppRouter({required this.authNotifier});

  static const String pathLoginScreen = '/login';
  static const String pathProfileScreen = '/profile';
  static const String pathMainScreen = '/main';
  static const String pathproductPreviewScreen = '$pathMainScreen/previewcard';
  static const String pathErrorScreen = '/error';
  static const String pathInitScreen = pathMainScreen;

  final AuthNotifier authNotifier;

  late final GoRouter router = GoRouter(
    initialLocation: pathInitScreen,
    refreshListenable: authNotifier,
    redirect: (context, state) {
      final bool isLoginScreen = state.matchedLocation == pathLoginScreen;
      final bool isLoggedIn = authNotifier.value;

      if (!isLoggedIn) {
        return isLoginScreen ? null : pathLoginScreen;
      }

      return null;
    },
    routes: [
      ShellRoute(
        pageBuilder: (context, state, child) {
          return NoTransitionPage(
            child: SplashScreen(
              childWidget: child,
            ),
          );
        },
        routes: [
          // главный экран продукты
          GoRoute(
            path: pathMainScreen,
            pageBuilder: (context, state) {
              return const MaterialPage(
                child: ProductsScreen(),
              );
            },
            routes: [
              GoRoute(
                path: 'previewcard/:id',
                pageBuilder: (context, state) {
                  return MaterialPage(
                    child: ProductPreviewScreen(
                        idProduct: state.pathParameters['id']),
                  );
                },
              ),
            ],
          ),

          // профиль
          GoRoute(
            path: AppRouter.pathProfileScreen,
            pageBuilder: (context, state) {
              return const MaterialPage(
                child: ProfileScreen(),
              );
            },
          ),

          // авторизация
          GoRoute(
            path: pathLoginScreen,
            pageBuilder: (context, state) {
              return const MaterialPage(
                child: LoginScreen(),
              );
            },
          ),
        ],
      ),
    ],
  );
}
