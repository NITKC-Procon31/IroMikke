import 'dart:math';

import 'package:iromikke/service/color_database.dart';
import 'package:sqflite/sqflite.dart';

enum _QuizType{
  colorName,
  colorMix,
  colorDerivation,
}

class QuizProvider {

  var _quizMode;
  List<Map<String, dynamic>> _optionList;
  var _answerIndex;

  ColorDatabase _provider;
  Database _database;
  List<Map<String, dynamic>> _databaseList;

  int get quizeMode => _quizMode;

  List get optionList => _optionList;

  int get answerIndex => _answerIndex;

  QuizProvider(){
    _quizMode =
    //_quizMode = Random().nextInt(3);
    _getDatabase();
  }

  Future _getDatabase() async{
    _provider = ColorDatabase();
    _database = await _provider.database;
    _databaseList = await _database.rawQuery('SELECT * FROM colors');
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
  }
}