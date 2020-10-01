import 'dart:async';

import 'package:flutter/material.dart';

import 'package:iromikke/entity/traditional_color.dart';
import 'package:iromikke/model/color_model.dart';
import 'package:iromikke/utils/rgb_color.dart';

class IrooniData {

  final double _distMax = 15.0;
  String _imagePath;
  TraditionalColor _traditionalColor;
  RGBColor _userSelectedColor;
  int _second = 60;
  Timer _timer;
  bool _isTimeUp = false;

  get kana => _traditionalColor.kana;
  get color => Color.fromARGB(255, _traditionalColor.rgb.r, _traditionalColor.rgb.g, _traditionalColor.rgb.b);
  get userAnswer => Color.fromARGB(255, _userSelectedColor.r, _userSelectedColor.g, _userSelectedColor.b);
  get imagePath => _imagePath;
  get second => _second;
  get isTimeUp => _isTimeUp;

  IrooniData(this._traditionalColor){
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {_decrementSecond();});
  }

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

  Color getAnswerLetterColor(){
    if(_traditionalColor.rgb.distance(RGBColor(0, 0, 0)) <= _traditionalColor.rgb.distance(RGBColor(255, 255, 255))){
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  Color getUserLetterColor(){
    if(_userSelectedColor.distance(RGBColor(0, 0, 0)) <= _userSelectedColor.distance(RGBColor(255, 255, 255))){
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  void _decrementSecond(){
    _second--;
    if(_second == 0){
      _isTimeUp = true;
      _timer.cancel();
    }
  }
}