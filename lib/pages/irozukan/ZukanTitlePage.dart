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
        backgroundColor: Colors.cyan,
        title: Text('いろずかん', style: TextStyle(color: Colors.white, fontFamily: 'haranyan', ),),
      ),
      body: Center(
        child: Column(
          children: [
            GestureDetector(
              behavior: HitTestBehavior.deferToChild,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ZukanPage()
                ),
              ),
              child: Container(
                height: 70,
                child: Image.asset('assets/Images/irozukan/zukan_button1.png', fit: BoxFit.fitHeight,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}