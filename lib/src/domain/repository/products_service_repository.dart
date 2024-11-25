import 'package:flutter_vict_app/components/netwoking_service/networking_service.dart';
import 'package:flutter_vict_app/components/storage_service/storage_service_lib.dart';
import 'package:flutter_vict_app/src/domain/entity/products_entity.dart';

abstract interface class ProductsServiceRepository {
  final NetworkingService networkingService;
  final StorageService storageService;

  ProductsServiceRepository(
      {required this.networkingService, required this.storageService});

  Future<List<ProductEntity>?> getProductList();
  Future<ProductEntity?> getProductById({required int id});
}
