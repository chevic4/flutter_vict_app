import 'package:flutter/foundation.dart';
import 'package:flutter_vict_app/components/netwoking_service/networking_service.dart';
import 'package:flutter_vict_app/components/storage_service/storage_service_lib.dart';

import 'package:flutter_vict_app/src/data/mapper/products_mapper.dart';
import 'package:flutter_vict_app/src/data/model/products_model.dart';
import 'package:flutter_vict_app/src/domain/entity/products_entity.dart';
import 'package:flutter_vict_app/src/domain/repository/products_service_repository.dart';

class ProductsServiceRepositoryImpl implements ProductsServiceRepository {
  @override
  final NetworkingService networkingService;
  @override
  final StorageService storageService;

  ProductsServiceRepositoryImpl(
      {required this.networkingService, required this.storageService});

  @override
  Future<ProductEntity?> getProductById({required int id}) async {
    final token = await storageService.getTokenEntity();
    if (token == null) {
      debugPrint('no token! no request( getProductById');
      null;
    } else {
      final jsonProduct = await networkingService.getProductByID(
          id: id, token: token.accessToken);

      if (jsonProduct.$1 != null || jsonProduct.$2 == null) {
        debugPrint(' network error on get data product by id');
        return null;
      } else {
        final productModel = ProductModel.fromJson(jsonProduct.$2!);
        return ProductMapper.modelToEnity(productModel);
      }
    }
    return null;
  }

  @override
  Future<List<ProductEntity>?> getProductList() async {
    final token = await storageService.getTokenEntity();
    if (token == null) {
      debugPrint('no token! no getProductList');
      null;
    } else {
      final jsonListDynamic =
          await networkingService.getProductsList(token: token.accessToken);
      if (jsonListDynamic.$1 == null && jsonListDynamic.$2 == null) {
        debugPrint('network bad data in getproductlist');
        return null;
      } else {
        try {
          final result = List.generate(
            jsonListDynamic.$2!.length,
            (itemIndex) => ProductMapper.modelToEnity(
              ProductModel.fromJson(
                jsonListDynamic.$2![itemIndex],
              ),
            ),
          );

          return result;
        } catch (e) {
          debugPrint('getProductList error - $e');
          return null;
        }
      }
    }
    return null;
  }
}
