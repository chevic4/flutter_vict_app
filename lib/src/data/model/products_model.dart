import 'package:flutter_vict_app/src/domain/entity/products_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel(
      {required super.id,
      required super.title,
      required super.price,
      required super.description,
      required super.images,
      required super.creationAt,
      required super.updatedAt,
      required super.category});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
      images: List<String>.from(json['images'].map((i) => i.toString())),
      creationAt: DateTime.parse(json['creationAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      category: CategoryModel.fromJson(json['category']),
    );
  }
}

class CategoryModel extends CategoryEntity {
  CategoryModel(
      {required super.id,
      required super.name,
      required super.image,
      required super.creationAt,
      required super.updatedAt});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      creationAt: DateTime.parse(json['creationAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
