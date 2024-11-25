import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_vict_app/src/config/constants/app_colors.dart';
import 'package:flutter_vict_app/src/config/constants/language_map.dart';
import 'package:flutter_vict_app/src/config/setup.dart';
import 'package:flutter_vict_app/src/domain/product_service.dart';
import 'package:flutter_vict_app/src/screens/product_preview_screen/product_preview_screen_store/product_preview_screen_store.dart';
import 'package:flutter_vict_app/src/screens/product_preview_screen/product_preview_screen_widgets/preview_product_card_widget.dart';
import 'package:flutter_vict_app/src/screens/widgets/app_container_width_widget.dart';

class ProductPreviewScreen extends StatelessWidget {
  const ProductPreviewScreen({super.key, required this.idProduct});
  final String? idProduct;

  @override
  Widget build(BuildContext context) {
    final productService = locator.get<ProductService>();
    final previewScreenStore = ProductPreviewScreenStore(
        pageId: idProduct, productService: productService);
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BackButton(
            onPressed: () => Navigator.pop(context, false),
          ),
        ),
      ),
      body: AppContainerWidhthWidget(
        child: Observer(
          builder: (context) {
            return switch (previewScreenStore.stateStore) {
              (StateProductPreviewLoading()) =>
                Text(LanguageMap.lngMap['pspLoading']),
              (StateProductPreviewStoreOk()) => PreviewProductCardWidget(
                  productEntity: previewScreenStore.productEntity!),
              _ => Center(
                  child: Text(
                    LanguageMap.lngMap['pspError'],
                    style: TextStyle(color: AppColors.textErrorC),
                  ),
                ),
            };
          },
        ),
      ),
    );
  }
}
