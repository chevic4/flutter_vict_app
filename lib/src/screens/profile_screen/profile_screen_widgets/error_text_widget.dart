import 'package:flutter/material.dart';
import 'package:flutter_vict_app/src/config/constants/app_colors.dart';

class ErrorTextWidgtet extends StatelessWidget {
  final String textString;
  const ErrorTextWidgtet({super.key, required this.textString});

  @override
  Widget build(BuildContext context) {
    return Text(
      textString,
      style: TextStyle(color: AppColors.textErrorC),
    );
  }
}
