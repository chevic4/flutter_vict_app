import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_vict_app/src/config/constants/language_map.dart';
import 'package:flutter_vict_app/src/config/routes/router_service.dart';
import 'package:flutter_vict_app/src/config/setup.dart';
import 'package:flutter_vict_app/src/domain/auth_service_cubit.dart';
import 'package:flutter_vict_app/src/domain/product_service.dart';
import 'package:flutter_vict_app/src/screens/products_screen/products_screen_widgets/icon_change_sorting_widget.dart';
import 'package:flutter_vict_app/src/screens/products_screen/products_screen_widgets/product_screen_body_widget.dart';
import 'package:flutter_vict_app/src/screens/products_screen/products_screen_store/products_screen_store.dart';

import 'package:flutter/material.dart';
import 'package:flutter_vict_app/src/screens/widgets/app_container_width_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  late ProductsScreenStore productsScreenStore;

  @override
  void didChangeDependencies() {
    final productService = locator.get<ProductService>();
    productsScreenStore = ProductsScreenStore(productService: productService);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Provider<ProductsScreenStore>.value(
      value: productsScreenStore,
      child: Builder(
        builder: (context) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text(LanguageMap.lngMap['psTitle']),
                centerTitle: true,
                actions: [
                  const IconsChangeSortingWidget(),
                  IconButton(
                    onPressed: () => context.push(AppRouter.pathProfileScreen),
                    icon: const Icon(Icons.person),
                  ),
                  IconButton(
                    onPressed: () => context.read<AuthCubit>().logout(),
                    icon: const Icon(Icons.exit_to_app),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
              SliverToBoxAdapter(
                child: AppContainerWidhthWidget(
                  child: Observer(
                    builder: (context) {
                      return switch (productsScreenStore.stateStore) {
                        (StateProductsStoreLoading()) => Center(
                            child: Text(LanguageMap.lngMap['psloadingText'])),
                        (StateProductsStoreOk()) => const ProductsBodyWidget(),
                        _ => Center(
                            child: Text(LanguageMap.lngMap['psErrorText'])),
                      };
                    },
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
