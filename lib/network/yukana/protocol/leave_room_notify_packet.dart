import 'package:iromikke/network/yukana/protocol/data_packet.dart';
import 'package:iromikke/network/yukana/protocol/packet_type.dart';

class LeaveRoomNotifyPacket extends DataPacket {

  int viewerId;

  LeaveRoomNotifyPacket({this.viewerId});

  int get id => PacketType.PACKET_LEAVE_ROOM_NOTIFY;

  int get type => PacketType.TYPE_DONG;

  String get name => "LeaveRoomNotifyPacket";

  @override
  void encode() {
    super.encode();
    this.putInt(this.viewerId);
  }

  @override
  void decode() {
    super.decode();
    this.viewerId = this.getInt();
  }

}