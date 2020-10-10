import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

import 'package:camera/camera.dart';

//other
import 'package:iromikke/pages/log_in_page.dart';
import 'package:iromikke/pages/title_page.dart';
import 'package:iromikke/pages/load_page.dart';

//irozukan
import 'package:iromikke/pages/irozukan/zukan_title_page.dart';
import 'package:iromikke/pages/irozukan/zukan_play_page.dart';

//iroquiz
import 'package:iromikke/pages/iroquiz/widgets/quiz_title_page.dart';
import 'package:iromikke/pages/iroquiz/widgets/quiz_question_page.dart';
import 'package:iromikke/pages/iroquiz/widgets/quiz_score_page.dart';

//irosagashi
import 'package:iromikke/pages/irosagashi/irosagashi_title_page.dart';
import 'package:iromikke/pages/irosagashi/irosagashi_camera_page.dart';
import 'package:iromikke/pages/irosagashi/irosagashi_color_pick_page.dart';
import 'package:iromikke/pages/irosagashi/irosagashi_question_page.dart';
import 'package:iromikke/pages/irosagashi/irosagashi_answer_page.dart';

//irooni
import 'package:iromikke/pages/irooni/irooni_title_page.dart';
import 'package:iromikke/pages/irooni/irooni_start_page.dart';
import 'package:iromikke/pages/irooni/irooni_nigeru_camera_page.dart';
import 'package:iromikke/pages/irooni/irooni_nigeru_color_pick_page.dart';
import 'package:iromikke/pages/irooni/irooni_nigeru_answer_page.dart';
import 'package:iromikke/pages/irooni/irooni_oni_color_choice_page.dart';
import 'package:iromikke/pages/irooni/irooni_question_page.dart';


//model
import 'package:iromikke/model/color_model.dart';
import 'package:iromikke/model/user_model.dart';
import 'package:iromikke/model/user_color_model.dart';

//todo
//NavigatorクラスのNamed系メソッドのほうが便利そうなため使用できるように変更
//さつき源代明朝を使うのであれば SIL Open Font Licence に基づいたライセンス表示が必要
//

List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(new MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ColorModel>(
          create: (context) => ColorModel()
        ),
        ChangeNotifierProvider<UserModel>(
          create: (context) => UserModel()
        ),
        ChangeNotifierProvider<UserColorModel>(
          create: (context) => UserColorModel()
        )
      ],
      child: MaterialApp(
        title: "いろみっけ！",
        initialRoute: '/',
        routes: {
          //other
          '/': (context) => LoadPage(),
          '/login': (context) => LogInPage(),
          '/title': (context) => TitlePage(),

          //irozukan
          '/zukan/title': (context) => ZukanTitlePage(),
          '/zukan/zukan': (context) => ZukanPlayPage(),

          //iroquiz
          '/quiz/title': (context) => QuizTitlePage(),
          '/quiz/question': (context) => QuizQuestionPage(),
          '/quiz/score': (context) => QuizScorePage(),

          //irosagashi
          '/irosagashi/title': (context) => IrosagashiTitlePage(),
          '/irosagashi/camera': (context) => IrosagashiCameraPage(),
          '/irosagashi/colorPick': (context) => IrosagashiColorPickPage(),
          '/irosagashi/question': (context) => IrosagashiQuestionPage(),
          '/irosagashi/answer':(context) => IrosagashiAnswerPage(),

          //irooni
          '/irooni/title': (context) => IrooniTitlePage(),
          '/irooni/start': (context) => IrooniStartPage(),
          '/irooni/nigeru/camera': (context) => IrooniNigeruCameraPage(),
          '/irooni/nigeru/colorPick': (context) => IrooniNigeruColorPickPage(),
          '/irooni/nigeru/answer': (context) => IrooniNigeruAnswerPage(),
          '/irooni/oni/colorChoice': (context) => IrooniOniColorChoicePage(),
          '/irooni/nigeru/question': (context) => IrooniNigeruQuestionPage(),
        },
        //その時が来たらfalseにするのかもしれない
        debugShowCheckedModeBanner: false,
      ),
    );
  }

}