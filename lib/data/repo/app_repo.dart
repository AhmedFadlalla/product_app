import 'package:dartz/dartz.dart';
import 'package:product_app/core/error/failure.dart';
import 'package:product_app/core/utils/constrant.dart';
import 'package:product_app/data/data_source/remote_data_source.dart';
import 'package:product_app/domain/entities/base_product_cart_data.dart';
import 'package:product_app/domain/entities/base_product_category.dart';
import 'package:product_app/domain/entities/base_product_data.dart';
import 'package:product_app/domain/entities/base_user.dart';
import 'package:product_app/domain/repo/Base_app_repo.dart';

import '../data_source/base_local_data_source.dart';

class AppRepository extends BaseAppRepository{
  final BaseRemoteDataSource baseRemoteDataSource;
  final BaseLocalDataSource baseLocalDataSource;
  AppRepository(this.baseRemoteDataSource,this.baseLocalDataSource);

  @override
  Future<Either<Failure, void>> userRegister(UserParameter parameter) async{
  final result=await baseRemoteDataSource.userRegister(parameter);

  try{
    return Right(print("Register Successfully"));
  }on ServerFailure catch(failure){
    return Left(ServerFailure(failure.message));
  }
  }

  @override
  Future<Either<Failure, String>> userLogin(UserParameter parameter) async{
    final result=await baseRemoteDataSource.userLogin(parameter);
    try{
      print("success");
      return Right(result);

    }on ServerFailure catch(failure){
      return Left(ServerFailure(failure.message));
    }

  }

  @override
  Future<Either<Failure, List<BaseProductData>>> getAllProducts() async{
    final result=await baseRemoteDataSource.getAllProducts();
    try{
      return Right(result);

    }on ServerFailure catch(failure){
      return Left(ServerFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, List<BaseProductCategory>>> getAllCategories() async{
    final result=await baseRemoteDataSource.getAllCategories();
    try{
      return Right(result);

    }on ServerFailure catch(failure){
      return Left(ServerFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, List<BaseProductData>>> getCategoryProducts(CategoryParameter parameter) async {
  final result=await baseRemoteDataSource.getAllCategoryProduct(parameter);
  try{
    return Right(result);

  }on ServerFailure catch(failure){
    return Left(ServerFailure(failure.message));
  }
  }

  @override
  Future<Either<Failure, BaseProductData>> getProductData(CategoryParameter parameter) async{
    final result=await baseRemoteDataSource.getProductData(parameter);
    try{
      return Right(result);

    }on ServerFailure catch(failure){
      return Left(ServerFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, void>> addProductToCart(ProductParameter parameter) async{
    await baseLocalDataSource.addProductToCart(parameter);
    try{
      return Right(print("Add Successfully"));

    }on DatabaseFailure catch (failure){
      return Left(DatabaseFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, List<BaseProductCartData>>> getProductsFromCart() async{
   final result=await baseLocalDataSource.getProductFromCart();
   try{
     return Right(result);

   }on DatabaseFailure catch (failure){
     return Left(DatabaseFailure(failure.message));
   }

  }

}