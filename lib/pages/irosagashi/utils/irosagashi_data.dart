import 'package:flutter/material.dart';

import 'package:iromikke/entity/traditional_color.dart';

class IrosagashiData {

  String _imagePath;
  TraditionalColor _traditionalColor;

  get kana => _traditionalColor.kana;
  get color => Color.fromARGB(255, _traditionalColor.rgb.r, _traditionalColor.rgb.g, _traditionalColor.rgb.b);

  IrosagashiData(this._traditionalColor);

  set imagePath (String path) => _imagePath = path;

}