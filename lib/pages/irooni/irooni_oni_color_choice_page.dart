import 'dart:math' as Math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iromikke/entity/traditional_color.dart';
import 'package:iromikke/model/color_model.dart';
import 'package:iromikke/network/yukana/ding_packet.dart';
import 'package:iromikke/network/yukana/protocol/packet_pool.dart';
import 'package:iromikke/network/yukana/protocol/packet_type.dart';
import 'package:iromikke/network/yukana/protocol/send_color_packet.dart';
import 'package:iromikke/pages/irooni/utils/irooni_web_socket_provider.dart';
import 'package:provider/provider.dart';

class IrooniOniColorChoicePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final Math.Random random = Math.Random();
    final ColorModel model = Provider.of<ColorModel>(context, listen: true);
    print(model.length);
    List<TraditionalColor> list = List();
    for(int i=0; i<4; i++){
      list.add(model.getById(random.nextInt(model.length) + 1));
    }
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
          Center(
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
                    child: Text(
                      'いろをえらんでね',
                      style: TextStyle(
                        fontFamily: 'satsuki',
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 255, 98, 42),
                        fontSize: 50.0,
                        letterSpacing: -8,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: _ColorChoiceWidget(list),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _ColorChoiceWidget extends StatefulWidget{
  List<TraditionalColor> _list;
  _ColorChoiceWidget(this._list);
  @override
  _ColorChoiceWidgetState createState() => _ColorChoiceWidgetState(_list);
}

class _ColorChoiceWidgetState extends State<_ColorChoiceWidget>{
  @override

  List<TraditionalColor> _list;
  int _selectedIndex = -1;

  _ColorChoiceWidgetState(this._list);

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _colorContainer(context, 0),
            _colorContainer(context, 1),
            _colorContainer(context, 2),
            _colorContainer(context, 3),
          ],
        ),
        Container(
          padding: EdgeInsets.all(5),
          child: Text(
            _selectedIndex >= 0 ? _list[_selectedIndex].kana : '',
            style: TextStyle(
              fontFamily: 'satsuki',
              fontWeight: FontWeight.bold,
              fontSize: 50.0,
              color: Colors.black,
              letterSpacing: -8,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            print(_list[_selectedIndex].kana);
            _sendSCPacket();
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            padding: EdgeInsets.all(5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: const Color.fromARGB(255, 83, 42, 35), width: 2),
              color: Colors.white,
            ),
            child: Text(
              'けってい',
              style: TextStyle(
                fontFamily: 'satsuki',
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 83, 42, 35),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _sendSCPacket(){
    WebSocketProvider provider = WebSocketProvider();
    DingPacket packet = new DingPacket();
    SendColorPacket scPacket = PacketPool.getPacketById(PacketType.PACKET_SEND_COLOR);
    scPacket.colorId = _list[_selectedIndex].id;
    packet.addPacket(scPacket);
    packet.encode();
    provider.sendPacket(packet);
  }

  Widget _colorContainer(BuildContext context, int index){
    return GestureDetector(
      onTap: (){
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.width * 0.2,
        decoration: BoxDecoration(
          border: Border.all(color: _selectedIndex == index ? Colors.yellow : Colors.black, width: 3),
          color: Color.fromARGB(255, _list[index].rgb.r, _list[index].rgb.g, _list[index].rgb.b),
        ),
      ),
    );
  }
}