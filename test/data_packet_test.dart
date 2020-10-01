import 'package:flutter_test/flutter_test.dart';

import 'package:scidart/numdart.dart';

import 'package:iromikke/network/yukana/protocol/data_packet.dart';
import 'package:iromikke/network/yukana/protocol/packet_type.dart';
import 'package:iromikke/network/yukana/protocol/packet_pool.dart';
import 'package:iromikke/network/yukana/protocol/color_notify_packet.dart';
import 'package:iromikke/network/yukana/protocol/connect_room_reply_packet.dart';
import 'package:iromikke/network/yukana/protocol/connect_room_request_packet.dart';
import 'package:iromikke/network/yukana/protocol/correct_answer_packet.dart';
import 'package:iromikke/network/yukana/protocol/leave_room_notify_packet.dart';
import 'package:iromikke/network/yukana/protocol/leave_room_packet.dart';
import 'package:iromikke/network/yukana/protocol/room_information_reply_packet.dart';
import 'package:iromikke/network/yukana/protocol/room_information_request_packet.dart';
import 'package:iromikke/network/yukana/protocol/send_color_packet.dart';
import 'package:iromikke/network/yukana/protocol/set_role_packet.dart';
import 'package:iromikke/network/yukana/protocol/start_game_notify_packet.dart';
import 'package:iromikke/network/yukana/protocol/timeout_notify_packet.dart';

void main(){
  test('Connect Room Packet test', (){
    ConnectRoomRequestPacket packet = PacketPool.getPacketById(PacketType.PACKET_CONNECT_ROOM_REQUEST);
    packet.viewerId = 100000000;
    packet.userId = 100000000;
    packet.encode();
    ConnectRoomRequestPacket newPacket = PacketPool.getPacketById(PacketType.PACKET_CONNECT_ROOM_REQUEST);
    newPacket.buffer = packet.buffer;
    newPacket.decode();
    expect(packet.viewerId, newPacket.viewerId);
    expect(packet.userId, newPacket.userId);
  });

  test('Connect Room Reply Packet test', (){
    ConnectRoomReplyPacket packet = PacketPool.getPacketById(PacketType.PACKET_CONNECT_ROOM_REPLY);
    packet.roomId = 1000;
    packet.encode();
    ConnectRoomReplyPacket newPacket = PacketPool.getPacketById(PacketType.PACKET_CONNECT_ROOM_REPLY);
    newPacket.buffer = packet.buffer;
    newPacket.decode();
    expect(packet.roomId, newPacket.roomId);
  });

  test('Leave Room Packet test', (){
    LeaveRoomPacket packet = PacketPool.getPacketById(PacketType.PACKET_LEAVE_ROOM);
    packet.roomId = 1000;
    packet.encode();
    LeaveRoomPacket newPacket = PacketPool.getPacketById(PacketType.PACKET_LEAVE_ROOM);
    newPacket.buffer = packet.buffer;
    newPacket.decode();
    expect(packet.roomId, newPacket.roomId);
  });

  test('Leave Room Notify Packet test', (){
    LeaveRoomNotifyPacket packet = PacketPool.getPacketById(PacketType.PACKET_LEAVE_ROOM_NOTIFY);
    packet.viewerId = 100000000;
    packet.encode();
    LeaveRoomNotifyPacket newPacket = PacketPool.getPacketById(PacketType.PACKET_LEAVE_ROOM_NOTIFY);
    newPacket.buffer = packet.buffer;
    newPacket.decode();
    expect(packet.viewerId, newPacket.viewerId);
  });

  test('Room Information Request Packet test', (){
    RoomInformationRequestPacket packet = PacketPool.getPacketById(PacketType.PACKET_ROOM_INFORMATION_REQUEST);
    packet.roomId = 1000;
    packet.encode();
    RoomInformationRequestPacket newPacket = PacketPool.getPacketById(PacketType.PACKET_ROOM_INFORMATION_REQUEST);
    newPacket.buffer = packet.buffer;
    newPacket.decode();
    expect(packet.roomId, newPacket.roomId);
  });

  test('Room Information Reply Packet test', (){
    RoomInformationReplyPacket packet = PacketPool.getPacketById(PacketType.PACKET_ROOM_INFORMATION_REPLY);
    packet.roomId = 1000;
    packet.viewerIdList = [100000000, 200000000, 300000000];
    packet.encode();
    RoomInformationReplyPacket newPacket = PacketPool.getPacketById(PacketType.PACKET_ROOM_INFORMATION_REPLY);
    newPacket.buffer = packet.buffer;
    newPacket.decode();
    expect(packet.roomId, newPacket.roomId);
    expect(packet.viewerIdList, newPacket.viewerIdList);
  });

  test('Set Role Packet test', (){
    SetRolePacket packet = PacketPool.getPacketById(PacketType.PACKET_SET_ROLE);
    packet.role = 1;
    packet.encode();
    SetRolePacket newPacket = PacketPool.getPacketById(PacketType.PACKET_SET_ROLE);
    newPacket.buffer = packet.buffer;
    newPacket.decode();
    expect(packet.role, newPacket.role);
  });

  test('Send Color Packet test', (){
    SendColorPacket packet = PacketPool.getPacketById(PacketType.PACKET_SEND_COLOR);
    packet.colorId = 1000;
    packet.encode();
    SendColorPacket newPacket = PacketPool.getPacketById(PacketType.PACKET_SEND_COLOR);
    newPacket.buffer = packet.buffer;
    newPacket.decode();
    expect(packet.colorId, newPacket.colorId);
  });

  test('Color Notify Packet test', (){
    ColorNotifyPacket packet = PacketPool.getPacketById(PacketType.PACKET_COLOR_NOTIFY);
    packet.colorId = 1000;
    packet.encode();
    ColorNotifyPacket newPacket = PacketPool.getPacketById(PacketType.PACKET_COLOR_NOTIFY);
    newPacket.buffer = packet.buffer;
    newPacket.decode();
    expect(packet.colorId, newPacket.colorId);
  });

  test('Correct Answer Packet test', (){
    CorrectAnswerPacket packet = PacketPool.getPacketById(PacketType.PACKET_CORRECT_ANSWER);
    packet.flag = true;
    packet.encode();
    CorrectAnswerPacket newPacket = PacketPool.getPacketById(PacketType.PACKET_CORRECT_ANSWER);
    newPacket.buffer = packet.buffer;
    newPacket.decode();
    expect(packet.flag, newPacket.flag);
  });

  test('Start Game Notify Packet test', (){
    StartGameNotifyPacket packet = PacketPool.getPacketById(PacketType.PACKET_START_GAME_NOTIFY);
    packet.timestamp = DateTime.now().millisecondsSinceEpoch ~/ kilo;
    packet.encode();
    StartGameNotifyPacket newPacket = PacketPool.getPacketById(PacketType.PACKET_START_GAME_NOTIFY);
    newPacket.buffer = packet.buffer;
    newPacket.decode();
    expect(packet.timestamp, newPacket.timestamp);
  });

  test('TimeOut Notify Packet test', (){
    TimeOutNotifyPacket packet = PacketPool.getPacketById(PacketType.PACKET_TIMEOUT_NOTIFY);
    packet.viewerId = 100000000;
    packet.encode();
    TimeOutNotifyPacket newPacket = PacketPool.getPacketById(PacketType.PACKET_TIMEOUT_NOTIFY);
    newPacket.buffer = packet.buffer;
    newPacket.decode();
    expect(packet.viewerId, newPacket.viewerId);
  });
}