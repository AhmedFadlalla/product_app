import 'package:dartz/dartz.dart';
import 'package:product_app/core/utils/constrant.dart';
import 'package:product_app/domain/entities/base_product_category.dart';
import 'package:product_app/domain/entities/base_product_data.dart';

import '../../core/error/failure.dart';
import '../entities/base_product_cart_data.dart';
import '../entities/base_user.dart';

abstract class BaseAppRepository {

  Future<Either<Failure, void>> userRegister(UserParameter parameter);
  Future<Either<Failure, String>> userLogin(UserParameter parameter);
  Future<Either<Failure, List<BaseProductData>>> getAllProducts();
  Future<Either<Failure, BaseProductData>> getProductData(CategoryParameter parameter);
  Future<Either<Failure, List<BaseProductCategory>>> getAllCategories();
  Future<Either<Failure, List<BaseProductData>>> getCategoryProducts(CategoryParameter parameter);
  Future<Either<Failure, void>> addProductToCart(ProductParameter parameter);
  Future<Either<Failure, List<BaseProductCartData>>> getProductsFromCart();
}