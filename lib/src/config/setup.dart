import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_vict_app/components/netwoking_service/networking_service.dart';
import 'package:flutter_vict_app/components/storage_service/storage_service_lib.dart';
import 'package:flutter_vict_app/src/config/routes/router_service.dart';
import 'package:flutter_vict_app/src/config/routes/router_state.dart';
import 'package:flutter_vict_app/src/data/products_service_repository_impl.dart';
import 'package:flutter_vict_app/src/data/profile_service_repository_impl.dart';
import 'package:flutter_vict_app/src/domain/product_service.dart';
import 'package:flutter_vict_app/src/domain/profile_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

setup() async {
  //
  /// локальное хранилище
  locator.registerSingletonAsync<StorageService>(() async {
    const storage = FlutterSecureStorage();
    return StorageService(
        storageServiceRepository:
            StorageServiceRepositoryImpl(flutterSecureStorage: storage));
  });

  //
  /// стейт авторизации (авторизован/нет)
  locator.registerSingletonAsync<AuthNotifier>(() async {
    return AuthNotifier(false);
  });

  //
  /// сеть
  locator.registerSingletonAsync<NetworkingService>(
      () async => NetworkingService());

  //
  /// роутер
  locator.registerSingletonAsync<AppRouter>(
    () async {
      final authNotifier = locator.get<AuthNotifier>();

      return AppRouter(authNotifier: authNotifier);
    },
    dependsOn: [AuthNotifier],
  );

  //
  /// сервис Products
  locator.registerLazySingleton<ProductService>(
    () {
      final storageService = locator.get<StorageService>();

      final networkingService = locator.get<NetworkingService>();

      return ProductService(
        productsServiceRepository: ProductsServiceRepositoryImpl(
            networkingService: networkingService,
            storageService: storageService),
      );
    },
  );

  //
  /// сервис Profile
  locator.registerLazySingleton<ProfileService>(
    () {
      final storageService = locator.get<StorageService>();

      final networkingService = locator.get<NetworkingService>();

      return ProfileService(
        profileServiceRepository: ProfileServiceRepositoryImpl(
            networkingService: networkingService,
            storageService: storageService),
      );
    },
  );
}
