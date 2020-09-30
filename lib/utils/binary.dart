import 'dart:core';
import 'dart:typed_data';
import 'dart:convert';

class Binary {

  final int _bufSize = 1024 * 5;

  ByteData _buffer;
  int _readOffset, _writeOffset;

  Binary() {
    this._buffer = ByteData(this._bufSize);
    this._readOffset = 0;
    this._writeOffset = 0;
  }

  ByteData get buffer => this._buffer;

  int get readOffset => this._readOffset;

  int get writeOffset => this._writeOffset;

  set buffer(ByteData buffer) {
    this._buffer = buffer;
  }

  set readOffset(int offset) {
    this._readOffset = offset;
  }

  set writeOffset(int offset) {
    this._writeOffset = offset;
  }

  void reset() {
    this._buffer = ByteData(this._bufSize);
    this._readOffset = 0;
    this._writeOffset = 0;
  }

  void putByte(int value) {
    this._buffer.setInt8(this._writeOffset, value);
    this._writeOffset += 1;
  }

  void putShort(int value) {
    this._buffer.setInt16(this._writeOffset, value);
    this._writeOffset += 2;
  }

  void putInt(int value) {
    this._buffer.setInt32(this._writeOffset, value);
    this._writeOffset += 4;
  }

  int getByte() {
    int value = this._buffer.getInt8(this._readOffset);
    this._readOffset += 1;

    return value;
  }

  int getShort() {
    int value = this._buffer.getInt16(this._readOffset);
    this._readOffset += 2;

    return value;
  }

  int getInt() {
    int value = this._buffer.getInt32(this._readOffset);
    this._readOffset += 4;

    return value;
  }

  void putUnsignedByte(int value) {
    this._buffer.setUint8(this._writeOffset, value);
    this._writeOffset += 1;
  }

  void putUnsignedShort(int value) {
    this._buffer.setUint16(this._writeOffset, value);
    this._writeOffset += 2;
  }

  void putUnsignedInt(int value) {
    this._buffer.setUint32(this._writeOffset, value);
    this._writeOffset += 4;
  }

  int getUnsignedByte() {
    int value = this._buffer.getUint8(this._readOffset);
    this._readOffset += 1;

    return value;
  }

  int getUnsignedShort() {
    int value = this._buffer.getUint16(this._readOffset);
    this._readOffset += 2;

    return value;
  }

  int getUnsignedInt() {
    int value = this._buffer.getUint32(this._readOffset);
    this._readOffset += 4;

    return value;
  }

  void putString(String str) {
    Uint8List uint8list = Uint8List.fromList(utf8.encode(str));
    this.putUnsignedShort(uint8list.length);
    uint8list.forEach((int uint8) {
      this.putUnsignedShort(uint8);
    });
  }

  String getString() {
    int count = this.getUnsignedShort();
    String str = utf8.decode(buffer.buffer.asUint8List(this._readOffset, count * 2));;
    this._readOffset += count;

    return str;
  }

}