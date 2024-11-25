import 'package:flutter/material.dart';
import 'package:flutter_vict_app/src/domain/entity/profile_entity.dart';
import 'package:flutter_vict_app/src/domain/profile_service.dart';
import 'package:mobx/mobx.dart';

part 'profile_screen_store.g.dart';

class ProfileScreenStore = _ProfileScreenStore with _$ProfileScreenStore;

abstract class _ProfileScreenStore with Store {
  final ProfileService profileService;

  @observable
  StateProfileStore stateStore = StateProfileStoreLoading();

  ProfileEntity? profileEntity;

  _ProfileScreenStore({required this.profileService}) {
    _initStore();
  }

  Future<void> _initStore() async {
    debugPrint('init Profile screen store');

    profileEntity = await profileService.getProfile();

    profileEntity == null
        ? _updateStoreState(StateProfileStoreError())
        : _updateStoreState(StateProfileStoreOk());
  }

  @action
  _updateStoreState(StateProfileStore newState) {
    stateStore = newState;
  }
}

abstract interface class StateProfileStore {}

class StateProfileStoreOk implements StateProfileStore {}

class StateProfileStoreError implements StateProfileStore {}

class StateProfileStoreLoading implements StateProfileStore {}
