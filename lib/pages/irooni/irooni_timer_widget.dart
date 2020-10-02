import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iromikke/pages/irooni/utils/irooni_data.dart';
import 'package:iromikke/pages/irosagashi/utils/irosagashi_data.dart';

class IrooniTimerWidget extends StatefulWidget{
  IrooniData _irooniData;

  IrooniTimerWidget(this._irooniData);

  @override
  _IrooniTimerWidgetState createState() => _IrooniTimerWidgetState(_irooniData);
}

class _IrooniTimerWidgetState extends State<IrooniTimerWidget> {

  IrooniData _irooniData;

  _IrooniTimerWidgetState(this._irooniData);

  Timer _timer;

  @override
  void initState(){
    _timer  = Timer.periodic(Duration(seconds: 1), (timer) {setState(() {
      print(_irooniData.second.toString());
      if(_irooniData.second <= 0){
        _timer.cancel();
        print('時間切れ');
        //.pushNamedAndRemoveUntil(context, '/irosagashi/answer', ModalRoute.withName('/irosagashi/title'), arguments: _irooniData);
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
      color: const Color.fromARGB(255, 0, 97, 151),
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
            _irooniData.second.toString(),
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