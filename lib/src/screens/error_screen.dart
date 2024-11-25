import 'package:flutter/material.dart';
import 'package:flutter_vict_app/src/config/constants/language_map.dart';
import 'package:flutter_vict_app/src/config/routes/router_service.dart';
import 'package:go_router/go_router.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, required this.errorText});
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(errorText ?? LanguageMap.lngMap['errorTxt']),
        ),
        FilledButton(
          onPressed: () => context.go(AppRouter.pathInitScreen),
          child: Text(LanguageMap.lngMap['okbtn']),
        ),
      ],
    );
  }
}
