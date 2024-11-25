// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductsScreenStore on _ProductsScreenStore, Store {
  Computed<bool>? _$showButtonSortingComputed;

  @override
  bool get showButtonSorting => (_$showButtonSortingComputed ??= Computed<bool>(
          () => super.showButtonSorting,
          name: '_ProductsScreenStore.showButtonSorting'))
      .value;

  late final _$stateStoreAtom =
      Atom(name: '_ProductsScreenStore.stateStore', context: context);

  @override
  StateProductsStore get stateStore {
    _$stateStoreAtom.reportRead();
    return super.stateStore;
  }

  @override
  set stateStore(StateProductsStore value) {
    _$stateStoreAtom.reportWrite(value, super.stateStore, () {
      super.stateStore = value;
    });
  }

  late final _$listProductsAtom =
      Atom(name: '_ProductsScreenStore.listProducts', context: context);

  @override
  ObservableList<ProductEntity> get listProducts {
    _$listProductsAtom.reportRead();
    return super.listProducts;
  }

  @override
  set listProducts(ObservableList<ProductEntity> value) {
    _$listProductsAtom.reportWrite(value, super.listProducts, () {
      super.listProducts = value;
    });
  }

  late final _$_ProductsScreenStoreActionController =
      ActionController(name: '_ProductsScreenStore', context: context);

  @override
  dynamic _updateStoreState(StateProductsStore newState) {
    final _$actionInfo = _$_ProductsScreenStoreActionController.startAction(
        name: '_ProductsScreenStore._updateStoreState');
    try {
      return super._updateStoreState(newState);
    } finally {
      _$_ProductsScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void sortProductsByCategory() {
    final _$actionInfo = _$_ProductsScreenStoreActionController.startAction(
        name: '_ProductsScreenStore.sortProductsByCategory');
    try {
      return super.sortProductsByCategory();
    } finally {
      _$_ProductsScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
stateStore: ${stateStore},
listProducts: ${listProducts},
showButtonSorting: ${showButtonSorting}
    ''';
  }
}
