import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

import 'package:iromikke/service/database_service.dart';

class UserDatabase extends DatabaseService {

  static DatabaseService _instance;
  static Database _database;
  static final String _name = "user.db";

  UserDatabase._();

  factory UserDatabase(){
    if (_instance == null) {
      _instance = UserDatabase._();
    }

    return _instance;
  }

  static DatabaseService getInstance() => _instance;

  String get name => _name;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await init();

    return _database;
  }

}