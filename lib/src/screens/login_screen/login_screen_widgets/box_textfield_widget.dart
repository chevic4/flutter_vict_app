import 'package:flutter/material.dart';
import 'package:flutter_vict_app/src/config/constants/app_colors.dart';

class BoxTextFieldWidget extends StatelessWidget {
  final Widget childWidget;
  const BoxTextFieldWidget({
    super.key,
    required this.childWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.textfieldBackgroundC,
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: childWidget),
    );
  }
}
