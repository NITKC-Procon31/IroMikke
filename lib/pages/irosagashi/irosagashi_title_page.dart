import 'package:flutter/material.dart';

class IrosagashiTitlePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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
      body: Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage('assets/Images/irosagashi/irosagashi_background.png'),
              ),
            ),
          ),
          Column(
            children: [
              _quizTitle(context),
              GestureDetector(
                onTapUp: (details){
                  print('nya-nn');
                  Navigator.pushNamed(context, '/irosagashi/question');
                },
                behavior: HitTestBehavior.deferToChild,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.05, 0, MediaQuery.of(context).size.height * 0.05),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
//                    border: Border.all(
//                      color: Color.fromARGB(255, 83, 42, 35),
//                      width: 4.0,
//                    ),
                    boxShadow: const [
                      BoxShadow(color: Colors.black, blurRadius: 5,),
                    ],
                  ),
                  child: Text(
                    'あそぶ',
                    style: TextStyle(
                      color: Color.fromARGB(255, 235, 86, 6),
                      fontSize: 60.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'satsuki',
                      letterSpacing: -8.0,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTapUp: (details){
                  print('にゃーん');
                  //追記予定
                },
                behavior: HitTestBehavior.deferToChild,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: EdgeInsets.all(5),
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.05, 0, MediaQuery.of(context).size.height * 0.05),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
//                    border: Border.all(
//                      color: Color.fromARGB(255, 83, 42, 35),
//                      width: 4.0,
//                    ),
                    boxShadow: const [
                      BoxShadow(color: Colors.black, blurRadius: 5,),
                    ],
                  ),
                  child: Text(
                    'あそびかた',
                    style: TextStyle(
                      color: Color.fromARGB(255, 247, 81, 0),
                      fontSize: 60.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'satsuki',
                      letterSpacing: -8.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _quizTitle(BuildContext context){
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.05, 0, MediaQuery.of(context).size.height * 0.05),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'い',
                style: TextStyle(
                  fontSize: 70.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'satsuki',
                  color: Colors.white,
                ),
              ),
              Text(
                'ろ',
                style: TextStyle(
                  fontSize: 70.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'satsuki',
                  color: Colors.white,
                ),
              ),
              Text(
                'さ',
                style: TextStyle(
                  fontSize: 70.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'satsuki',
                  color: Colors.white,
                ),
              ),
              Text(
                'が',
                style: TextStyle(
                  fontSize: 70.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'satsuki',
                  color: Colors.white,
                ),
              ),
              Text(
                'し',
                style: TextStyle(
                  fontSize: 70.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'satsuki',
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'い',
                style: TextStyle(
                  fontSize: 70.0,
                  fontFamily: 'satsuki',
                  color: Color.fromARGB(255, 235, 86, 6),
                ),
              ),
              Text(
                'ろ',
                style: TextStyle(
                  fontSize: 70.0,
                  fontFamily: 'satsuki',
                  color: Color.fromARGB(255, 247, 181, 0),
                ),
              ),
              Text(
                'さ',
                style: TextStyle(
                  fontSize: 70.0,
                  fontFamily: 'satsuki',
                  color: Color.fromARGB(255, 239, 120, 0),
                ),
              ),
              Text(
                'が',
                style: TextStyle(
                  fontSize: 70.0,
                  fontFamily: 'satsuki',
                  color: Color.fromARGB(255, 247, 181, 0),
                ),
              ),
              Text(
                'し',
                style: TextStyle(
                  fontSize: 70.0,
                  fontFamily: 'satsuki',
                  color: Color.fromARGB(255, 235, 86, 6),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}