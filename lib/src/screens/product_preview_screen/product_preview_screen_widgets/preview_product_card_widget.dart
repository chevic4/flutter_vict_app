import 'package:flutter/material.dart';
import 'package:flutter_vict_app/src/domain/entity/products_entity.dart';
import 'package:flutter_vict_app/src/screens/widgets/image_network_box_widget.dart';

class PreviewProductCardWidget extends StatelessWidget {
  final ProductEntity productEntity;
  const PreviewProductCardWidget({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        elevation: 40,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                    flex: 6,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        height: 350,
                        width: 350,
                        child: ImageNetworkBoxWidget(
                            imgUrl: productEntity.images.last,
                            boxFit: BoxFit.cover),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Flexible(
                    flex: 8,
                    child: Column(
                      children: [
                        // название
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            productEntity.title,
                            softWrap: true,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),

                        // категория
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            productEntity.category.name,
                            softWrap: true,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),

                        // цена
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            productEntity.price.toString(),
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              //  описание
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  productEntity.description,
                  maxLines: null,
                  overflow: TextOverflow.visible,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
