import 'package:product_app/core/services/db_helper.dart';
import 'package:product_app/core/utils/constrant.dart';
import 'package:product_app/data/models/product_cart_data_model.dart';
import 'package:product_app/data/models/product_data_model.dart';

abstract class BaseLocalDataSource {
  Future<void> addProductToCart(ProductParameter parameter);
  Future<List<ProductCartDataModel>> getProductFromCart();
}

class LocalDataSource extends BaseLocalDataSource {
  DatabaseHelper databaseHelper = DatabaseHelper.instance;
  @override
  Future<void> addProductToCart(ProductParameter parameter)async{

    Map<String,dynamic> product={
      DatabaseHelper.columnName1:parameter.title,
      DatabaseHelper.columnName2:parameter.description,
      DatabaseHelper.columnName3:parameter.price,
      DatabaseHelper.columnName4:parameter.image,
    };
    await databaseHelper.insert(product);
  }

  @override
  Future<List<ProductCartDataModel>> getProductFromCart() async{

    return databaseHelper.queryAll() ;
  }

}