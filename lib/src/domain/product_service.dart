// 3. Главная страница (Список продуктов):
// • После успешной авторизации отображается список продуктов.
// • Используйте эндпоинт:
// - GET /products
// • Отобразите информацию:
// - Название продукта
// - Цена
// - Картинка
// • Реализуйте возможность фильтрации по категориям.
// 4. Просмотр продукта:
// • При нажатии на продукт открывается страница с детальной информацией о нём.
// • Используйте эндпоинт:
// - GET /products/{id}
// • Отобразите:
// - Название
// - Описание
// - Картинку
// - Категорию
// - Цена
import 'package:flutter_vict_app/src/domain/entity/products_entity.dart';
import 'package:flutter_vict_app/src/domain/repository/products_service_repository.dart';

class ProductService {
  final ProductsServiceRepository productsServiceRepository;

  ProductService({required this.productsServiceRepository});

  Future<List<ProductEntity>?> getProductList() async {
    return productsServiceRepository.getProductList();
  }

  Future<ProductEntity?> getProductId(int id) async {
    return productsServiceRepository.getProductById(id: id);
  }
}
