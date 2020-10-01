import 'package:flutter/material.dart';
import 'package:iromikke/entity/traditional_color.dart';
import 'package:iromikke/model/color_model.dart';

import 'package:iromikke/pages/iroquiz/iroquiz_utils/quiz_provider.dart';
import 'package:iromikke/pages/iroquiz/iroquiz_utils/quiz_data.dart';
import 'package:iromikke/pages/iroquiz/widgets/iroquiz_timer_widget.dart';
import 'package:iromikke/pages/iroquiz/widgets/quiz_color_name_widget.dart';
import 'package:provider/provider.dart';

class QuizQuestionPage extends StatelessWidget{

  QuizProvider _quizProvider;
  QuizData _quizData;

  @override
  Widget build(BuildContext context) {
    ColorModel model = Provider.of<ColorModel>(context, listen: true);
    _quizProvider = QuizProvider();
    _quizData = _quizProvider.initQuiz(model);
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
          _quizWidget(context),
          //画面遷移テスト用のボタン
//          RaisedButton(
//            child: Text('てすと'),
//            onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/quiz/answer', (route) => false),
//          ),
//          FutureBuilder(
//            future: getQuiz(),
//            builder: (context, snapshot){
//              if(snapshot.connectionState == ConnectionState.done){
//                if(snapshot.hasError){
//                  return Center(
//                    child: Text('エラーがはっせいしました', style: TextStyle(fontSize: 45.0, color: Colors.black, fontFamily: 'Haranyan'),),
//                  );
//                }
//                if(!snapshot.hasData){
//                  return Center(
//                    child: Text('データをしゅとくできませんでした', style: TextStyle(fontSize: 45.0, color: Colors.black, fontFamily: 'Haranyan'),),
//                  );
//                }
//                return _quizWidget(context);
//              }
//              else{
//                return const CircularProgressIndicator();
//              }
//            },
//          ),
        ],
      ),
      floatingActionButton:FloatingActionButton(
        child: Icon(Icons.navigate_next),
        onPressed: () {
          if(_quizData.pressed){
            if(_quizData.userAnswer == _quizData.answerIndex){
              _quizProvider.answerCorrected();
            }
            if(_quizProvider.quizCount < QuizProvider.quizMax){
              Navigator.pushNamedAndRemoveUntil(context, '/quiz/question', ModalRoute.withName('/quiz/title'));
            }
            else{
              Navigator.pushNamedAndRemoveUntil(context, '/quiz/score', ModalRoute.withName('/quiz/title'));
            }
          }
        },
        tooltip: 'floating action buton',
      ),
    );
  }

//  Future<int> getQuiz() async{
//    _quizProvider = QuizProvider();
//    _quizData = await _quizProvider.initQuiz();
//    print('${_quizProvider.quizCount}問目,${_quizData.toString()}');
//    return 1;
//  }

  Widget _quizWidget(BuildContext context){
    return Column(
      children: [
        IroquizTimerWidget(),
        ColorNameQuizWidget(_quizData),
      ],
    );
  }
}
