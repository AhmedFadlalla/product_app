import 'package:dartz/dartz.dart';
import 'package:product_app/core/error/failure.dart';
import 'package:product_app/core/use_case/base_use_case.dart';
import 'package:product_app/core/utils/constrant.dart';
import 'package:product_app/domain/entities/base_user.dart';
import 'package:product_app/domain/repo/Base_app_repo.dart';

class UserRegisterUseCase extends BaseUseCase<void,UserParameter>{
  final BaseAppRepository baseAppRepository;


  UserRegisterUseCase(this.baseAppRepository);

  @override
  Future<Either<Failure, void>> call(UserParameter parameter)async {
    return await baseAppRepository.userRegister(parameter);
  }

}