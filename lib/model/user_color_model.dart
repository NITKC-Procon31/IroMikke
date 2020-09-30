import 'package:flutter/material.dart';

import 'package:iromikke/entity/user_color.dart';

import 'package:iromikke/repository/user_color_repository.dart';

class UserColorModel with ChangeNotifier {

  List<UserColor> _allColors = [];

  final UserColorRepository repo = UserColorRepository();

  bool get isNull => _allColors.length == 0;

  UserColorModel() {
    _fetch();
  }

  void _fetch() async {
    this._allColors = await repo.getAllColors();
    notifyListeners();
  }

  void setFlag(UserColor color, bool flag) async {
    color.flag = flag;
    this._update(color);
  }

  UserColor getUserColorById(int id) {
    for (final UserColor color in _allColors) {
      if (color.id == id) {
        return color;
      }
    }

    return null;
  }

  bool isFound(int id) {
    for (final UserColor color in _allColors) {
      if (color.id == id) {
        return color.flag;
      }
    }

    return false;
  }

  void _update(UserColor color) async {
    await repo.updateColors(color);
    _fetch();
  }

  List<UserColor> getAll() => this._allColors;

  int get length => this._allColors.length;

}