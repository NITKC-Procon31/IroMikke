import 'package:flutter_test/flutter_test.dart';

import 'package:iromikke/network/api/cryptographer.dart';

void main(){
  test('Cryptographer test', (){
    String str = 'Hello, World!';
    String encoded = Cryptographer.encode(str);
    String decoded = Cryptographer.decode(encoded);

    print("Test String : $str");
    print("Encode : $encoded");
    print("Decode : $decoded");
    expect(str, decoded);
  });
}