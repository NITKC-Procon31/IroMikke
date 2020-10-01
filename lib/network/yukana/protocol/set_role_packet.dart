import 'package:iromikke/network/yukana/protocol/data_packet.dart';
import 'package:iromikke/network/yukana/protocol/packet_type.dart';

import 'package:iromikke/network/yukana/exception/invalid_role_exception.dart';

class SetRolePacket extends DataPacket {

  int _role;

  SetRolePacket({int role}) {
    if (0 <= role && role <= 1) {
      this._role = role;
    } else {
      throw new InvalidRoleException('Invalid role $role');
    }
  }

  int get role => this._role;

  set role(int role) {
    if (0 <= role && role <= 1) {
      this._role = role;
    } else {
      throw new InvalidRoleException('Invalid role $role');
    }
  }

  int get id => PacketType.PACKET_SET_ROLE;

  int get type => PacketType.TYPE_DONG;

  String get name => "SetRolePacket";

  @override
  void encode() {
    super.encode();
    this.putShort(this._role);
  }

  @override
  void decode() {
    super.decode();
    this._role = this.getShort();
  }

}