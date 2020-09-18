import 'package:flutter_test/flutter_test.dart';

import 'package:iromikke/utils/rgb_color.dart';

void main(){
  test('CIEDE2000 test', (){
    var col1 = RGBColor(100, 100, 100);
    var col2 = RGBColor(150, 150, 150);
    print(col1.distance(col2));

    var col3 = RGBColor.fromHex('#54c11c');
    print(col3.toString());
  });

}