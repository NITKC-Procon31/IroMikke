import 'package:iromikke/network/yukana/protocol/color_notify_packet.dart';
import 'package:iromikke/network/yukana/protocol/connect_room_reply_packet.dart';
import 'package:iromikke/network/yukana/protocol/connect_room_request_packet.dart';
import 'package:iromikke/network/yukana/protocol/correct_answer_packet.dart';
import 'package:iromikke/network/yukana/protocol/data_packet.dart';
import 'package:iromikke/network/yukana/protocol/leave_room_notify_packet.dart';
import 'package:iromikke/network/yukana/protocol/leave_room_packet.dart';
import 'package:iromikke/network/yukana/protocol/packet_type.dart';
import 'package:iromikke/network/yukana/protocol/room_information_reply_packet.dart';
import 'package:iromikke/network/yukana/protocol/room_information_request_packet.dart';
import 'package:iromikke/network/yukana/protocol/send_color_packet.dart';
import 'package:iromikke/network/yukana/protocol/set_role_packet.dart';
import 'package:iromikke/network/yukana/protocol/start_game_notify_packet.dart';
import 'package:iromikke/network/yukana/protocol/timeout_notify_packet.dart';
import 'package:iromikke/network/yukana/protocol/unknown_packet.dart';

import 'package:iromikke/network/yukana/exception/packet_exception.dart';

class PacketPool {

  static DataPacket getPacketById(int id) {
    switch (id) {
      case PacketType.PACKET_CONNECT_ROOM_REQUEST:
        return new ConnectRoomRequestPacket();
        break;
      case PacketType.PACKET_CONNECT_ROOM_REPLY:
        return new ConnectRoomReplyPacket();
        break;
      case PacketType.PACKET_LEAVE_ROOM:
        return new LeaveRoomPacket();
        break;
      case PacketType.PACKET_LEAVE_ROOM_NOTIFY:
        return new LeaveRoomNotifyPacket();
        break;
      case PacketType.PACKET_ROOM_INFORMATION_REQUEST:
        return new RoomInformationRequestPacket();
        break;
      case PacketType.PACKET_ROOM_INFORMATION_REPLY:
        return new RoomInformationReplyPacket();
        break;
      case PacketType.PACKET_SET_ROLE:
        return new SetRolePacket();
        break;
      case PacketType.PACKET_SEND_COLOR:
        return new SendColorPacket();
        break;
      case PacketType.PACKET_COLOR_NOTIFY:
        return new ColorNotifyPacket();
        break;
      case PacketType.PACKET_CORRECT_ANSWER:
        return new CorrectAnswerPacket();
        break;
      case PacketType.PACKET_START_GAME_NOTIFY:
        return new StartGameNotifyPacket();
        break;
      case PacketType.PACKET_TIMEOUT_NOTIFY:
        return new TimeOutNotifyPacket();
        break;
      case PacketType.PACKET_UNKNOWN:
        return new UnknownPacket();
      default:
        throw PacketException('Unknown DataPacket id : $id');
        break;
    }
  }

}