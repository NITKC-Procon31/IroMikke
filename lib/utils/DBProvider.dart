import 'dart:io';
import 'dart:typed_data';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:flutter/services.dart' show rootBundle;

class DBProvider {

  static DBProvider _instance;
  static Database _database;

  DBProvider._();

  factory DBProvider(){
    if(_instance == null){
      _instance = DBProvider._();
    }

    return _instance;
  }

  static DBProvider getInstance() => _instance;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await init();

    return _database;
  }

  Future<String> getPath() async {
    Directory dir = await getApplicationDocumentsDirectory();
    return join(dir.path, "colors.db");
  }

  Future<Database> init() async {
    ByteData data = await rootBundle.load(join("assets", "colors.db"));
    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    File file = File(await this.getPath());

    if(!file.existsSync()) {
      print('Writing...');
      file.writeAsBytes(bytes);
    }

    return await openDatabase(await this.getPath(), version: 1);
  }

}