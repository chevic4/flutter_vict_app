import 'package:flutter/material.dart';
import 'package:flutter_vict_app/src/config/constants/app_colors.dart';

class ImageNetworkBoxWidget extends StatelessWidget {
  final String imgUrl;
  final BoxFit? boxFit;

  const ImageNetworkBoxWidget({super.key, required this.imgUrl, this.boxFit});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        imgUrl,
        fit: boxFit,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.appbarC.withOpacity(0.5),
            ),
          );
        },
      ),
    );
  }
}
