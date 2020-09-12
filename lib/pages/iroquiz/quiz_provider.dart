import 'dart:math';

import 'package:iromikke/service/color_database.dart';
import 'package:sqflite/sqflite.dart';

class QuizProvider {

  int _quizMode;
  List<Map<String, dynamic>> _optionList;
  int _answerIndex;

  ColorDatabase _provider;
  Database _database;
  List<Map<String, dynamic>> _databaseList;

  int get quizeMode => _quizMode;

  List get optionList => _optionList;

  int get answerIndex => _answerIndex;

  QuizProvider() {
    _quizMode = Random().nextInt(3);
    _initQuiz();
  }

  Future _initQuiz() async{
    _provider = ColorDatabase();
    _database = await _provider.database;
    _databaseList = await _database.rawQuery('SELECT * FROM colors');
  }
}