import 'dart:convert';
import 'dart:io';
import '';
import 'package:flutter/material.dart';
import 'package:iromikke/entity/user.dart';
import 'package:iromikke/model/color_model.dart';
import 'package:iromikke/model/user_model.dart';
import 'package:iromikke/network/yukana/ding_packet.dart';
import 'package:iromikke/network/yukana/protocol/connect_room_request_packet.dart';
import 'package:iromikke/network/yukana/protocol/packet_pool.dart';
import 'package:iromikke/network/yukana/protocol/packet_type.dart';
import 'package:iromikke/pages/irooni/utils/irooni_data.dart';
import 'package:iromikke/pages/irooni/utils/irooni_web_socket_provider.dart';
import 'package:provider/provider.dart';

class IrooniTitlePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final ColorModel colorModel = Provider.of<ColorModel>(context, listen: false);
    final UserModel userModel = Provider.of<UserModel>(context, listen: false);
    WebSocketProvider provider = WebSocketProvider.newProvider();
    provider.connectSocket();
    print(provider.webSocket != null);
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
          Column(
            children: [
              _irooniTitle(context),
              GestureDetector(
                behavior: HitTestBehavior.deferToChild,
                onTap: (){
                  print('nya-nn');
                  _sendCRRPacket(context, userModel, provider);
                  Navigator.pushNamed(context, '/irooni/start');
                  //Navigator.pushNamed(context, '/irooni/nigeru/question');
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.05, 0, MediaQuery.of(context).size.height * 0.05),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
//                    border: Border.all(
//                      color: const Color.fromARGB(255, 83, 42, 35),
//                      width: 4.0,
//                    ),
                    boxShadow: const [
                      BoxShadow(color: Colors.black, blurRadius: 5,),
                    ],
                  ),
                  child: Text(
                    'あそぶ',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 235, 86, 6),
                      fontSize: 60.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'satsuki',
                      letterSpacing: -8.0,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTapUp: (details){
                  print('にゃーん');
                  Navigator.pushNamed(context, '/irooni/nigeru/camera', arguments: IrooniData(colorModel.getById(1)));
                },
                behavior: HitTestBehavior.deferToChild,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.05, 0, MediaQuery.of(context).size.height * 0.05),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
//                    border: Border.all(
//                      color: const Color.fromARGB(255, 83, 42, 35),
//                      width: 4.0,
//                    ),
                    boxShadow: const [
                      BoxShadow(color: Colors.black, blurRadius: 5,),
                    ],
                  ),
                  child: Text(
                    'あそびかた',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 247, 81, 0),
                      fontSize: 60.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'satsuki',
                      letterSpacing: -8.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _sendCRRPacket(BuildContext context, UserModel model, WebSocketProvider provider){
    DingPacket packet = new DingPacket();
    ConnectRoomRequestPacket crrPacket = PacketPool.getPacketById(PacketType.PACKET_CONNECT_ROOM_REQUEST);
    crrPacket.viewerId = model.viewerId;
    crrPacket.userId = model.userId;
    packet.addPacket(crrPacket);
    packet.encode();
    provider.sendPacket(packet);
  }

  Widget _irooniTitle(BuildContext context){
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.05, 0, MediaQuery.of(context).size.height * 0.05),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'い',
                style: TextStyle(
                  fontSize: 70.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'satsuki',
                  color: Colors.white,
                ),
              ),
              Text(
                'ろ',
                style: TextStyle(
                  fontSize: 70.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'satsuki',
                  color: Colors.white,
                ),
              ),
              Text(
                'お',
                style: TextStyle(
                  fontSize: 70.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'satsuki',
                  color: Colors.white,
                ),
              ),
              Text(
                'に',
                style: TextStyle(
                  fontSize: 70.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'satsuki',
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'い',
                style: TextStyle(
                  fontSize: 70.0,
                  fontFamily: 'satsuki',
                  color: const Color.fromARGB(255, 255, 38, 0),
                ),
              ),
              Text(
                'ろ',
                style: TextStyle(
                  fontSize: 70.0,
                  fontFamily: 'satsuki',
                  color: const Color.fromARGB(255, 255, 80, 37),
                ),
              ),
              Text(
                'お',
                style: TextStyle(
                  fontSize: 70.0,
                  fontFamily: 'satsuki',
                  color: const Color.fromARGB(255, 242, 40, 40),
                ),
              ),
              Text(
                'に',
                style: TextStyle(
                  fontSize: 70.0,
                  fontFamily: 'satsuki',
                  color: const Color.fromARGB(255, 253, 101, 131),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}