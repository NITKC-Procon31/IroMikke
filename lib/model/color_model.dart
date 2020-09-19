import 'package:flutter/material.dart';

import 'package:iromikke/entity/traditional_color.dart';

import 'package:iromikke/repository/color_repository.dart';

class ColorModel with ChangeNotifier {

  List<TraditionalColor> _allColors = [];

  final ColorRepository repo = ColorRepository();

  ColorModel(){
    _fetch();
  }

  void _fetch() async {
    this._allColors = await repo.getAllColors();
    notifyListeners();
  }

  TraditionalColor getById(int id) {
    for(final TraditionalColor color in _allColors){
      if(color.id == id){
        return color;
      }
    }

    return null;
  }

  List<TraditionalColor> getAll() => this._allColors;

  int get length => this._allColors.length;

}