import 'package:iromikke/utils/binary.dart';

abstract class DataPacket extends Binary {

  bool _isEncoded;

  void encode() {
    this.reset();
    this.putInt(this.id);
    this._isEncoded = true;
  }

  void decode() {
    int id = this.getInt();
    this._isEncoded = false;
  }

  int get id;
  int get type;
  String get name;

}