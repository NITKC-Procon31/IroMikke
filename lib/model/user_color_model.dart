import 'package:flutter/material.dart';

import 'package:iromikke/entity/user_color.dart';

import 'package:iromikke/repository/user_color_repository.dart';

class UserColorModel with ChangeNotifier {

  List<UserColor> _allColors = [];

  final UserColorRepository repo = UserColorRepository();

  UserColorModel(){
    _fetch();
  }

  void _fetch() async {
    this._allColors = await repo.getAllColors();
    notifyListeners();
  }

  bool isFound(int id) {
    if(_allColors.length > id){
      return _allColors[id].flag;
    }

    return false;
  }

  void update(UserColor color) async {
    await repo.updateColors(color);
    _fetch();
  }

  void toggleFlag(UserColor color) async {
    color.flag = !color.flag;
    this.update(color);
  }

  List<UserColor> getAll() => this._allColors;

  int get length => this._allColors.length;

}