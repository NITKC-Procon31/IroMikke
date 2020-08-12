import 'package:flutter_test/flutter_test.dart';
import 'package:iromikke/utils/Color.dart';

void main(){
  test('CIEDE2000 test', (){
    var col1 = Color(100, 100, 100);
    var col2 = Color(150, 150, 150);
    print(col1 - col2);
  });

}