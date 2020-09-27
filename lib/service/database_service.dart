import 'dart:io';
import 'dart:typed_data';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

import 'package:flutter/services.dart' show rootBundle;

abstract class DatabaseService {

  String get name;

  Future<Database> get database;

  Future<String> get path async {
    Directory dir = await getApplicationDocumentsDirectory();
    return join(dir.path, this.name);
  }

  Future<Database> init() async {
    ByteData data = await rootBundle.load(join("assets", this.name));
    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    File file = File(await this.path);

    if (!file.existsSync()) {
      print('Writing...');
      file.writeAsBytes(bytes);
    }

    return await openDatabase(await this.path, version: 1);
  }

}