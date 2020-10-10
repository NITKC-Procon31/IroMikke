import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:iromikke/model/color_model.dart';
import 'package:iromikke/network/yukana/dong_packet.dart';
import 'package:iromikke/network/yukana/protocol/color_notify_packet.dart';
import 'package:iromikke/network/yukana/protocol/packet_pool.dart';
import 'package:iromikke/network/yukana/protocol/packet_type.dart';
import 'package:iromikke/pages/irooni/irooni_timer_widget.dart';
import 'package:iromikke/pages/irooni/utils/irooni_data.dart';
import 'package:iromikke/pages/irooni/utils/irooni_web_socket_provider.dart';
import 'package:provider/provider.dart';

class IrooniNigeruQuestionPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final ColorModel model = Provider.of<ColorModel>(context);
    IrooniData irooniData;
    WebSocketProvider provider = WebSocketProvider();
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  const Color.fromARGB(255, 0, 107, 161),
        title: const Text(
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
                  image: AssetImage('assets/Images/irosagashi/irooni_background.png')
              ),
            ),
          ),
          Center(
            child: StreamBuilder(
              stream: provider.socketStream,
              builder: (context, snapshot){
                List pkList = provider.packet.dataPackets;
                pkList.forEach((element) {

                });
                return Column(
                  children: [
                    IrooniTimerWidget(irooniData),
                    Padding(
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
                    ),
                    Container(
                      //height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.05, 0, MediaQuery.of(context).size.height * 0.05),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: irooniData.color,
                        border: Border.all(color: Color.fromARGB(255, 83, 42, 35), width: 2),
                      ),
                      child: Text(
                        irooniData.kana,
                        style: TextStyle(
                          fontFamily: 'satsuki',
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          color: irooniData.getAnswerLetterColor(),
                          letterSpacing: -8,
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      alignment: Alignment.center,
                      child: Text(
                        'をさがしてね！',
                        style: TextStyle(
                          fontFamily: 'satsuki',
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Colors.black,
                          letterSpacing: -4,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, '/irooni/camera', arguments: irooniData);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: MediaQuery.of(context).size.height * 0.1,
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.all(5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(color: Colors.black, blurRadius: 5,),
                          ],
                        ),
                        child: Text(
                          'みつけた！',
                          style: TextStyle(
                            fontFamily: 'satsuki',
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 215, 0, 59),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}