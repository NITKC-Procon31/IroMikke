import 'package:flutter/material.dart';

class QuizScorePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
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
                onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/quiz/question', (route) => false),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
              ),
              RaisedButton(
                child: Text('たいとる'),
                onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/title', (route) => false),
              ),
            ],
          ),
        ],
      ),
    );
  }
}