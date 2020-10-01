import 'package:flutter/cupertino.dart';
import 'package:iromikke/network/yukana/protocol/data_packet.dart';
import 'package:iromikke/network/yukana/protocol/packet_type.dart';

class ColorNotifyPacket extends DataPacket {

  int colorId;

  ColorNotifyPacket({this.colorId});

  int get id => PacketType.PACKET_COLOR_NOTIFY;

  int get type => PacketType.TYPE_DONG;

  String get name => "ColorNotifyPacket";

  @override
  void encode() {
    super.encode();
    this.putUnsignedShort(colorId);
  }

  @override
  void decode() {
    super.decode();
    this.colorId = this.getUnsignedShort();
  }

}