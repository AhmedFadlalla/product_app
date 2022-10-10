import 'package:product_app/domain/entities/base_product_category.dart';

class ProductCategoryDataModel extends BaseProductCategory {
  ProductCategoryDataModel(
      {required super.id, required super.name, required super.image});

  factory ProductCategoryDataModel.fromJson(Map<String,dynamic>json){
    return ProductCategoryDataModel(id: json["id"], name: json["name"], image:json["image"]);
  }
}
