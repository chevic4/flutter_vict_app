import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_vict_app/src/config/constants/language_map.dart';
import 'package:flutter_vict_app/src/screens/products_screen/products_screen_store/products_screen_store.dart';
import 'package:flutter_vict_app/src/screens/products_screen/products_screen_widgets/product_small_card_widget.dart';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ProductsBodyWidget extends StatelessWidget {
  const ProductsBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final productsScreenStore = Provider.of<ProductsScreenStore>(context);
    return productsScreenStore.listProducts.isEmpty
        ? Text(LanguageMap.lngMap['psEmptyListText'])
        : Observer(builder: (_) {
            return ListView.builder(
              itemCount: productsScreenStore.listProducts.length,
              itemBuilder: (context, itemCount) => Padding(
                padding: const EdgeInsets.all(16.0),
                child: ProductSmallCardWidget(
                  productItem: productsScreenStore.listProducts[itemCount],
                ),
              ),
            );
          });
  }
}
