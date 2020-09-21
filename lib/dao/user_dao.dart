import 'dart:async';

import 'package:iromikke/service/database_service.dart';
import 'package:iromikke/service/user_database.dart';

import 'package:iromikke/entity/user.dart';

class UserDao {

  final DatabaseService provider = UserDatabase();
  final String tableName = "user";

  Future<User> getAll() async {
    final db = await provider.database;
    Map<String, dynamic> result = (await db.query(tableName))[0];

    User user = result.isNotEmpty
        ? User.fromDatabaseJson(result)
        : [];

    return user;
  }

  Future<int> update(User user) async {
    final db = await provider.database;
    var result = await db.update(tableName, user.toDatabaseJson(),
        where: "viewer_id = ?", whereArgs: [user.viewerId]);

    return result;
  }

}