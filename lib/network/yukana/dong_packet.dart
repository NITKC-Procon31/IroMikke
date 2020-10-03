import 'package:iromikke/network/yukana/packet.dart';

import 'package:iromikke/network/yukana/exception/packet_exception.dart';

import 'package:iromikke/network/yukana/protocol/data_packet.dart';
import 'package:iromikke/network/yukana/protocol/packet_type.dart';

class DongPacket extends Packet {

  @override
  void addPacket(DataPacket dataPacket) {
    if (dataPacket.type == PacketType.TYPE_DONG) {
      super.addPacket(dataPacket);
    } else {
      throw PacketException("DataPackets of type DingPacket cannot be encapsulated in DongPacket.");
    }
  }

}