import 'package:iromikke/network/yukana/protocol/data_packet.dart';
import 'package:iromikke/network/yukana/protocol/packet_type.dart';

class TimeOutNotifyPacket extends DataPacket {

  int viewerId;

  TimeOutNotifyPacket({this.viewerId});

  int get id => PacketType.PACKET_TIMEOUT_NOTIFY;

  int get type => PacketType.TYPE_DONG;

  String get name => "TimeOutNotifyPacket";

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