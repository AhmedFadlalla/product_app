import 'package:equatable/equatable.dart';

class BaseProductCategory extends Equatable{
  final int id;
  final String name;
  final String image;


  BaseProductCategory({
   required this.id,
    required this.name,
    required  this.image});

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,name,image
  ];


}