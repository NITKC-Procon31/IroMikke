class PacketType {

  static const int TYPE_DING   = 0;
  static const int TYPE_DONG   = 1;
  static const int TYPE_COMMON = 2;

  static const PACKET_CONNECT_ROOM_REQUEST              = 0x01;
  static const PACKET_CONNECT_ROOM_REPLY                = 0x02;
  static const PACKET_LEAVE_ROOM                        = 0x03;
  static const PACKET_LEAVE_ROOM_NOTIFY                 = 0x04;
  static const PACKET_ROOM_INFORMATION_REQUEST          = 0x05;
  static const PACKET_ROOM_INFORMATION_REPLY            = 0x06;
  static const PACKET_SET_ROLE                          = 0x07;
  static const PACKET_SEND_COLOR                        = 0x08;
  static const PACKET_COLOR_NOTIFY                      = 0x09;
  static const PACKET_CORRECT_ANSWER                    = 0x0a;
  static const PACKET_START_GAME_NOTIFY                 = 0x0b;
  static const PACKET_TIMEOUT_NOTIFY                    = 0x0c;

  static const PACKET_UNKNOWN                           = 0xff;

}