import 'package:flutter/material.dart';

import 'package:camera/camera.dart';

import 'package:provider/provider.dart';
//other
import 'package:iromikke/pages/log_in_page.dart';
import 'package:iromikke/pages/title_page.dart';

//irozukan
import 'package:iromikke/pages/irozukan/zukan_title_page.dart';
import 'package:iromikke/pages/irozukan/zukan_play_page.dart';

//iroquiz
import 'package:iromikke/pages/iroquiz/quiz_title_page.dart';
import 'package:iromikke/pages/iroquiz/quiz_question_page.dart';
import 'package:iromikke/pages/iroquiz/quiz_answer_page.dart';
import 'package:iromikke/pages/iroquiz/quiz_score_page.dart';

import 'package:iromikke/model/color_model.dart';



//todo
//NavigatorクラスのNamed系メソッドのほうが便利そうなため使用できるように変更
//さつき源代明朝を使うのであれば SIL Open Font Licence に基づいたライセンス表示が必要
//

List<CameraDescription> cameras; //カメラのリストを作成

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  //ここまでカメラのリストを初期化、取得。
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ColorModel>(
          create: (context) => ColorModel(),
        )
      ],
      child: MaterialApp(
          title: "いろみっけ！",
          initialRoute: '/',
          routes: {
            '/': (context) => LogInPage(),
            '/title': (context) => TitlePage(),

            '/zukan/title': (context) => ZukanTitlePage(),
            '/zukan/zukan': (context) => ZukanPlayPage(),

            '/quiz/title': (context) => QuizTitlePage(),
            '/quiz/question': (context) => QuizQuestionPage(),
            '/quiz/answer': (context) => QuizAnswerPage(),
            '/quiz/score': (context) => QuizScorePage(),
          }
      )
    );
  }

}