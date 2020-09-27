import 'package:flutter_test/flutter_test.dart';

import 'package:iromikke/utils/rgb_color.dart';
import 'package:iromikke/utils/hsl_color.dart';

void main(){
  test('Color blend test', (){
    // ここにテストコード
    RGBColor rgb1 = RGBColor(255, 0, 0);
    RGBColor rgb2 = RGBColor(0, 255, 0);
    RGBColor rgb3 = RGBColor(0, 0, 255);
    HSLColor col1 = HSLColor.fromRGB(rgb1);
    HSLColor col2 = HSLColor.fromRGB(rgb2);
    HSLColor col3 = HSLColor.fromRGB(rgb3);
    RGBColor blend12 = (col1 + col2).toRGB();
    RGBColor blend23 = (col2 + col3).toRGB();
    RGBColor blend13 = (col1 + col3).toRGB();
    print('$rgb1 = $col1 = ${col1.toRGB()}');
    print('$rgb2 = $col2 = ${col2.toRGB()}');
    print('$rgb3 = $col3 = ${col3.toRGB()}');
    print('RGB1 + RGB2 = $blend12');
    print('RGB2 + RGB3 = $blend23');
    print('RGB1 + RGB3 = $blend13');
  });
}