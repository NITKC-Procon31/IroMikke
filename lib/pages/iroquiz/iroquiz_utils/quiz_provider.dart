import 'dart:io';
import 'dart:math' as Math;

import 'package:provider/provider.dart';

import 'package:iromikke/entity/traditional_color.dart';
import 'package:iromikke/model/color_model.dart';
import 'package:iromikke/pages/iroquiz/iroquiz_utils/quiz_data.dart';

enum QuizType{
  colorName,
  colorMix,
  colorDerivation,
}

//なんちゃってシングルトン化
//一連の制限時間内では同じインスタンスを使う感じ

class QuizProvider {

  static QuizProvider _instance;
  Math.Random random = Math.Random();
  int _quizCount = 0;
  int _correctedCount = 0;

  static const int quizMax = 10;

  QuizProvider._();

  int get quizCount => _quizCount;
  int get correctedCount => _correctedCount;

  factory QuizProvider(){
    if (_instance == null) {
      _instance = QuizProvider._();
    }
    return _instance;
  }

  static bool hasInstance(){
    return _instance != null;
  }

  static void closeInstance(){
    _instance = null;
  }

  void answerCorrected(){
    _correctedCount++;
  }

  QuizData initQuiz(ColorModel model){
    _quizCount++;
    var quizMode = QuizType.colorName;
    switch(quizMode){
      case QuizType.colorName:
        return _provideColorNameQuiz(model);
        break;
      case QuizType.colorDerivation:
        //return _colorDerivation();
        break;
      case QuizType.colorMix:
        //return _colorMix();
        break;
      default:
        print('QuizProvider.initQuiz: 無効な値');
        return null;
    }
  }

  QuizData _provideColorNameQuiz(ColorModel model){
    List<TraditionalColor> optionList = List();
    optionList.add(model.getById(random.nextInt(model.length) + 1));
    int startIndex = random.nextInt(model.length);
    for(int i = 0; i < model.length && optionList.length < 3; i++){
      int num = (startIndex + i) % model.length + 1;
      TraditionalColor temp = model.getById(num);
      if(optionList[0].id != temp.id && optionList[0].rgb.distance(temp.rgb) < 20.0){
        optionList.add(temp);
        i += 50;
      }
    }
    return QuizData(QuizType.colorName, optionList, random.nextInt(3));
  }
}