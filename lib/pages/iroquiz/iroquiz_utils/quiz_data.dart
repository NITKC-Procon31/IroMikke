import 'dart:async';

import 'package:iromikke/pages/iroquiz/iroquiz_utils/quiz_provider.dart';

class QuizData{
  final int maxSecond = 10;

  List<dynamic> _optionList = List();
  var _quizMode;
  int _answerIndex;
  bool _pressed = false;

  int _userAnswer = -1;

  int get quizMode => _quizMode.index;
  int get answerIndex => _answerIndex;
  List get optionList => _optionList;
  bool get pressed => _pressed;
  int get userAnswer => _userAnswer;

  set userAnswer(int index) => 0 <= index && index < 3 ? _userAnswer = index : print('予期せぬ値');

  QuizData(this._quizMode, this._optionList, this._answerIndex);

  String toString(){
    switch(_quizMode){
      case QuizType.colorName:
        return '${_optionList[0].kana}, ${_optionList[1].kana}, ${_optionList[2].kana}, ans = ${_optionList[_answerIndex].kana}';
        break;
      case QuizType.colorMix:
        return 'にゃーん';
        break;
      case QuizType.colorDerivation:
        return 'ぎにゃぁ';
        break;
      default:
        return '予期せぬ quizMode';
    }
  }

  void onPressed(){
    _pressed = true;
  }
}