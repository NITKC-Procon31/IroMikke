import 'dart:async';

import 'package:iromikke/pages/iroquiz/iroquiz_utils/quiz_provider.dart';

class QuizData{
  final int maxSecond = 60;

  List<dynamic> _opttionList = List();
  var _quizMode;
  int _answerIndex;
  Timer _timer;

  int get tickCount => _timer.tick;
  int get quizMode => _quizMode.index;
  int get answerIndex => _answerIndex;
  List get optionList => _opttionList;

  QuizData(this._quizMode, this._opttionList, this._answerIndex){
    //_timer = Timer(Duration(seconds: maxSecond), null);
  }

  void stopTimer(){
    _timer.cancel();
  }

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
}