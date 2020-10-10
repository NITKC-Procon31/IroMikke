import 'dart:convert';
import 'dart:typed_data';
import 'dart:io';
import 'package:iromikke/model/user_model.dart';
import 'package:iromikke/network/yukana/ding_packet.dart';
import 'package:iromikke/network/yukana/dong_packet.dart';
import 'package:web_socket_channel/io.dart';

class WebSocketProvider{

  var webSocket;
  List _packetList;
  final String host = 'yukana.xyz';
  final int port = 37564;
  var _packet;
  var socketStream;

  static WebSocketProvider _instance;

  get packet => _packet;

  WebSocketProvider.newProvider();

  factory WebSocketProvider(){
    if(_instance == null){
      _instance = WebSocketProvider.newProvider();
    }
    return _instance;
  }

  static bool hasInstance(){
    return _instance != null;
  }

  void connectSocket(){
    if(webSocket == null){
      webSocket = IOWebSocketChannel.connect('ws://$host:$port');
      socketStream = webSocket.stream.listen((message){
        print('WebSocketProvider $message');
        Uint8List uint8list = Uint8List.fromList(base64.decode(message));
        DongPacket packet = new DongPacket();
        packet.buffer = ByteData.sublistView(uint8list);
        packet.decode();
        _packet = packet;
      });
    }
  }

  void sendPacket(DingPacket packet){
    webSocket.sink.add(base64.encode(packet.buffer.buffer.asUint8List(0, packet.writeOffset)));
  } //encode済みのDingPacketを受け取る
}