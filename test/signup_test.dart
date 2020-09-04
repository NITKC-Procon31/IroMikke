import 'package:flutter_test/flutter_test.dart';

import 'package:iromikke/network/api/SignUp.dart';

void main(){
  test('SignUp test', (){
    SignUp endpoint = new SignUp(viewerId: 100, userId: 200, name: '高専 太郎');
    endpoint.viewerId = 300;

    print(endpoint.viewerId);
    print(endpoint.userId);
    print(endpoint.name);
    expect(endpoint.json, '{"viewer_id":300,"user_id":200,"name":"高専 太郎"}');
  });

}