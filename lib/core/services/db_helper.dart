import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:product_app/domain/entities/base_product_cart_data.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../../data/models/product_cart_data_model.dart';
import '../../data/models/product_data_model.dart';
class DatabaseHelper {
  static  const _databaseName = "cart.db";
  static const _databaseVersion = 1;
  static final table = "cart";
  static final columnID = "id";
  static final columnName1="title";
  static final columnName2="description";
  static final columnName3="price";
  static final columnName4="image";
  static Database? _database;
  // privateconstructor
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  Future<Database?> get database async {
    if (_database != null) return _database;

    // create a database if one doesn't exist
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = documentDirectory.path+_databaseName;
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('CREATE TABLE $table('
        '$columnID INTEGER PRIMARY KEY AUTOINCREMENT,'
        ' $columnName1 TEXT, '
        '$columnName2 TEXT,'
        '$columnName3 INTEGER,'
        '$columnName4 TEXT)');


  }

  Future <int?> insert(Map<String,dynamic> product ) async{
    Database? db = await instance.database;
    return await db!.insert(table, product);
  }

  Future <int?> deleteTodo(int id) async{
    Database? db = await instance.database;
    return await db?.delete(table, where: "id = ?", whereArgs: [id]);
  }

  Future <List<ProductCartDataModel>> queryAll() async{
    Database? db = await instance.database;
    List<Map<String,dynamic>> products= await db!.query(table);
    List<ProductCartDataModel> finalResult =[];
    products.forEach((element) {
      ProductCartDataModel results=ProductCartDataModel.fromJson(element);
      finalResult.add(results);

    });
    return finalResult;
  }

  Future<int> updateNote(Map<String,dynamic> product,id) async {
    Database? db = await instance.database;
    var result = await db!.update(table, product,
        where: '$columnID = ?', whereArgs: [id]);
    return result;
  }




}