import 'package:iromikke/network/yukana/protocol/data_packet.dart';
import 'package:iromikke/network/yukana/protocol/packet_type.dart';

class ConnectRoomReplyPacket extends DataPacket {

  int roomId;

  ConnectRoomReplyPacket({this.roomId});

  int get id => PacketType.PACKET_CONNECT_ROOM_REPLY;

  int get type => PacketType.TYPE_DONG;

  String get name => "ConnectRoomReplyPacket";

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