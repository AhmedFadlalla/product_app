import 'package:equatable/equatable.dart';

class BaseUser extends Equatable{

  final int id;
  final String email;
  final String password;
  final String name;
  final String role;


  BaseUser({
  required  this.id,
    required  this.email,
    required  this.password,
    required  this.name,
    required  this.role
  });

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}