import 'package:iromikke/network/yukana/protocol/data_packet.dart';
import 'package:iromikke/network/yukana/protocol/packet_type.dart';

class CorrectAnswerPacket extends DataPacket {

  bool flag;

  CorrectAnswerPacket({this.flag});

  int get id => PacketType.PACKET_CORRECT_ANSWER;

  int get type => PacketType.TYPE_DING;

  String get name => "CorrectAnswerPacket";

  @override
  void encode() {
    super.encode();
    this.putBool(this.flag);
  }

  @override
  void decode() {
    super.decode();
    this.flag = this.getBool();
  }

}