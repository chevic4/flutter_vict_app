import 'package:flutter_vict_app/components/netwoking_service/networking_service.dart';
import 'package:flutter_vict_app/components/storage_service/storage_service_lib.dart';
import 'package:flutter_vict_app/src/domain/entity/profile_entity.dart';

abstract interface class ProfileServiceRepository {
  final NetworkingService networkingService;
  final StorageService storageService;

  ProfileServiceRepository(
      {required this.networkingService, required this.storageService});

  Future<ProfileEntity?> getProfile();
}
