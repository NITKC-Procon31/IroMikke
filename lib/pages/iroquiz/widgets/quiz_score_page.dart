import 'package:flutter/material.dart';

import 'package:iromikke/pages/iroquiz/iroquiz_utils/quiz_provider.dart';

class QuizScorePage extends StatelessWidget{
  QuizProvider _quizProvider;

  @override
  Widget build(BuildContext context) {
    _quizProvider = QuizProvider();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 150, 211, 28),
        title: Text(
          'とくてん',
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
          Center(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.2,
                  color: Colors.green,
                  margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.2,
                  color: Colors.green,
                  margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}