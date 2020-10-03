import 'package:iromikke/network/yukana/packet.dart';

import 'package:iromikke/network/yukana/exception/packet_exception.dart';

import 'package:iromikke/network/yukana/protocol/data_packet.dart';
import 'package:iromikke/network/yukana/protocol/packet_type.dart';

class DingPacket extends Packet {

  @override
  void addPacket(DataPacket dataPacket) {
    if (dataPacket.type == PacketType.TYPE_DING) {
      super.addPacket(dataPacket);
    } else {
      throw PacketException("DataPackets of type DongPacket cannot be encapsulated in DingPacket.");
    }
  }

}