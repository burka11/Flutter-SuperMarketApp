import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:temel_widget/models/product.dart';

class DbHelper{
  Database _db;

  Future<Database> get db async{
    if(_db==null){
      _db = await intializeDb();
    }
    return _db;
  }

  Future<Database> intializeDb() async {
    String dbPath= join(await getDatabasesPath(),"etrade.db");
    var eTradeDb= await openDatabase(dbPath,version: 1,onCreate: creatDb);
    return eTradeDb;
  }

  void creatDb(Database db, int version) async{
    await db.execute("Create table Products(id integer primary key,name text,description text,unitPrice int)");
  }

  Future<List<Product>> getProducts() async{
    Database db = await this.db;
    var result = await db.query("Products");
    return List.generate(result.length, (i){
      return Product.fromObject(result[i]);
    });

  }

  Future<int> insert(Product Product) async{
    Database db = await this.db;
    var result = await db.insert(("Products"),Product.toMap());
  }

  Future<int> delete(int id) async{
    Database db = await this.db;
    var result = await db.rawDelete("delete from Products where id=$id ");
    return result;
  }

  Future<int> update(Product product) async{
    Database db = await this.db;
    var result = await db.update("products", product.toMap(),where: "id=?",whereArgs: [product.id]); //birçok veritabanında ? simgesi parametre anlamına gelir
    return result;
  }
}