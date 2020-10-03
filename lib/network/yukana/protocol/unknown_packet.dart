import 'package:iromikke/network/yukana/protocol/data_packet.dart';
import 'package:iromikke/network/yukana/protocol/packet_type.dart';
import 'package:iromikke/network/yukana/protocol/packet_pool.dart';

class UnknownPacket extends DataPacket {

  int get id => PacketType.PACKET_UNKNOWN;

  int get type => PacketType.TYPE_COMMON;

  String get name => "UnknownPacket";

  DataPacket transform(int id) {
    DataPacket packet = PacketPool.getPacketById(id);
    packet.buffer = this.buffer;

    return packet;
  }

}