import 'package:dartz/dartz.dart';
import 'package:product_app/core/error/failure.dart';
import 'package:product_app/core/use_case/base_use_case.dart';
import 'package:product_app/domain/entities/base_product_data.dart';
import 'package:product_app/domain/repo/Base_app_repo.dart';

class GetAllProductsUseCase extends BaseUseCase<List<BaseProductData>,NoParameters>{
  final BaseAppRepository baseAppRepository;


  GetAllProductsUseCase(this.baseAppRepository);

  @override
  Future<Either<Failure, List<BaseProductData>>> call(NoParameters parameter)async {
    return await baseAppRepository.getAllProducts();
  }

}