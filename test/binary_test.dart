import 'package:flutter_test/flutter_test.dart';

import 'package:iromikke/utils/binary.dart';

import 'dart:convert';

void main(){
  test('Binary test', (){
    Binary buffer = Binary();
    int int8   = -100;
    int int16  = 20000;
    int int32  = -1005000;
    int uint8  = 200;
    int uint16 = 50000;
    int uint32 = 4000000000;
    String str = "Hello, World!";

    buffer.putByte(int8);
    buffer.putShort(int16);
    buffer.putInt(int32);
    buffer.putUnsignedByte(uint8);
    buffer.putUnsignedShort(uint16);
    buffer.putUnsignedInt(uint32);
    buffer.putString(str);

    expect(int8,   buffer.getByte());
    expect(int16,  buffer.getShort());
    expect(int32,  buffer.getInt());
    expect(uint8,  buffer.getUnsignedByte());
    expect(uint16, buffer.getUnsignedShort());
    expect(uint32, buffer.getUnsignedInt());
    expect(str,    buffer.getString());
  });
}