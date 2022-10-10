
import 'package:get_it/get_it.dart';
import 'package:product_app/data/data_source/base_local_data_source.dart';
import 'package:product_app/data/data_source/remote_data_source.dart';
import 'package:product_app/data/repo/app_repo.dart';
import 'package:product_app/domain/repo/Base_app_repo.dart';
import 'package:product_app/domain/use_case/add_product_to_cart_use_case.dart';
import 'package:product_app/domain/use_case/get_all_products_use_case.dart';
import 'package:product_app/domain/use_case/get_products_from_cart_use_case.dart';
import 'package:product_app/domain/use_case/user_login_use_case.dart';
import 'package:product_app/domain/use_case/user_register_use_case.dart';
import 'package:product_app/presentation/controller/Home/home_bloc.dart';
import 'package:product_app/presentation/controller/Home/home_event.dart';

import '../../domain/use_case/get_all_categories_use_case.dart';
import '../../domain/use_case/get_category_products_use_case.dart';
import '../../domain/use_case/get_product_data_use_case.dart';
import '../../presentation/controller/register_bloc/register_bloc.dart';


final sl=GetIt.instance;
class ServicesLocator{
  void init(){
    //Bloc

    sl.registerFactory<RegisterBloc>(() => RegisterBloc(sl(),sl()));
    sl.registerFactory<HomeBloc>(() => HomeBloc(sl(),sl(),sl(),sl(),sl(),sl()));
    // كل ما بنادي ع بلوك هيعمل نيو اوبجكت علشان يجيب الداتا جديده
    //use case
    sl.registerLazySingleton<UserRegisterUseCase>(() =>UserRegisterUseCase(sl()) );
    sl.registerLazySingleton<UserLoginUseCase>(() =>UserLoginUseCase(sl()) );
    sl.registerLazySingleton<GetAllProductsUseCase>(() =>GetAllProductsUseCase(sl()) );
    sl.registerLazySingleton<GetAllCategoriesUseCase>(() =>GetAllCategoriesUseCase(sl()) );
    sl.registerLazySingleton<GetCategoryProductsUseCase>(() =>GetCategoryProductsUseCase(sl()) );
    sl.registerLazySingleton<GetProductDataUseCase>(() =>GetProductDataUseCase(sl()) );
    sl.registerLazySingleton<AddProductToCartUseCase>(() =>AddProductToCartUseCase(sl()) );
    sl.registerLazySingleton<GetProductsFromCartUseCase>(() =>GetProductsFromCartUseCase(sl()) );
    //Repository
    sl.registerLazySingleton<BaseAppRepository>(() => AppRepository(sl(),sl()));
    //data source

    sl.registerLazySingleton<BaseRemoteDataSource>(() => RemoteDataSource());
    sl.registerLazySingleton<BaseLocalDataSource>(() => LocalDataSource());
  }

}