import 'package:dartz/dartz.dart';
import 'package:product_app/core/error/failure.dart';
import 'package:product_app/core/use_case/base_use_case.dart';
import 'package:product_app/domain/repo/Base_app_repo.dart';

import '../entities/base_product_cart_data.dart';

class GetProductsFromCartUseCase extends BaseUseCase<List<BaseProductCartData>,NoParameters>{
  final BaseAppRepository baseAppRepository;


  GetProductsFromCartUseCase(this.baseAppRepository);

  @override
  Future<Either<Failure, List<BaseProductCartData>>> call(NoParameters parameter)async {
   return await baseAppRepository.getProductsFromCart();
  }

}