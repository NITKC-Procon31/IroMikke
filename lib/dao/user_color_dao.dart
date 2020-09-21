import 'dart:async';

import 'package:iromikke/service/database_service.dart';
import 'package:iromikke/service/user_database.dart';

import 'package:iromikke/entity/user_color.dart';

class UserColorDao {

  final DatabaseService provider = UserDatabase();
  final String tableName = "user_colors";

  Future<List<UserColor>> getAll() async {
    final db = await provider.database;
    List<Map<String, dynamic>> result = await db.query(tableName);

    List<UserColor> colors = result.isNotEmpty
        ? result.map((item) => UserColor.fromDatabaseJson(item)).toList()
        : [];

    return colors;
  }

  Future<int> update(UserColor color) async {
    final db = await provider.database;
    var result = await db.update(tableName, color.toDatabaseJson(),
        where: "id = ?", whereArgs: [color.id]);

    return result;
  }

}