import 'dart:math';

import 'package:provider/provider.dart';

import 'package:iromikke/model/color_model.dart';

enum _QuizType{
  colorName,
  colorMix,
  colorDerivation,
}

class QuizProvider {

  var _quizMode;
  List<Map<String, dynamic>> _optionList;
  List<bool> _isAnswer = [false, false, false];

  final ColorModel model = ColorModel();


  QuizProvider(){
    _quizMode = _QuizType.colorName;
  }

  void _initQuiz(){
    switch(_quizMode){
      case _QuizType.colorName:
        _provideColorNameQuiz();
        break;
      case _QuizType.colorDerivation:
        //_colorDerivation();
        break;
      case _QuizType.colorMix:
        //_colorMix();
        break;
      default:
        print('QuizProvider.initQuiz: 無効な値');
    }
  }

  void _provideColorNameQuiz(){
    //色名当てクイズ作成処理
    int answerIndex = Random().nextInt(3);
    _isAnswer[answerIndex] = true;

  }
}