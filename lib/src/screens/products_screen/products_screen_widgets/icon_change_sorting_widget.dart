import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_vict_app/src/screens/products_screen/products_screen_store/products_screen_store.dart';
import 'package:provider/provider.dart';

class IconsChangeSortingWidget extends StatelessWidget {
  const IconsChangeSortingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final productsScreenStore = Provider.of<ProductsScreenStore>(context);
    return Observer(
      builder: (context) {
        return productsScreenStore.showButtonSorting
            ? IconButton(
                onPressed: () => productsScreenStore.sortProductsByCategory(),
                icon: const Icon(Icons.abc),
              )
            : Container();
      },
    );
  }
}
