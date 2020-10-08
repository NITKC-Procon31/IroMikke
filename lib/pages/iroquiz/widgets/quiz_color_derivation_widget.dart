import 'package:flutter/material.dart';

import 'package:iromikke/pages/iroquiz/iroquiz_utils/quiz_data.dart';
import 'package:iromikke/entity/traditional_color.dart';

class ColorOriginQuizWidget extends StatelessWidget{

  final QuizData _quizData;

  ColorOriginQuizWidget(this._quizData);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: Text(
            'Qこの色はなに色？',
            style: TextStyle(
              fontFamily: 'satsuki',
              color: const Color.fromARGB(255, 83, 42, 35),
              fontSize: MediaQuery.of(context).size.height * 0.06,
              fontWeight: FontWeight.bold,
              letterSpacing: -4.0,
            ),
          ),
          margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
        ),
        _ColorQuizWidget(_quizData),
      ],
    );
  }
}

class _ColorQuizWidget extends StatefulWidget{
  QuizData _quizData;
  _ColorQuizWidget(this._quizData);
  @override
  _ColorQuizWidgetState createState() => _ColorQuizWidgetState(this._quizData);
}

class _ColorQuizWidgetState extends State<_ColorQuizWidget>{
  QuizData _quizData;
  _ColorQuizWidgetState(this._quizData);

  @override
  Widget build(BuildContext context) {
    print('${_quizData.answerTColor.origin}いいいい');
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.3,
          margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height * 0.01, MediaQuery.of(context).size.height * 0.05, MediaQuery.of(context).size.height * 0.01, MediaQuery.of(context).size.height * 0.01),
          decoration: BoxDecoration(
//            border: Border.all(
//              color: Color.fromARGB(255, 83, 42, 35),
//              width: 5.0,
//            ),
            image: DecorationImage(
              fit: BoxFit.contain,
              image: _quizData.userAnswer > -1 ? (
                  _quizData.userAnswer == _quizData.answerIndex ? AssetImage('assets/Images/iroquiz/circle.png') : AssetImage('assets/Images/iroquiz/batsu.png')
              ) : AssetImage('assets/Images/iroquiz/touka.png'),
            ),
          ),
          child: Text(
            _quizData.answerTColor.origin,
            style: TextStyle(
              fontFamily: 'satsuki',
              color: Colors.black,
              fontSize: 35.0,
              letterSpacing: -8,
            ),
          ),
        ),
        _colorOriginQuizRow(context, 0),
        _colorOriginQuizRow(context, 1),
        _colorOriginQuizRow(context, 2),
      ],
    );
  }

  Widget _colorOriginQuizRow(BuildContext context, int index) {
    return GestureDetector(
      behavior: HitTestBehavior.deferToChild,
      onTap: () {
        _quizData.userAnswer = index;
        if(!_quizData.pressed){
          setState(() {
            _quizData.onPressed();
          });
        }
      },
      child: Container(
        margin: EdgeInsets.all(MediaQuery.of(context).size.height*0.01),
        padding: EdgeInsets.all(4.0),
        width: MediaQuery.of(context).size.width * 0.8,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: _quizData.getColorFromIndex(index),
          border: Border.all(
            color: _quizData.pressed ? (index == _quizData.answerIndex ? Colors.red : Colors.blue) : Color.fromARGB(255, 83, 42, 35),
            width: 5.0,
          ),
        ),
        child: Text(
          _quizData.optionList[index].kana,
          style: TextStyle(
            fontFamily: 'satsuki',
            fontWeight: FontWeight.bold,
            fontSize: MediaQuery.of(context).size.height * 0.05,
            color: _quizData.getAnswerLetterColor(index),
            letterSpacing: -8.0,
          ),
        ),
      ),
    );
  }
}