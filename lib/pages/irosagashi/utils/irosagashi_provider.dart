import 'dart:math' as Math;

import 'package:iromikke/model/color_model.dart';
import 'package:iromikke/pages/irosagashi/utils/irosagashi_data.dart';

class IrosagashiProvider {

  static IrosagashiProvider _instance;

  final int _modelLength = 465;
  List<bool> _isSelected = List.filled(465, false);
  Math.Random _random = Math.Random();

  IrosagashiProvider._();

  factory IrosagashiProvider() {
     if(_instance == null){
       _instance = IrosagashiProvider._();
     }
     return _instance;
  }

  IrosagashiData provide(ColorModel model){
    int startIndex = _random.nextInt(_modelLength);
    if(_isSelected.contains(false)){
      for(int i = 0; i < _modelLength; i++){
        if(!_isSelected[(i + startIndex) % _modelLength]){
          _isSelected[(i + startIndex) % _modelLength] = true;
          return IrosagashiData(model.getById((i + startIndex) % _modelLength + 1));
        }
      }
    } else {
      return IrosagashiData(model.getById(startIndex + 1));
    }
  }
}