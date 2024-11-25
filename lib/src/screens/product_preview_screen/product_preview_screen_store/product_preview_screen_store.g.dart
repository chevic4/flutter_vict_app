// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_preview_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductPreviewScreenStore on _ProductPreviewScreenStore, Store {
  late final _$stateStoreAtom =
      Atom(name: '_ProductPreviewScreenStore.stateStore', context: context);

  @override
  StateProductPreviewStore get stateStore {
    _$stateStoreAtom.reportRead();
    return super.stateStore;
  }

  @override
  set stateStore(StateProductPreviewStore value) {
    _$stateStoreAtom.reportWrite(value, super.stateStore, () {
      super.stateStore = value;
    });
  }

  late final _$_ProductPreviewScreenStoreActionController =
      ActionController(name: '_ProductPreviewScreenStore', context: context);

  @override
  dynamic _updateStoreState(StateProductPreviewStore newState) {
    final _$actionInfo = _$_ProductPreviewScreenStoreActionController
        .startAction(name: '_ProductPreviewScreenStore._updateStoreState');
    try {
      return super._updateStoreState(newState);
    } finally {
      _$_ProductPreviewScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
stateStore: ${stateStore}
    ''';
  }
}
