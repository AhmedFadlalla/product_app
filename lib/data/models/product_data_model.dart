import 'package:product_app/data/models/product_category_data_model.dart';
import 'package:product_app/domain/entities/base_product_data.dart';

class ProductDataModel extends BaseProductData {
  ProductDataModel({required super.id,
    required super.price,
    required super.categoryId,
    required super.title,
    required super.description,
    required super.productCategory,
    required super.images});


  factory ProductDataModel.fromJson(Map<String, dynamic>json){
    return ProductDataModel(
        id: json["id"],
        price: json["price"],
        categoryId:json["categoryId"]??0,
        title:json["title"] ,
        description:json["description"] ,
        productCategory:ProductCategoryDataModel.fromJson(json["category"]),
        images: json["images"]);
  }
}
