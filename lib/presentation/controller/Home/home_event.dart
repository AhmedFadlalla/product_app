import 'package:equatable/equatable.dart';

abstract class BaseHomeEvent extends Equatable{


  @override
  List<Object?> get props => [];

  BaseHomeEvent();
}
class GetAllProductsEvent extends BaseHomeEvent{}
class GetAllCategoriesEvent extends BaseHomeEvent{}
class GetAllCategoryProductEvent extends BaseHomeEvent{
  final int id;

  GetAllCategoryProductEvent({
    required this.id
  });
}
class GetProductDataEvent extends BaseHomeEvent{
  final int id;

  GetProductDataEvent({
    required this.id
  });
}

class AddProductToCartEvent extends BaseHomeEvent{
  final int id,price;
  final String title,description;
  final String category;
  final String  image;
  AddProductToCartEvent({
    required this.id,
    required this.price,
    required this.title,
    required this.description,
    required this.image,
    required this.category
  });
}

class GetProductsFromCartEvent extends BaseHomeEvent{}
