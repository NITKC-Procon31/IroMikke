import 'package:flutter/material.dart';

import 'package:iromikke/entity/traditional_color.dart';
import 'package:iromikke/model/color_model.dart';
import 'package:iromikke/utils/rgb_color.dart';

class IrosagashiData {

  final double _distMax = 15.0;
  String _imagePath;
  TraditionalColor _traditionalColor;
  RGBColor _userSelectedColor;

  get kana => _traditionalColor.kana;
  get color => Color.fromARGB(255, _traditionalColor.rgb.r, _traditionalColor.rgb.g, _traditionalColor.rgb.b);
  get imagePath => _imagePath;

  IrosagashiData(this._traditionalColor);

  set imagePath (String path) => _imagePath = path;

  TraditionalColor get traditionalColor => this._traditionalColor;

  void setUserSelectedColor(int r, int g, int b){
    _userSelectedColor = RGBColor(r, g, b);
  }

  bool isCorrected(){
    return _userSelectedColor.distance(_traditionalColor.rgb) <= _distMax;
  }

  TraditionalColor getNearlyColor(ColorModel model){
    double min = 442.0;
    int index = -1;
    double temp;
    for(int i = 0; i < model.length; i++){
      if((temp = _userSelectedColor.distance(model.getById(i + 1).rgb)) < min){
        min = temp;
        index = i;
      }
    }
    return model.getById(index + 1);
  }
}