import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:iromikke/entity/traditional_color.dart';
import 'package:iromikke/pages/iroquiz/iroquiz_utils/quiz_provider.dart';
import 'package:iromikke/pages/iroquiz/iroquiz_utils/quiz_type.dart';
import 'package:iromikke/utils/rgb_color.dart';

class QuizData {

  final int maxSecond = 10;

  List<TraditionalColor> _optionList = List();
  int _quizMode;
  int _answerIndex;
  bool _pressed = false;

  int _userAnswer = -1;

  int get quizMode => _quizMode;
  int get answerIndex => _answerIndex;
  List get optionList => _optionList;
  bool get pressed => _pressed;
  int get userAnswer => _userAnswer;
  TraditionalColor get answerTColor => _optionList[_answerIndex];

  set userAnswer(int index) => 0 <= index && index < 3 ? _userAnswer = index : print('予期せぬ値');

  QuizData(this._quizMode, this._optionList, this._answerIndex);

  String toString() {
    switch (_quizMode) {
      case QuizType.colorName:
      case QuizType.colorOrigin:
        return '${_optionList[0].kana}, ${_optionList[1].kana}, ${_optionList[2].kana}, ans = ${_optionList[_answerIndex].kana}';
        break;
      case QuizType.colorMix:
        return 'にゃーん';
        break;
      default:
        return '予期せぬ quizMode';
    }
  }

  Color getColorFromIndex(int index){
    return Color.fromARGB(255, _optionList[index].rgb.r, _optionList[index].rgb.g, _optionList[index].rgb.b);
  }

  void onPressed() {
    _pressed = true;
  }

  Color getAnswerLetterColor(int index){
    if(_optionList[index].rgb.distance(RGBColor(0, 0, 0)) <= _optionList[index].rgb.distance(RGBColor(255, 255, 255))){
      return Colors.white;
    } else {
      return Colors.black;
    }
  }
}