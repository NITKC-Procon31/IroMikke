import 'package:flutter/material.dart';
import 'package:iromikke/model/color_model.dart';
import 'package:iromikke/pages/irosagashi/utils/irosagashi_data.dart';
import 'package:iromikke/pages/irosagashi/utils/irosagashi_provider.dart';
import 'package:provider/provider.dart';

class IrosagashiQuestionPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final ColorModel model = Provider.of<ColorModel>(context);
    final IrosagashiProvider irosagashiProvider = IrosagashiProvider();
    final IrosagashiData irosagashiData = irosagashiProvider.provide(model);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 235, 126, 1),
        title: const Text(
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
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              alignment: Alignment.center,
              child: Text(
                irosagashiData.kana,
                style: TextStyle(
                  fontFamily: 'satsuki',
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  color: Colors.black,
                  letterSpacing: -8,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              alignment: Alignment.center,
              child: Text(
                'をさがしてね！',
                style: TextStyle(
                  fontFamily: 'satsuki',
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.black,
                  letterSpacing: -4,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/irosagashi/camera', arguments: irosagashiData);
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
                  'みつけた！',
                  style: TextStyle(
                    fontFamily: 'satsuki',
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 215, 0, 59),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushNamedAndRemoveUntil(context, '/irosagashi/question', ModalRoute.withName('/irosagashi/title'));
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
                  'みつからない...',
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
      ),
    );
  }
}