import 'package:flutter/material.dart';
import 'package:flutter_vict_app/src/config/constants/app_colors.dart';
import 'package:flutter_vict_app/src/config/constants/language_map.dart';
import 'package:flutter_vict_app/src/config/routes/router_state.dart';

class ErrorMessagesWidget extends StatelessWidget {
  final AuthState authState;
  const ErrorMessagesWidget({super.key, required this.authState});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        switch (authState) {
          AuthStateErrorInvalidLogPaswd() =>
            LanguageMap.lngMap['lsInvaidLoginPassw'],
          AuthStateErrorUnregisteredUser() =>
            LanguageMap.lngMap['lsUnregistered'],
          AuthStateErrorNetwork() => LanguageMap.lngMap['sNetError'],
          AuthStateErrorUnknown() => LanguageMap.lngMap['lsUnknownError'],
          _ => '',
        },
        style: TextStyle(color: AppColors.textErrorC),
      ),
    );
  }
}