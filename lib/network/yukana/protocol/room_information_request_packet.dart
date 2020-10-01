import 'package:iromikke/network/yukana/protocol/data_packet.dart';
import 'package:iromikke/network/yukana/protocol/packet_type.dart';

class RoomInformationRequestPacket extends DataPacket {

  int roomId;

  RoomInformationRequestPacket({this.roomId});

  int get id => PacketType.PACKET_ROOM_INFORMATION_REQUEST;

  int get type => PacketType.TYPE_DING;

  String get name => "RoomInformationRequestPacket";

  @override
  void encode() {
    super.encode();
    this.putShort(this.roomId);
  }

  @override
  void decode() {
    super.decode();
    this.roomId = this.getShort();
  }

}