import 'package:dartz/dartz.dart';
import 'package:product_app/core/error/failure.dart';
import 'package:product_app/core/use_case/base_use_case.dart';
import 'package:product_app/domain/entities/base_product_data.dart';
import 'package:product_app/domain/repo/Base_app_repo.dart';

import '../../core/utils/constrant.dart';

class GetProductDataUseCase extends BaseUseCase<BaseProductData,CategoryParameter>{
  final BaseAppRepository baseAppRepository;


  GetProductDataUseCase(this.baseAppRepository);

  @override
  Future<Either<Failure, BaseProductData>> call(CategoryParameter parameter) async{
    return await baseAppRepository.getProductData(parameter);
  }



}