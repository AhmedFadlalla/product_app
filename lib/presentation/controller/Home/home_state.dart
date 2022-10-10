import 'package:equatable/equatable.dart';
import 'package:product_app/core/utils/enum.dart';
import 'package:product_app/domain/entities/base_product_category.dart';
import 'package:product_app/domain/entities/base_product_data.dart';

import '../../../domain/entities/base_product_cart_data.dart';

class HomeState extends Equatable {
  final List<BaseProductData> productsData;
  final RequestState productsDataState;
  final String productsDataMessage;
  final List<BaseProductCategory> categoriesData;
  final RequestState categoriesDataState;
  final String categoriesDataMessage;
  final List<BaseProductData> categoryProductData;
  final RequestState categoryProductDataState;
  final String categoryProductDataMessage;
  final BaseProductData? productData;
  final RequestState productDataState;
  final String productDataMessage;
  final RequestState addProductToCartState;
  final String addProductToCartMessage;
  final List<BaseProductCartData> productCartData;
  final RequestState productCartDataState;
  final String productCartDataMessage;

  HomeState({
    this.productsData = const [],
    this.productsDataState = RequestState.loading,
    this.productsDataMessage = '',
    this.categoriesData = const [],
    this.categoriesDataState = RequestState.loading,
    this.categoriesDataMessage = '',
    this.categoryProductData = const [],
    this.categoryProductDataState = RequestState.loading,
    this.categoryProductDataMessage = '',
    this.productDataState=RequestState.loading,
    this.productDataMessage="",
    this.productData,
    this.addProductToCartState=RequestState.loading,
    this.addProductToCartMessage='',
    this.productCartData=const [],
    this.productCartDataState=RequestState.loading,
    this.productCartDataMessage=''
  });

  HomeState copyWith({
    List<BaseProductData>? productsData,
    RequestState? productsDataState,
    String? productsDataMessage,
    List<BaseProductCategory>? categoriesData,
    RequestState? categoriesDataState,
    String? categoriesDataMessage,
    List<BaseProductData>? categoryProductData,
    RequestState? categoryProductDataState,
    String? categoryProductDataMessage,
     BaseProductData? productData,
     RequestState? productDataState,
     String? productDataMessage,
    RequestState? addProductToCartState,
    String? addProductToCartMessage,
     List<BaseProductCartData>? productCartData,
     RequestState? productCartDataState,
     String? productCartDataMessage,
  }) {
    return HomeState(
        productsData: productsData ?? this.productsData,
        productsDataState: productsDataState ?? this.productsDataState,
        productsDataMessage: productsDataMessage ?? this.productsDataMessage,
        categoriesData: categoriesData ?? this.categoriesData,
        categoriesDataState: categoriesDataState ?? this.categoriesDataState,
        categoriesDataMessage: categoriesDataMessage ?? this.categoriesDataMessage,
      categoryProductData: categoryProductData ?? this.categoryProductData,
      categoryProductDataState: categoryProductDataState ?? this.categoryProductDataState,
      categoryProductDataMessage: categoryProductDataMessage ?? this.categoryProductDataMessage,
      productData: productData??this.productData,
      productDataState: productDataState??this.productDataState,
      productDataMessage: productDataMessage??this.productDataMessage,
      addProductToCartState: addProductToCartState??this.addProductToCartState,
      addProductToCartMessage: addProductToCartMessage??this.addProductToCartMessage,
        productCartData:productCartData??this.productCartData,
        productCartDataState:productCartDataState??this.productCartDataState,
        productCartDataMessage:productCartDataMessage??this.productCartDataMessage
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [
        productsData, productsDataState, productsDataMessage,
        categoriesData,categoriesDataState,categoriesDataMessage,
        categoryProductData,categoriesDataMessage,categoryProductDataState,
        addProductToCartMessage,addProductToCartState,
        productCartData,productCartDataState,productCartDataMessage
      ];
}
