import 'package:iromikke/network/yukana/protocol/data_packet.dart';
import 'package:iromikke/network/yukana/protocol/packet_type.dart';

class SendColorPacket extends DataPacket {

  int colorId;

  SendColorPacket({this.colorId});

  int get id => PacketType.PACKET_SEND_COLOR;

  int get type => PacketType.TYPE_DING;

  String get name => "SendColorPacket";

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