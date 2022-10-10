import 'dart:convert';
import 'dart:io';

import 'package:product_app/core/error/exceptions.dart';
import 'package:product_app/core/network/error_message_model.dart';
import 'package:product_app/core/network/error_result_model.dart';
import 'package:product_app/core/utils/app_constant.dart';
import 'package:product_app/core/utils/constrant.dart';
import 'package:product_app/data/models/product_category_data_model.dart';

import '../models/product_data_model.dart';
import '../models/user_data_model.dart';
import 'package:dio/dio.dart';
abstract class BaseRemoteDataSource{

  Future<void> userRegister(UserParameter parameter);
  Future<String> userLogin(UserParameter parameter);
  Future<List<ProductDataModel>> getAllProducts();
  Future<ProductDataModel> getProductData(CategoryParameter parameter);
  Future<List<ProductCategoryDataModel>> getAllCategories();
  Future<List<ProductDataModel>> getAllCategoryProduct(CategoryParameter parameter);
}
class RemoteDataSource extends BaseRemoteDataSource{
  @override
  Future<void> userRegister(UserParameter parameter) async{
    await Dio().post(
        AppContances.userRegister,
       queryParameters:{
         "email":parameter.email,
         "password":parameter.password,
         "name":parameter.name,
       }
    );



  }

  @override
  Future<String> userLogin(UserParameter parameter) async{
    final response=await Dio().post(
      AppContances.userLogin,
      options: Options(
        headers: {
          HttpHeaders.cacheControlHeader:"application/json"
        }
      ),
      data:jsonEncode( {
        "email":parameter.email,
        "password":parameter.password,
      })
    );


    if(response.statusCode==201){
      return response.data["access_token"];
    }else{
      throw  ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<ProductDataModel>> getAllProducts() async{
   final response=await Dio().get(AppContances.getProducts);

   if(response.statusCode==200){
     return List<ProductDataModel>.from((response.data as List).map((e)=> ProductDataModel.fromJson(e)));
   }else{
     throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
   }
  }

  @override
  Future<List<ProductCategoryDataModel>> getAllCategories()async {
    final response=await Dio().get(AppContances.getCategories);
    if(response.statusCode==200){
      return List<ProductCategoryDataModel>.from((response.data as List).map((e)=> ProductCategoryDataModel.fromJson(e)));
    }else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<ProductDataModel>> getAllCategoryProduct(CategoryParameter parameter) async{
   final response=await Dio().get(AppContances.getCategoriesProducts(parameter.id));

   if(response.statusCode==200){
     return List<ProductDataModel>.from((response.data as List).map((e) => ProductDataModel.fromJson(e)));
   }
   else{
     throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
   }

  }

  @override
  Future<ProductDataModel> getProductData(CategoryParameter parameter) async{
  final response=await Dio().get(AppContances.getProductData(parameter.id));

  if(response.statusCode==200){
    return  ProductDataModel.fromJson(response.data);
  }
  else{
    throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
  }
  }

}