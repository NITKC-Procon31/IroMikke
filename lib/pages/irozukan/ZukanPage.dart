import 'package:flutter/material.dart';

//図鑑画面
//---
//todo
//素材を受け取り追加
//図鑑のリストビューを実装
//データベースへのアクセスが必要になるのでその辺
//---

class ZukanPage extends StatefulWidget{

  @override
  _ZukanPageState createState() => _ZukanPageState();
}

class _ZukanPageState extends State<ZukanPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[100],
        title: Text('いろずかん', style: TextStyle(color: Colors.white, fontFamily: 'haranyan', ),),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: (){
            Navigator.maybePop(context);
          },
          child: Text('test'),
        ),
      ),
    );
  }
}