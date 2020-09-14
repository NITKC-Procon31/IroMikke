import 'package:flutter_test/flutter_test.dart';

import 'package:iromikke/utils/d_color.dart';

void main(){
  test('CIEDE2000 test', (){
    var col1 = DColor(100, 100, 100);
    var col2 = DColor(150, 150, 150);
    print(col1.distance(col2));

    var col3 = DColor.fromHex('#54c11c');
    print(col3.toString());
  });

}