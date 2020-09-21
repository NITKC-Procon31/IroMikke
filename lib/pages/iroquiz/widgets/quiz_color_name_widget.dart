import 'package:flutter/material.dart';

import 'package:iromikke/pages/iroquiz/iroquiz_utils/quiz_data.dart';
import 'package:iromikke/entity/traditional_color.dart';

class ColorNameQuizWidget extends StatelessWidget{

  QuizData _quizData;

  ColorNameQuizWidget(this._quizData);

  @override
  Widget build(BuildContext context) {
    TraditionalColor tColor = _quizData.optionList[_quizData.answerIndex];
    Color answer = Color.fromARGB(255, tColor.rgb.r, tColor.rgb.g, tColor.rgb.b);
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Qこの色はなに色？',
                  style: TextStyle(
                    fontFamily: 'satsuki',
                    color: Color.fromARGB(255, 83, 42, 35),
                    fontSize: MediaQuery.of(context).size.height * 0.06,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -4.0,
                  ),
                ),
                margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
              ),
              Container(
                width: MediaQuery.of(context).size.height * 0.3,
                height: MediaQuery.of(context).size.height * 0.3,
                margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
                decoration: BoxDecoration(
                  color: answer,
                  border: Border.all(
                    color: Color.fromARGB(255, 83, 42, 35),
                    width: 5.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        _ColorNameQuizList(_quizData),
      ],
    );
  }
}

class _ColorNameQuizList extends StatefulWidget{
  QuizData _quizData;

  _ColorNameQuizList(this._quizData);

  @override
  _ColorNameQuizListState createState() => _ColorNameQuizListState(_quizData);
}

class _ColorNameQuizListState extends State<_ColorNameQuizList>{
  QuizData _quizData;

  _ColorNameQuizListState(this._quizData);

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        _colorNameQuizRow(context, 0),
        _colorNameQuizRow(context, 1),
        _colorNameQuizRow(context, 2),
      ],
    );
  }

  Widget _colorNameQuizRow(BuildContext context, int index) {
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
          color: Colors.white,
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
            color: Color.fromARGB(255, 83, 42, 35),
            letterSpacing: -8.0,
          ),
        ),
      ),
    );
  }
}