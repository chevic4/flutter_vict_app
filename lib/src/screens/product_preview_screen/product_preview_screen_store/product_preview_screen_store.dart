import 'package:flutter/material.dart';
import 'package:flutter_vict_app/src/domain/entity/products_entity.dart';
import 'package:flutter_vict_app/src/domain/product_service.dart';
import 'package:mobx/mobx.dart';

part 'product_preview_screen_store.g.dart';

class ProductPreviewScreenStore = _ProductPreviewScreenStore
    with _$ProductPreviewScreenStore;

abstract class _ProductPreviewScreenStore with Store {
  final ProductService productService;
  final String? pageId;

  @observable
  StateProductPreviewStore stateStore = StateProductPreviewLoading();

  ProductEntity? productEntity;

  _ProductPreviewScreenStore({
    required this.pageId,
    required this.productService,
  }) {
    _initStore();
  }

  Future<void> _initStore() async {
    debugPrint('init ProductPreview screen store');
    // валидация данных из params
    if (pageId == null && int.tryParse(pageId ?? '') == null) {
      _updateStoreState(StateProductPreviewError());
    } else {
      productEntity = await productService.getProductId(int.parse(pageId!));
      productEntity == null
          ? _updateStoreState(StateProductPreviewError())
          : _updateStoreState(StateProductPreviewStoreOk());
    }
  }

  @action
  _updateStoreState(StateProductPreviewStore newState) {
    stateStore = newState;
  }
}

abstract interface class StateProductPreviewStore {}

class StateProductPreviewStoreOk implements StateProductPreviewStore {}

class StateProductPreviewError implements StateProductPreviewStore {}

class StateProductPreviewLoading implements StateProductPreviewStore {}
