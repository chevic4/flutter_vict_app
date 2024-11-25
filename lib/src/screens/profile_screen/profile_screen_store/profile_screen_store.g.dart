// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileScreenStore on _ProfileScreenStore, Store {
  late final _$stateStoreAtom =
      Atom(name: '_ProfileScreenStore.stateStore', context: context);

  @override
  StateProfileStore get stateStore {
    _$stateStoreAtom.reportRead();
    return super.stateStore;
  }

  @override
  set stateStore(StateProfileStore value) {
    _$stateStoreAtom.reportWrite(value, super.stateStore, () {
      super.stateStore = value;
    });
  }

  late final _$_ProfileScreenStoreActionController =
      ActionController(name: '_ProfileScreenStore', context: context);

  @override
  dynamic _updateStoreState(StateProfileStore newState) {
    final _$actionInfo = _$_ProfileScreenStoreActionController.startAction(
        name: '_ProfileScreenStore._updateStoreState');
    try {
      return super._updateStoreState(newState);
    } finally {
      _$_ProfileScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
stateStore: ${stateStore}
    ''';
  }
}
