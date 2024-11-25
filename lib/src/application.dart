import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vict_app/components/netwoking_service/networking_service.dart';
import 'package:flutter_vict_app/components/storage_service/storage_service_lib.dart';
import 'package:flutter_vict_app/src/config/constants/app_colors.dart';
import 'package:flutter_vict_app/src/config/constants/language_map.dart';
import 'package:flutter_vict_app/src/config/routes/router_service.dart';
import 'package:flutter_vict_app/src/config/routes/router_state.dart';
import 'package:flutter_vict_app/src/config/setup.dart';
import 'package:flutter_vict_app/src/domain/auth_service_cubit.dart';

import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    final authNotifier = locator.get<AuthNotifier>();

    return ChangeNotifierProvider.value(
      value: authNotifier,
      child: MultiProvider(
        providers: [
          ProxyProvider<AuthNotifier, AppRouter>(
            update: (context, newState, _) => AppRouter(authNotifier: newState),
          ),
          BlocProvider<AuthCubit>(
            create: (context) => AuthCubit(
              locator.get<AuthNotifier>(),
              storageService: locator.get<StorageService>(),
              networkingService: locator.get<NetworkingService>(),
            ),
          ),
        ],
        child: Builder(
          builder: (context) {
            final GoRouter router = Provider.of<AppRouter>(context).router;
            return MaterialApp.router(
              theme: ThemeData(
                appBarTheme: AppBarTheme(backgroundColor: AppColors.appbarC),
                primarySwatch: Colors.blueGrey,
                colorScheme: ColorScheme.fromSwatch(
                  primarySwatch: Colors.blueGrey,
                ),
              ),
              title: LanguageMap.lngMap['headTitle'],
              debugShowCheckedModeBanner: false,
              routeInformationParser: router.routeInformationParser,
              routerDelegate: router.routerDelegate,
              routeInformationProvider: router.routeInformationProvider,
              backButtonDispatcher: router.backButtonDispatcher,
            );
          },
        ),
      ),
    );
  }
}
