import 'package:equatable/equatable.dart';
import 'package:product_app/domain/entities/base_product_category.dart';

class BaseProductData extends Equatable{

  final int id,price,categoryId;
  final String title,description;
  final BaseProductCategory productCategory;
  final List<dynamic> images;


  BaseProductData(
      {
        required this.id,
        required  this.price,
        required  this.categoryId,
        required  this.title,
        required  this.description,
        required  this.productCategory,
        required  this.images});

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,price,categoryId,title,description,productCategory,images
  ];

}