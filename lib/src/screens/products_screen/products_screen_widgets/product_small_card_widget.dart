import 'package:flutter_vict_app/src/config/constants/language_map.dart';
import 'package:flutter_vict_app/src/config/routes/router_service.dart';
import 'package:flutter_vict_app/src/domain/entity/products_entity.dart';
import 'package:flutter_vict_app/src/screens/widgets/image_network_box_widget.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductSmallCardWidget extends StatelessWidget {
  final ProductEntity productItem;
  const ProductSmallCardWidget({super.key, required this.productItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          context.go('${AppRouter.pathproductPreviewScreen}/${productItem.id}'),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                productItem.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SizedBox(
                      height: 150,
                      width: 150,
                      child: ImageNetworkBoxWidget(
                          imgUrl: productItem.images.first),
                    )),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${LanguageMap.lngMap['psPriceText']} ${productItem.price}',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
