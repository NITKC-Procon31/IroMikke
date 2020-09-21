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
          Row(
            children: [
              RaisedButton(
                child: Text('もういっかい'),
                onPressed: () {
                  QuizProvider.closeInstance();
                  Navigator.pushNamedAndRemoveUntil(context, '/quiz/question', ModalRoute.withName('/quiz/title'));
                },
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
              ),
              RaisedButton(
                child: Text('たいとる'),
                onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/title', ModalRoute.withName('/title')),
              ),
              Text('${_quizProvider.correctedCount} / ${_quizProvider.quizCount}'),
            ],
          ),
        ],
      ),
    );
  }
}