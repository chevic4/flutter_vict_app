import 'package:flutter/material.dart';
import 'package:flutter_vict_app/src/domain/entity/products_entity.dart';
import 'package:flutter_vict_app/src/domain/product_service.dart';
import 'package:mobx/mobx.dart';

part 'products_screen_store.g.dart';

class ProductsScreenStore = _ProductsScreenStore with _$ProductsScreenStore;

abstract class _ProductsScreenStore with Store {
  final ProductService productService;

  _ProductsScreenStore({required this.productService}) {
    _initStore();
  }

  @computed
  bool get showButtonSorting => _getShowButtonInfo();

  @observable
  StateProductsStore stateStore = StateProductsStoreLoading();

  @observable
  ObservableList<ProductEntity> listProducts = ObservableList<ProductEntity>();

  Future<void> _initStore() async {
    debugPrint('init Product screen store');

    // подождем securestorage
    await Future.delayed(const Duration(milliseconds: 300));
    final listFromService = await productService.getProductList();
    if (listFromService == null) {
      _updateStoreState(StateProductsStoreError());
    } else {
      listProducts.addAll(listFromService);
      _updateStoreState(StateProductsStoreOk());
    }
  }

  @action
  _updateStoreState(StateProductsStore newState) {
    stateStore = newState;
  }

  bool _getShowButtonInfo() =>
      stateStore.runtimeType == StateProductsStoreOk ? true : false;

  @action
  void sortProductsByCategory() {
    listProducts.sort(
      (a, b) => a.category.id.compareTo(b.category.id),
    );
  }
}

abstract interface class StateProductsStore {}

class StateProductsStoreOk implements StateProductsStore {}

class StateProductsStoreError implements StateProductsStore {}

class StateProductsStoreLoading implements StateProductsStore {}
