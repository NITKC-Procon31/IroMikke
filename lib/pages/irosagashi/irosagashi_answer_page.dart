import 'package:flutter/material.dart';

import 'package:iromikke/pages/irosagashi/utils/irosagashi_data.dart';

import 'package:iromikke/model/color_model.dart';
import 'package:iromikke/model/user_color_model.dart';

import 'package:iromikke/entity/user_color.dart';

import 'package:provider/provider.dart';

class IrosagashiAnswerPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final IrosagashiData irosagashiData = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 235, 126, 1),
        title: Text(
          'いろさがし',
          style: TextStyle(
            fontFamily: 'satsuki',
            fontSize: 40.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: _answerWidget(irosagashiData, context),
            ),
            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, '/irosagashi/question', arguments: irosagashiData);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.height * 0.1,
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.all(5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(color: Colors.black, blurRadius: 5,),
                        ],
                      ),
                      child: Text(
                        'つづける',
                        style: TextStyle(
                          fontFamily: 'satsuki',
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 215, 0, 59),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamedAndRemoveUntil(context, '/title', (routes) => false);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.height * 0.1,
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.all(5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(color: Colors.black, blurRadius: 5,),
                        ],
                      ),
                      child: Text(
                        'やめる',
                        style: TextStyle(
                          fontFamily: 'satsuki',
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 22, 94, 132),
                          letterSpacing: -4,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _answerWidget(IrosagashiData irosagashiData, BuildContext context) {
    if (irosagashiData.isCorrected()) {
      final UserColorModel model = Provider.of<UserColorModel>(context, listen: false);
      UserColor color = model.getUserColorById(irosagashiData.traditionalColor.id);
      if (color != null) model.setFlag(color, true);

      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
            ),
            Text(
              'せいかい！',
              style: TextStyle(
                fontFamily: 'satsuki',
                fontWeight: FontWeight.bold,
                fontSize: 50.0,
                color: const Color.fromARGB(255, 215, 0, 59),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
            ),
            Text(
              'ずかんに',
              style: TextStyle(
                fontFamily: 'satsuki',
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
                color: Colors.black,
              ),
            ),
            Text(
              'とうろくしたよ',
              style: TextStyle(
                fontFamily: 'satsuki',
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
            ),
          ],
        ),
      );
    } else {
      final ColorModel model = Provider.of<ColorModel>(context);
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
            ),
            Text(
              'おしい！',
              style: TextStyle(
                fontFamily: 'satsuki',
                fontWeight: FontWeight.bold,
                fontSize: 50.0,
                color: const Color.fromARGB(255, 22, 94, 132),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
            ),
            Text(
              'それは',
              style: TextStyle(
                fontFamily: 'satsuki',
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
                color: Colors.black,
              ),
            ),
            Text(
              irosagashiData.getNearlyColor(model).kana,
              style: TextStyle(
                fontFamily: 'satsuki',
                fontWeight: FontWeight.bold,
                fontSize: 50.0,
                color: irosagashiData.getUserLetterColor(),
                backgroundColor: irosagashiData.userAnswer,
              ),
            ),
            Text(
              'ににているよ',
              style: TextStyle(
                fontFamily: 'satsuki',
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
                color: Colors.black,
              ),
            ),
          ],
        ),
      );
    }
  }
}