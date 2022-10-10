import 'package:product_app/domain/entities/base_product_cart_data.dart';

class ProductCartDataModel extends BaseProductCartData {
  ProductCartDataModel(
      {required super.id,
      required super.price,
      required super.title,
      required super.description,
      required super.categoryName,
      required super.image});

  factory ProductCartDataModel.fromJson(Map<String,dynamic> json){
      return ProductCartDataModel(
          id: json["id"],
          price: json["price"],
          title: json["title"],
          description: json["description"],
          categoryName: json["categoryName"]??"",
          image: json["image"]);
  }
}
