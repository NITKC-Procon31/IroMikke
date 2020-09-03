import 'package:flutter/material.dart';
import 'package:iromikke/utils/DBProvider.dart';
import 'package:sqflite/sqflite.dart';

import '../../utils/DBProvider.dart';

import '../../main.dart';
import '../TitlePage.dart';

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

  DBProvider _provider;
  Database _database;

//  @override
//  void initState(){
//    super.initState();
//    _provider = DBProvider();
//    _database = _provider.init();
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('いろずかん', style: TextStyle(color: Colors.white, fontFamily: 'haranyan', ),),
      ),

      body: _colorZukanList(),
    );
  }

  ListView _colorZukanList(){
    return ListView(
      children: [
        _colorZukanRow(Colors.cyan, 'しあん'),
        _colorZukanRow(Colors.blue, 'あお'),
      ],
    );
  }

  Widget _colorZukanRow(Color color, String name){
    return Card(
      elevation: 0,
      color: Color.fromARGB(50, 0, 150, 255),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        leading: Container(
          width: 50.0,
          height: 50.0,
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: Colors.white, width: 4.0,),
          ),
        ),
        title: Text(name, style: TextStyle(fontSize: 40.0, fontFamily: 'Haranyan'),),
      ),
    );
  }
}