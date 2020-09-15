import 'dart:async';

import 'package:iromikke/service/database_service.dart';
import 'package:iromikke/service/color_database.dart';

import 'package:iromikke/entity/traditional_color.dart';

class ColorDao {

  final DatabaseService provider = ColorDatabase();
  final String tableName = "colors";

  Future<List<TraditionalColor>> getAll() async {
    final db = await provider.database;
    List<Map<String, dynamic>> result = await db.query(tableName);

    List<TraditionalColor> colors = result.isNotEmpty
        ? result.map((item) => TraditionalColor.fromDatabaseJson(item)).toList()
        : [];

    return colors;
  }

}