import 'package:flutter/material.dart';

import 'package:iromikke/entity/user.dart';

import 'package:iromikke/repository/user_repository.dart';

class UserModel with ChangeNotifier {

  User _user = null;

  final UserRepository repo = UserRepository();

  UserModel(){
    _fetch();
  }

  void _fetch() async {
    this._user = await repo.getProfile();
    notifyListeners();
  }

  int get id => this._user.id;
  String get name => this._user.name;
  int get userId => this._user.userId;
  int get viewerId => this._user.viewerId;
  int get highScore => this._user.highScore;
  int get uiColor => this._user.uiColor;

  bool get isNull => this._user == null;

  set name(String name) {
    this._user.name = name;
    this._updateUser();
  }

  set userId(int userId) {
    this._user.userId = userId;
    this._updateUser();
  }

  set viewerId(int viewerId) {
    this._user.viewerId = viewerId;
    this._updateUser();
  }

  set highScore(int score) {
    this._user.highScore = score;
    this._updateUser();
  }

  set uiColor(int id) {
    this._user.uiColor = id;
    this._updateUser();
  }

  void _updateUser() async {
    await repo.updateProfile(this._user);
    _fetch();
  }

}