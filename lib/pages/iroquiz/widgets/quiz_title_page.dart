import 'package:flutter/material.dart';
import 'package:iromikke/pages/iroquiz/iroquiz_utils/quiz_provider.dart';

class QuizTitlePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 150, 211, 28),
        title: Text(
          'いろくいず',
          style: TextStyle(
            fontFamily: 'satsuki',
            fontSize: 40.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
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
          Column(
            children: [
              _quizTitle(context),
              GestureDetector(
                onTapUp: (details){
                  if(QuizProvider.hasInstance()){
                    QuizProvider.closeInstance();
                  }
                  Navigator.pushNamedAndRemoveUntil(context, '/quiz/question', ModalRoute.withName('/quiz/title'));
                },
                behavior: HitTestBehavior.deferToChild,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.05, 0, MediaQuery.of(context).size.height * 0.05),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    border: Border.all(
                      color: Color.fromARGB(255, 83, 42, 35),
                      width: 4.0,
                    ),
                  ),
                  child: Text(
                    'あそぶ',
                    style: TextStyle(
                      color: Color.fromARGB(255, 40, 206, 40),
                      fontSize: 60.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'satsuki',
                      letterSpacing: -8.0,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTapUp: (details){
                  print('にゃーん');
                  //追記予定
                },
                behavior: HitTestBehavior.deferToChild,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.05, 0, MediaQuery.of(context).size.height * 0.05),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    border: Border.all(
                      color: Color.fromARGB(255, 83, 42, 35),
                      width: 4.0,
                    ),
                  ),
                  child: Text(
                    'あそびかた',
                    style: TextStyle(
                      color: Color.fromARGB(255, 40, 206, 40),
                      fontSize: 60.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'satsuki',
                      letterSpacing: -8.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _quizTitle(BuildContext context){
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.05, 0, MediaQuery.of(context).size.height * 0.05),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'い',
                style: TextStyle(
                  fontSize: 70.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'satsuki',
                  color: Colors.white,
                ),
              ),
              Text(
                'ろ',
                style: TextStyle(
                  fontSize: 70.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'satsuki',
                  color: Colors.white,
                ),
              ),
              Text(
                'く',
                style: TextStyle(
                  fontSize: 70.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'satsuki',
                  color: Colors.white,
                ),
              ),
              Text(
                'い',
                style: TextStyle(
                  fontSize: 70.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'satsuki',
                  color: Colors.white,
                ),
              ),
              Text(
                'ず',
                style: TextStyle(
                  fontSize: 70.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'satsuki',
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'い',
                style: TextStyle(
                  fontSize: 70.0,
                  fontFamily: 'satsuki',
                  color: Color.fromARGB(255, 170, 255, 0),
                ),
              ),
              Text(
                'ろ',
                style: TextStyle(
                  fontSize: 70.0,
                  fontFamily: 'satsuki',
                  color: Color.fromARGB(255, 40, 2006, 40),
                ),
              ),
              Text(
                'く',
                style: TextStyle(
                  fontSize: 70.0,
                  fontFamily: 'satsuki',
                  color: Color.fromARGB(255, 127, 255, 127),
                ),
              ),
              Text(
                'い',
                style: TextStyle(
                  fontSize: 70.0,
                  fontFamily: 'satsuki',
                  color: Color.fromARGB(255, 40, 2006, 40),
                ),
              ),
              Text(
                'ず',
                style: TextStyle(
                  fontSize: 70.0,
                  fontFamily: 'satsuki',
                  color: Color.fromARGB(255, 170, 255, 0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}