import 'package:dartz/dartz.dart';
import 'package:product_app/core/error/failure.dart';
import 'package:product_app/core/use_case/base_use_case.dart';
import 'package:product_app/domain/entities/base_product_category.dart';
import 'package:product_app/domain/repo/Base_app_repo.dart';

class GetAllCategoriesUseCase extends BaseUseCase<List<BaseProductCategory>,NoParameters>{
  final BaseAppRepository baseAppRepository;


  GetAllCategoriesUseCase(this.baseAppRepository);

  @override
  Future<Either<Failure, List<BaseProductCategory>>> call(NoParameters parameter) async{
    return await baseAppRepository.getAllCategories();
  }
  
}