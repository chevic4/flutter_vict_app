import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vict_app/components/netwoking_service/networking_service.dart';
import 'package:flutter_vict_app/components/storage_service/storage_service_lib.dart';
import 'package:flutter_vict_app/src/data/mapper/profile_mapper.dart';
import 'package:flutter_vict_app/src/data/model/profile_model.dart';
import 'package:flutter_vict_app/src/domain/entity/profile_entity.dart';
import 'package:flutter_vict_app/src/domain/repository/profile_service_repository.dart';

class ProfileServiceRepositoryImpl implements ProfileServiceRepository {
  ProfileServiceRepositoryImpl({
    required this.networkingService,
    required this.storageService,
  });

  @override
  NetworkingService networkingService;

  @override
  StorageService storageService;

  @override
  Future<ProfileEntity?> getProfile() async {
    // берем токен
    try {
      final tokenStorage = await storageService.getTokenEntity();
      if (tokenStorage == null) {
        debugPrint('error on get TOKEN ProfileServiceRepositoryImpl');
        return null;
      } else {
        // получаем данные пользователя
        final networkData = await networkingService.getUserProfile(
            token: tokenStorage.accessToken);
        if (networkData.$1 != null) {
          debugPrint(networkData.$1.toString());
          return null;
        } else {
          final profileModel = ProfileModel.fromJson(networkData.$2!);
          return ProfileMapper.modelToEnity(profileModel);
        }
      }
    } catch (e) {
      debugPrint('error on get TOKEN ProfileServiceRepositoryImpl - $e');
      return null;
    }
  }
}
