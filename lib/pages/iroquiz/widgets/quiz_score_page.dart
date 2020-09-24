import 'package:flutter/material.dart';
import 'package:iromikke/model/user_model.dart';

import 'package:iromikke/pages/iroquiz/iroquiz_utils/quiz_provider.dart';
import 'package:provider/provider.dart';

class QuizScorePage extends StatelessWidget{
  final QuizProvider _quizProvider = QuizProvider();

  @override
  Widget build(BuildContext context) {
    final UserModel model = Provider.of<UserModel>(context, listen: true);
    if(model.highScore == null || model.highScore < _quizProvider.correctedCount * 10){
      model.highScore = _quizProvider.correctedCount * 10;
    }
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
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
                ),
                _scoreWidget(context, 'ハイスコア', model.highScore),
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
                ),
                _scoreWidget(context, '今回のスコア', _quizProvider.correctedCount * 10),
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.025),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _transitionButton(context, 'つづける', 0),
//                    Padding(
//                      padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.1),
//                    ),
                    _transitionButton(context, 'やめる', 1),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _scoreWidget(BuildContext context, String name, int score){
    return Column(
      children: [
        Text(
          name,
          style: TextStyle(
            fontFamily: 'satsuki',
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 40, 206, 40),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.height * 0.2,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 151, 211, 29),
            border: Border.all(
                color: Color.fromARGB(255, 85, 43, 36),
                width: 4.0
            ),
          ),
          child:
          Stack(
            children: [
              Text(
                '$score点',
                style: TextStyle(
                  fontFamily: 'satsuki',
                  fontSize: 80.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                '$score点',
                style: TextStyle(
                  fontFamily: 'satsuki',
                  fontSize: 80.0,
                  fontWeight: FontWeight.normal,
                  color: Color.fromARGB(255, 40, 206, 40),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _transitionButton(BuildContext context, String name, int index){
    return GestureDetector(
      behavior: HitTestBehavior.deferToChild,
      onTap: () => _onTransitionButtonTap(context, index),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.075,
        width: MediaQuery.of(context).size.width * 0.35,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 151, 211, 29),
          border: Border.all(
            color: Color.fromARGB(255, 85, 43, 36),
            width: 4.0,
          ),
        ),
        child: Stack(
          children: [
            Text(
              name,
              style: TextStyle(
                fontFamily: 'satsuki',
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
//            Text(
//              name,
//              style: TextStyle(
//                fontFamily: 'satsuki',
//                fontSize: 30.0,
//                fontWeight: FontWeight.normal,
//                color: Color.fromARGB(255, 40, 206, 40),
//              ),
//            ),
          ],
        ),
      ),
    );
  }

  void _onTransitionButtonTap(BuildContext context, int index){
    QuizProvider.closeInstance();
    switch(index){
      case 0 :
        Navigator.pushNamedAndRemoveUntil(context, '/quiz/question', ModalRoute.withName('/quiz/title'));
        break;
      case 1 :
        Navigator.pushNamedAndRemoveUntil(context, '/title', (route) => false);
        break;
      default :
        print('無効な値');
        Navigator.pushNamedAndRemoveUntil(context, '/title', (route) => false);
    }
  }
}