import 'package:flutter/material.dart';

class IrooniTitlePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 107, 161),
        title: Text(
          'いろおに',
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
                image: AssetImage('assets/Images/irooni/irooni_background.png'),
              ),
            ),
          ),
          Column(
            children: [
              _irooniTitle(context),
              GestureDetector(
                onTapUp: (details){
                  print('nya-nn');
                  Navigator.pushNamed(context, '/irooni/start');
                  //Navigator.pushNamed(context, '/irooni/nigeru/camera');
                  //Navigator.pushNamed(context, '/irooni/oni/colorChoice');
                },
                behavior: HitTestBehavior.deferToChild,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.05, 0, MediaQuery.of(context).size.height * 0.05),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
//                    border: Border.all(
//                      color: const Color.fromARGB(255, 83, 42, 35),
//                      width: 4.0,
//                    ),
                    boxShadow: const [
                      BoxShadow(color: Colors.black, blurRadius: 5,),
                    ],
                  ),
                  child: Text(
                    'あそぶ',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 235, 86, 6),
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
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.05, 0, MediaQuery.of(context).size.height * 0.05),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
//                    border: Border.all(
//                      color: const Color.fromARGB(255, 83, 42, 35),
//                      width: 4.0,
//                    ),
                    boxShadow: const [
                      BoxShadow(color: Colors.black, blurRadius: 5,),
                    ],
                  ),
                  child: Text(
                    'あそびかた',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 247, 81, 0),
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

  Widget _irooniTitle(BuildContext context){
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
                'お',
                style: TextStyle(
                  fontSize: 70.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'satsuki',
                  color: Colors.white,
                ),
              ),
              Text(
                'に',
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
                  color: const Color.fromARGB(255, 255, 38, 0),
                ),
              ),
              Text(
                'ろ',
                style: TextStyle(
                  fontSize: 70.0,
                  fontFamily: 'satsuki',
                  color: const Color.fromARGB(255, 255, 80, 37),
                ),
              ),
              Text(
                'お',
                style: TextStyle(
                  fontSize: 70.0,
                  fontFamily: 'satsuki',
                  color: const Color.fromARGB(255, 242, 40, 40),
                ),
              ),
              Text(
                'に',
                style: TextStyle(
                  fontSize: 70.0,
                  fontFamily: 'satsuki',
                  color: const Color.fromARGB(255, 253, 101, 131),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}