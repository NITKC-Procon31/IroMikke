import 'package:iromikke/network/yukana/protocol/data_packet.dart';
import 'package:iromikke/network/yukana/protocol/packet_type.dart';

class StartGameNotifyPacket extends DataPacket {

  int timestamp;

  StartGameNotifyPacket({this.timestamp});

  int get id => PacketType.PACKET_START_GAME_NOTIFY;

  int get type => PacketType.TYPE_DONG;

  String get name => "StartGameNotifyPacket";

  @override
  void encode() {
    super.encode();
    this.putInt(this.timestamp);
  }

  @override
  void decode() {
    super.decode();
    this.timestamp = this.getInt();
  }

}