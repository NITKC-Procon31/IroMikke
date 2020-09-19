import 'package:flutter/material.dart';
import 'package:iromikke/entity/traditional_color.dart';

import 'package:iromikke/pages/iroquiz/iroquiz_utils/quiz_provider.dart';
import 'package:iromikke/pages/iroquiz/iroquiz_utils/quiz_data.dart';

class QuizQuestionPage extends StatelessWidget{

  QuizData _quizData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 150, 211, 28),
        title: Text(
          'もんだい',
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
//          RaisedButton(
//            child: Text('てすと'),
//            onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/quiz/answer', (route) => false),
//          ),
          FutureBuilder(
            future: getQuiz(),
            builder: (context, snapshot){
              if(snapshot.connectionState == ConnectionState.done){
                if(snapshot.hasError){
                  return Center(
                    child: Text('エラーがはっせいしました', style: TextStyle(fontSize: 45.0, color: Colors.black, fontFamily: 'Haranyan'),),
                  );
                }
                if(!snapshot.hasData){
                  return Center(
                    child: Text('データをしゅとくできませんでした', style: TextStyle(fontSize: 45.0, color: Colors.black, fontFamily: 'Haranyan'),),
                  );
                }
                return _colorNameQuizWidget(context);
              }
              else{
                return const CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }

  Future<int> getQuiz() async{
    _quizData = await QuizProvider().initQuiz();
    print(_quizData.toString());
    return 1;
  }

  Widget _colorNameQuizWidget(BuildContext context){
    TraditionalColor tColor = _quizData.optionList[_quizData.answerIndex];
    Color answer = Color.fromARGB(255, tColor.rgb.r, tColor.rgb.g, tColor.rgb.b);
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: Text(
            'Qこの色はなに色？',
            style: TextStyle(
              fontFamily: 'satsuki',
              color: Color.fromARGB(255, 83, 42, 35),
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              letterSpacing: -4.0,
            ),
          ),
          margin: EdgeInsets.all(10.0),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.width * 0.6,
          margin: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: answer,
            border: Border.all(
              color: Color.fromARGB(255, 83, 42, 35),
              width: 5.0,
            ),
          ),
        ),
        _colorNameQuizRow(context, 0),
        _colorNameQuizRow(context, 1),
        _colorNameQuizRow(context, 2),
      ],
    );
  }

  Widget _colorNameQuizRow(BuildContext context, int index){
    return GestureDetector(
      behavior: HitTestBehavior.deferToChild,
      child: Container(
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.all(4.0),
        width: MediaQuery.of(context).size.width * 0.8,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Color.fromARGB(255, 83, 42, 35),
            width: 5.0,
          ),
        ),
        child: Text(
          _quizData.optionList[index].kana,
          style: TextStyle(
            fontFamily: 'satsuki',
            fontWeight: FontWeight.bold,
            fontSize: 40.0,
            color: Color.fromARGB(255, 83, 42, 35),
            letterSpacing: -8.0,
          ),
        ),
      ),
    );
  }
}