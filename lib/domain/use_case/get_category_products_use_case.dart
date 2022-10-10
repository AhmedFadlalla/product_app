import 'package:dartz/dartz.dart';
import 'package:product_app/core/error/failure.dart';
import 'package:product_app/core/use_case/base_use_case.dart';
import 'package:product_app/core/utils/constrant.dart';
import 'package:product_app/domain/entities/base_product_data.dart';
import 'package:product_app/domain/repo/Base_app_repo.dart';

class GetCategoryProductsUseCase extends BaseUseCase<List<BaseProductData>,CategoryParameter>{
  final BaseAppRepository baseAppRepository;


  GetCategoryProductsUseCase(this.baseAppRepository);

  @override
  Future<Either<Failure, List<BaseProductData>>> call(CategoryParameter parameter) async{
    return await baseAppRepository.getCategoryProducts(parameter);
  }

}