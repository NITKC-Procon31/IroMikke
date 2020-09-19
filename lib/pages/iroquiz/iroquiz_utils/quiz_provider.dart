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

class QuizProvider {

  Math.Random random = Math.Random();

  Future<QuizData> initQuiz() async{
    var quizMode = QuizType.colorName;
    switch(quizMode){
      case QuizType.colorName:
        return await _provideColorNameQuiz();
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

  Future<QuizData> _provideColorNameQuiz() async{
    final ColorModel model = ColorModel();
    List<TraditionalColor> optionList = List();
    while(model.length == 0){
      await Future.delayed(Duration(milliseconds: 1));
    }
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