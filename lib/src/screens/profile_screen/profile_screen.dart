import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_vict_app/src/config/constants/language_map.dart';
import 'package:flutter_vict_app/src/config/setup.dart';
import 'package:flutter_vict_app/src/domain/profile_service.dart';
import 'package:flutter_vict_app/src/screens/profile_screen/profile_screen_store/profile_screen_store.dart';
import 'package:flutter_vict_app/src/screens/profile_screen/profile_screen_widgets/error_text_widget.dart';
import 'package:flutter_vict_app/src/screens/profile_screen/profile_screen_widgets/profile_card_widget.dart';
import 'package:flutter_vict_app/src/screens/widgets/app_container_width_widget.dart';
import 'package:go_router/go_router.dart';

// 5. Отображение профиля:
// • Добавьте раздел «Профиль» (может быть в верхнем меню или сбоку).
// • Используйте эндпоинт:
// - GET /auth/profile

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ProfileScreenStore profileScreenStore;
  @override
  void didChangeDependencies() {
    final profileService = locator.get<ProfileService>();
    profileScreenStore = ProfileScreenStore(profileService: profileService);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LanguageMap.lngMap['profTitle']),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () => context.pop()),
        ),
      ),
      body: AppContainerWidhthWidget(
        child: Observer(
          builder: (context) {
            return switch (profileScreenStore.stateStore) {
              (StateProfileStoreLoading()) =>
                Center(child: Text(LanguageMap.lngMap['profload'])),
              (StateProfileStoreOk()) => ProfileCardWidget(
                  profileEntity: profileScreenStore.profileEntity!),
              _ => Center(
                  child: ErrorTextWidgtet(
                      textString: LanguageMap.lngMap['profError'])),
            };
          },
        ),
      ),
    );
  }
}
