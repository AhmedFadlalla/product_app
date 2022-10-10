import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:product_app/core/use_case/base_use_case.dart';
import 'package:product_app/core/utils/constrant.dart';
import 'package:product_app/core/utils/enum.dart';
import 'package:product_app/domain/use_case/get_product_data_use_case.dart';
import 'package:product_app/domain/use_case/get_products_from_cart_use_case.dart';
import 'package:product_app/presentation/controller/Home/home_event.dart';

import '../../../domain/use_case/add_product_to_cart_use_case.dart';
import '../../../domain/use_case/get_all_categories_use_case.dart';
import '../../../domain/use_case/get_all_products_use_case.dart';
import '../../../domain/use_case/get_category_products_use_case.dart';
import 'home_state.dart';


class HomeBloc extends Bloc<BaseHomeEvent, HomeState> {
  final GetAllProductsUseCase getAllProductsUseCase;
  final GetAllCategoriesUseCase getAllCategoriesUseCase;
  final GetCategoryProductsUseCase getCategoryProductsUseCase;
  final GetProductDataUseCase getProductDataUseCase;
  final AddProductToCartUseCase addProductToCartUseCase;
  final GetProductsFromCartUseCase getProductsFromCartUseCase;
  HomeBloc(this.getAllProductsUseCase,
      this.getAllCategoriesUseCase,
      this.getCategoryProductsUseCase,
      this.getProductDataUseCase,
      this.addProductToCartUseCase,
      this.getProductsFromCartUseCase
      ) : super(HomeState()) {
    on<GetAllProductsEvent>((event, emit) async {
      final result = await getAllProductsUseCase(const NoParameters());

      result.fold((l) =>
          emit(
              state.copyWith(
                  productsDataState: RequestState.error,
                  productsDataMessage: l.message
              )
          ), (r) =>
          emit(
              state.copyWith(
                  productsData: r,
                  productsDataState: RequestState.loaded
              )
          ));
    });
    on<GetAllCategoriesEvent>((event, emit) async {
      final result = await getAllCategoriesUseCase(const NoParameters());

      result.fold((l) =>
          emit(
              state.copyWith(
                  categoriesDataState: RequestState.error,
                  categoriesDataMessage: l.message
              )
          ), (r) =>
          emit(
              state.copyWith(
                  categoriesData: r,
                  categoriesDataState: RequestState.loaded
              )
          ));
    });
    on<GetAllCategoryProductEvent>((event, emit) async {
      final result = await getCategoryProductsUseCase(
          CategoryParameter(id: event.id));
      result.fold((l) =>
          emit(
              state.copyWith(
                  categoryProductDataState: RequestState.error,
                  categoryProductDataMessage: l.message
              )
          ), (r) =>
          emit(
              state.copyWith(
                  categoryProductData: r,
                  categoryProductDataState: RequestState.loaded
              )
          ));
    });
    on<GetProductDataEvent>((event, emit) async {
      final result = await getProductDataUseCase(
          CategoryParameter(id: event.id));
      result.fold((l) =>
          emit(
              state.copyWith(
                  productDataState: RequestState.error,
                  productDataMessage: l.message
              )
          ), (r) =>
          emit(
              state.copyWith(
                  productData: r,
                  productDataState: RequestState.loaded
              )
          ));
    });
    on<AddProductToCartEvent>((event, emit) async {
      final result = await addProductToCartUseCase(
          ProductParameter(id: event.id,
              price: event.price,
              title: event.title,
              description: event.description,
              image: event.image,
              category: event.category));
      result.fold((l) =>
          emit(
              state.copyWith(
                  addProductToCartState: RequestState.error,
                  addProductToCartMessage: l.message
              )
          ), (r) =>
          emit(
              state.copyWith(
                  addProductToCartState: RequestState.loaded
              )
          ));
    });
    on<GetProductsFromCartEvent>((event, emit) async{
      final result=await getProductsFromCartUseCase(const NoParameters());
      result.fold((l) =>
          emit(
              state.copyWith(
                  productCartDataState: RequestState.error,
                  productCartDataMessage: l.message
              )
          ), (r) =>
          emit(
              state.copyWith(
                  productCartDataState: RequestState.loaded,
                productCartData: r
              )
          ));
    });
  }
}
