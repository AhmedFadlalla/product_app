import 'package:equatable/equatable.dart';

class BaseProductCartData extends Equatable{
  final int id,price;
  final String title,description,categoryName,image;


  BaseProductCartData(
      {
        required this.id,
        required  this.price,
        required  this.title,
        required   this.description,
        required   this.categoryName,
        required   this.image});

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,price,title,description,categoryName,image
  ];
}