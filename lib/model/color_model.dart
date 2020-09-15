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
    TraditionalColor result = null;
    _allColors.forEach((TraditionalColor color) {
      if (color.id == id) {
        result = color;
      }
    });

    return result;
  }

  List<TraditionalColor> getAll() => this._allColors;

  int getLength() => this._allColors.length;

}