import 'package:flutter/material.dart';

import 'package:iromikke/pages/irozukan/ZukanPage.dart';

//図鑑タイトル画面
//---
//todo
//素材を受け取り追加
//---

class ZukanTitlePage extends StatefulWidget{

  @override
  _ZukanTitlePageState createState() => _ZukanTitlePageState();
}

class _ZukanTitlePageState extends State<ZukanTitlePage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 126, 137, 161),
        title: null//Text('いろずかん', style: TextStyle(color: Colors.white, fontFamily: 'satsuki', fontWeight: FontWeight.bold, fontSize: 40.0),),
      ),
      body: Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage('assets/Images/irozukan/irozukan_background.png'),
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                GestureDetector(
                  child: Stack(
                    children: [
                      Container(
                        height: 100.0,
                        width: 200.0,
                        color: Colors.white,
                      ),
                      Text('ずかんをみる', style: TextStyle(color: Color.fromARGB(255, 44, 129, 166), fontSize: 60.0, fontWeight: FontWeight.bold, fontFamily: 'satsuki',),),
                    ],
                  ),
                  onTapUp: (details){
                    Navigator.pushNamed(context, '/zukan/zukan');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}