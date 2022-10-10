import 'package:product_app/domain/entities/base_user.dart';

class UserDataModel extends BaseUser {
  UserDataModel(
      {required super.id,
      required super.email,
      required super.password,
      required super.name,
      required super.role});


  factory UserDataModel.fromJson(Map<String,dynamic> json){
    return UserDataModel(
        id: json["id"],
        email: json["email"],
        password:json["password"] ,
        name: json["name"],
        role:json["role"]);
  }
}
