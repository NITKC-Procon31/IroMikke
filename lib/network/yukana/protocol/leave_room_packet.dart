import 'package:iromikke/network/yukana/protocol/data_packet.dart';
import 'package:iromikke/network/yukana/protocol/packet_type.dart';

class LeaveRoomPacket extends DataPacket {

  int roomId;

  LeaveRoomPacket({this.roomId});

  int get id => PacketType.PACKET_LEAVE_ROOM;

  int get type => PacketType.TYPE_DING;

  String get name => "LeaveRoomPacket";

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