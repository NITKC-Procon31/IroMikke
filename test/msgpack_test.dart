import 'package:flutter_test/flutter_test.dart';

import 'package:messagepack/messagepack.dart';

void main(){
  test('List MsgPack test', (){
    List list = [1, 2.0, "Hello", 00004, 5.3333, true];
    Packer p = Packer();
    packList(p, list);

    var bytes = p.takeBytes();

    Unpacker u = Unpacker(bytes);
    print(u.unpackList());
  });

  test('Map MsgPack test', (){
    Map map = {
      'id' : 123456789,
      'name': 'Kosen Taro',
      'exp': 72.345,
      'married': false
    };
    Packer p = Packer();
    p.packMapLength(map.length);

    map.forEach((key, value){
      packDynamic(p, key);
      packDynamic(p, value);
    });

    var bytes = p.takeBytes();

    Unpacker u = Unpacker(bytes);
    print(u.unpackMap());

  });
}

void packDynamic(Packer p, dynamic v){
  switch(v.runtimeType){
    case int:
      p.packInt(v);
      break;
    case double:
      p.packDouble(v);
      break;
    case String:
      p.packString(v);
      break;
    case bool:
      p.packBool(v);
      break;
  }
}

void packList(Packer p, List list){
  p.packListLength(list.length);
  list.forEach((var v){
    packDynamic(p, v);
  });
}