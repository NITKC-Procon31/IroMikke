import 'package:iromikke/utils/binary.dart';

import 'package:iromikke/network/yukana/protocol/data_packet.dart';
import 'package:iromikke/network/yukana/protocol/unknown_packet.dart';

abstract class Packet extends Binary {

  static const List<int> NUM_MAGIC = [0x0f, 0x03, 0x0b, 0x08];
  bool _isEncoded;

  List _dataPackets = [];

  void addPacket(DataPacket dataPacket) {
    dataPacket.encode();
    this._dataPackets.add(dataPacket);
  }

  List get dataPackets => this._dataPackets;

  void encode() {
    this.reset();
    this._isEncoded = true;
    NUM_MAGIC.forEach((int magic) {
      this.putUnsignedByte(magic);
    });

    this.putUnsignedByte(this._dataPackets.length);
    this._dataPackets.forEach((packet) {
      packet.decode();
      this.putPacket(packet);
    });
  }

  void decode() {
    this._isEncoded = false;
    NUM_MAGIC.forEach((int magic) {
      if (this.getUnsignedByte() != magic) {
        print("Error!");
      }
    });

    int length = this.getUnsignedByte();
    for (int i = 0; i < length; i++) {
      UnknownPacket unknown = this.getPacket();
      int id = unknown.getInt();
      DataPacket packet = unknown.transform(id);
      packet.decode();
      this.dataPackets.add(packet);
    }
  }

}