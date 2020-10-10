import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:iromikke/model/user_model.dart';
import 'package:provider/provider.dart';
import 'package:web_socket_channel/io.dart';

import 'package:flutter/material.dart';
import 'package:iromikke/network/yukana/ding_packet.dart';
import 'package:iromikke/network/yukana/dong_packet.dart';
import 'package:iromikke/network/yukana/protocol/packet_pool.dart';
import 'package:iromikke/network/yukana/protocol/packet_type.dart';
import 'package:iromikke/network/yukana/protocol/room_information_request_packet.dart';
import 'package:iromikke/pages/irooni/utils/irooni_web_socket_provider.dart';

class IrooniStartPage extends StatefulWidget {

  @override
  _IrooniStartPageState createState() => _IrooniStartPageState();

}

class _IrooniStartPageState extends State<IrooniStartPage> {
  WebSocketProvider _webSocketProvider;
  int _playerNumber = 1;
  int _roomId;
  final int _maxNumber = 3;

  @override
  void initState(){
    super.initState();
    _webSocketProvider = WebSocketProvider();
//    _webSocketProvider.webSocket.stream.listen((message) {
//      Uint8List uint8list = Uint8List.fromList(base64.decode(message));
//      DongPacket packet = new DongPacket();
//      packet.buffer = ByteData.sublistView(uint8list);
//      packet.decode();
//      List pkList = packet.dataPackets;
//      pkList.forEach((element) {
//        if(element.id == PacketType.PACKET_CONNECT_ROOM_REPLY){
//          _roomId = element.roomId;
//          print(_roomId.toString());
//          _sendRIRPacket();
//        } else if (element.id == PacketType.PACKET_ROOM_INFORMATION_REPLY) {
//          int length = element.viwerIdList.length;
//          setState(() {
//            _playerNumber = length;
//          });
//        } else if (element.id == PacketType.PACKET_SET_ROLE){
//          if(element.role == 0){
//            Navigator.pushNamedAndRemoveUntil(context, '/irooni/oni/colorChoice', ModalRoute.withName('/irooni/title'));
//          } else if(element.role == 1){
//            Navigator.pushNamedAndRemoveUntil(context, '/irooni/nigeru/question', ModalRoute.withName('/irooni/title'));
//          }
//        }
//      });
//    });
  }

  @override
  void dispose(){
    super.dispose();
    _webSocketProvider.webSocket.close();
  }

  void _sendRIRPacket(){
    DingPacket packet = new DingPacket();
    RoomInformationRequestPacket rirPacket = PacketPool.getPacketById(PacketType.PACKET_ROOM_INFORMATION_REQUEST);
    rirPacket.roomId = _roomId;
    packet.addPacket(rirPacket);
    WebSocketProvider provider = WebSocketProvider();
    packet.encode();
    provider.sendPacket(packet);
  }

  @override
  Widget build(BuildContext context) {
    UserModel model = Provider.of<UserModel>(context);
    print('userID:${model.userId},ViewerId:${model.viewerId}');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 107, 161),
        title: Text(
          'いろおに',
          style: TextStyle(
            fontFamily: 'satsuki',
            fontSize: 40.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage('assets/Images/irooni/irooni_background.png'),
              ),
            ),
          ),
          StreamBuilder(
            stream: _webSocketProvider.socketStream,
            builder: (context, snapshot){
              if(_webSocketProvider.packet != null){

                List pkList = _webSocketProvider.packet.dataPackets;
                pkList.forEach((element) {
                  if(element.id == PacketType.PACKET_CONNECT_ROOM_REPLY){
                    _roomId = element.roomId;
                    print(_roomId.toString());
                    _sendRIRPacket();
                  } else if (element.id == PacketType.PACKET_ROOM_INFORMATION_REPLY) {
                    int length = element.viwerIdList.length;
                    _playerNumber = length;

                  } else if (element.id == PacketType.PACKET_SET_ROLE) {
                    if (element.role == 0) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/irooni/oni/colorChoice',
                          ModalRoute.withName('/irooni/title'));
                    } else if (element.role == 1) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/irooni/nigeru/question',
                          ModalRoute.withName('/irooni/title'));
                    }
                  }
                });
              }
              return Center(
                child: Text(
                  'いま$_playerNumber人だよ',
                  style: TextStyle(
                    fontFamily: 'satsuki',
                    fontSize: 40.0,
                    color: const Color.fromARGB(255, 235, 86, 6),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}