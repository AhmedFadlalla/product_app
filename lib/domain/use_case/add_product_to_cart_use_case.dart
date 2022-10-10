import 'package:dartz/dartz.dart';
import 'package:product_app/core/error/failure.dart';
import 'package:product_app/core/use_case/base_use_case.dart';
import 'package:product_app/core/utils/constrant.dart';
import 'package:product_app/domain/repo/Base_app_repo.dart';

class AddProductToCartUseCase extends BaseUseCase<void,ProductParameter>{
  final BaseAppRepository baseAppRepository;


  AddProductToCartUseCase(this.baseAppRepository);

  @override
  Future<Either<Failure, void>> call(ProductParameter parameter) async{
   return await baseAppRepository.addProductToCart(parameter);
  }


}