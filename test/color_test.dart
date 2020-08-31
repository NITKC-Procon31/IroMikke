import 'package:flutter_test/flutter_test.dart';
import 'package:iromikke/utils/DColor.dart';

void main(){
  test('CIEDE2000 test', (){
    var col1 = DColor(100, 100, 100);
    var col2 = DColor(150, 150, 150);
    print(col1 - col2);
  });

}