import 'package:iromikke/network/yukana/protocol/data_packet.dart';
import 'package:iromikke/network/yukana/protocol/packet_type.dart';

class ConnectRoomRequestPacket extends DataPacket {

  int viewerId, userId;

  ConnectRoomRequestPacket({this.viewerId, this.userId});

  int get id => PacketType.PACKET_CONNECT_ROOM_REQUEST;

  int get type => PacketType.TYPE_DING;

  String get name => 'ConnectRoomRequestPacket';

  @override
  void encode() {
    super.encode();
    this.putInt(this.viewerId);
    this.putInt(this.userId);
  }

  @override
  void decode() {
    super.decode();
    this.viewerId = this.getInt();
    this.userId = this.getInt();
  }

}