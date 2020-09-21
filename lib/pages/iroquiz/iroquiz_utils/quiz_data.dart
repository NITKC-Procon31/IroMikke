import 'dart:async';

import 'package:iromikke/pages/iroquiz/iroquiz_utils/quiz_provider.dart';

class QuizData{
  final int maxSecond = 10;

  List<dynamic> _opttionList = List();
  var _quizMode;
  int _answerIndex;
  bool _pressed = false;

  int _userAnswer = -1;

  int get quizMode => _quizMode.index;
  int get answerIndex => _answerIndex;
  List get optionList => _opttionList;
  bool get pressed => _pressed;
  int get userAnswer => _userAnswer;

  set userAnswer(int index) => 0 <= index && index < 3 ? _userAnswer = index : print('予期せぬ値');

  QuizData(this._quizMode, this._opttionList, this._answerIndex);

  String toString(){
    switch(_quizMode){
      case QuizType.colorName:
        return '${_opttionList[0].kana}, ${_opttionList[1].kana}, ${_opttionList[2].kana}, ans = ${_opttionList[_answerIndex].kana}';
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