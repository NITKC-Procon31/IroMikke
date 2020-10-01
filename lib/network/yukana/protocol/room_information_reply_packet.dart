import 'package:iromikke/network/yukana/protocol/data_packet.dart';
import 'package:iromikke/network/yukana/protocol/packet_type.dart';

class RoomInformationReplyPacket extends DataPacket {

  int roomId;
  List<int> viewerIdList;

  RoomInformationReplyPacket({this.roomId, this.viewerIdList});

  int get id => PacketType.PACKET_ROOM_INFORMATION_REPLY;

  int get type => PacketType.TYPE_DONG;

  String get name => "RoomInformationReplyPacket";

  @override
  void encode() {
    super.encode();
    this.putShort(this.roomId);
    this.putUnsignedByte(this.viewerIdList.length);
    this.viewerIdList.forEach((int viewerId) {
      this.putInt(viewerId);
    });
  }

  @override
  void decode() {
    super.decode();
    this.roomId = this.getShort();
    int count = this.getUnsignedByte();
    for (; count > 0; count--) {
      this.viewerIdList.add(this.getInt());
    }
  }

}