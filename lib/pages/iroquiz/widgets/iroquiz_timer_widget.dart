import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iromikke/pages/iroquiz/iroquiz_utils/quiz_provider.dart';
import 'package:iromikke/pages/irosagashi/utils/irosagashi_data.dart';

class IroquizTimerWidget extends StatefulWidget{
  @override
  _IroquizTimerWidgetState createState() => _IroquizTimerWidgetState();
}

class _IroquizTimerWidgetState extends State<IroquizTimerWidget> {
  Timer _timer;
  int _maxSecond = 20;
  QuizProvider _quizProvider = QuizProvider();

  @override
  void initState(){
    _timer  = Timer.periodic(Duration(seconds: 1), (timer) {setState(() {
      _maxSecond--;
      print(_maxSecond);
      if(_maxSecond <= 0){
        _timer.cancel();
        if(_quizProvider.quizCount < QuizProvider.quizMax){
          Navigator.pushNamedAndRemoveUntil(context, '/quiz/question', ModalRoute.withName('/quiz/title'));
        }
        else{
          Navigator.pushNamedAndRemoveUntil(context, '/quiz/score', ModalRoute.withName('/quiz/title'));
        }
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
      color: const Color.fromARGB(255, 140, 201, 18),
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
            _maxSecond.toString(),
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