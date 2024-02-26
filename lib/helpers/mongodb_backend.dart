// Implémenter un connecteur MongoDB

import 'package:mongo_dart/mongo_dart.dart';

// save db url
const String url = 'mongodb+srv://test:<Mnfztd7afMkwuZLR>@cluster0.bxcj4ck.mongodb.net/?retryWrites=true&w=majority';

class MongoDBHelper{
  // create a private constructor
  MongoDBHelper._();

  // create a static instance of MongoDBHelper
  static final MongoDBHelper instance = MongoDBHelper._();

  // create a private instance of Db
  Db? _db;

  // create a getter for _db
  Db get db => _db!;

  // create a method to initialize the database
  Future<bool> init() async {
    // check if _db is null
    if (_db == null) {
      // create a new instance of Db
      _db = await Db(url);
      await _db!.open();

      // Try if Collection exists
      try {
        await _db!.collection('users').find().toList();
      } catch (e) {
        // Create Collection
        await _db!.createCollection('users');
      }

      return true;
    }
    return false;
  }
}