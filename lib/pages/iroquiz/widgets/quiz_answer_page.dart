import 'package:flutter/material.dart';
import 'package:iromikke/pages/iroquiz/iroquiz_utils/quiz_data.dart';

class QuizAnswerPage extends StatelessWidget{

  QuizData _quizData;

  @override
  Widget build(BuildContext context) {
    _quizData = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 150, 211, 28),
        title: Text(
          'こたえ',
          style: TextStyle(
            fontFamily: 'satsuki',
            fontWeight: FontWeight.bold,
            fontSize: 40.0,
            color: Colors.white,
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
                image: AssetImage('assets/Images/iroquiz/iroquiz_background.png'),
              ),
            ),
          ),
          //画面遷移テスト用のボタン
          Column(
            children: [
            ],
          ),
        ],
      ),
    );
  }
}