// Этот эндпоинт требует наличия access_token в заголовке Authorization.
// • Отобразите информацию:
// - Имя
// - Email
// - Аватар

import 'package:flutter_vict_app/src/domain/entity/profile_entity.dart';
import 'package:flutter_vict_app/src/domain/repository/profile_service_repository.dart';

class ProfileService {
  final ProfileServiceRepository profileServiceRepository;

  ProfileService({required this.profileServiceRepository});

  Future<ProfileEntity?> getProfile() async {
    return profileServiceRepository.getProfile();
  }
}
