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

  }
}