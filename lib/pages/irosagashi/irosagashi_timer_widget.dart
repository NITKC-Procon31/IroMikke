import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iromikke/pages/irosagashi/utils/irosagashi_data.dart';

class IrosagashiTimerWidget extends StatefulWidget{
  IrosagashiData _irosagashiData;

  IrosagashiTimerWidget(this._irosagashiData);

  @override
  _IrosagashiTimerWidgetState createState() => _IrosagashiTimerWidgetState(_irosagashiData);
}

class _IrosagashiTimerWidgetState extends State<IrosagashiTimerWidget> {

  IrosagashiData _irosagashiData;

  _IrosagashiTimerWidgetState(this._irosagashiData);

  Timer _timer;

  @override
  void initState(){
    _timer  = Timer.periodic(Duration(seconds: 1), (timer) {setState(() {
      print(_irosagashiData.second.toString());
      if(_irosagashiData.second <= 0){
        _timer.cancel();
        Navigator.pushNamedAndRemoveUntil(context, '/irosagashi/answer', ModalRoute.withName('/irosagashi/title'), arguments: _irosagashiData);
      }
    });});
    super.initState();
  }

  @override
  void dispose(){
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.05,
      color: const Color.fromARGB(255, 215, 106, 1),
      child: Row(
        children: [
          Text(
            'のこり',
            style: TextStyle(
              fontFamily: 'satsuki',
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            _irosagashiData.second.toString(),
            style: TextStyle(
              fontFamily: 'satsuki',
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              backgroundColor: Colors.black,
            ),
          ),
          Text(
            'びょう',
            style: TextStyle(
              fontFamily: 'satsuki',
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}