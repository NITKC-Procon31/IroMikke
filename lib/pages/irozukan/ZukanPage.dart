import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/src/exception.dart';

import 'package:iromikke/utils/DBProvider.dart';

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

  @override
  Future<void> initState() async{
    super.initState();
    _provider = DBProvider();
    _database = await _provider.database;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('いろずかん', style: TextStyle(color: Colors.white, fontFamily: 'haranyan', ),),
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
          _iroZukanList(),
        ],
      ),
    );
  }

  ListView _iroZukanList(){
    return ListView(
      children: [
        _iroZukanRow(Colors.cyan, 'シアン'),
        _iroZukanRow(Colors.white, 'しろ'),
      ],
    );
  }

  Widget _iroZukanRow(Color color, String name){
    return Card(
      elevation: 0,
      color: Color.fromARGB(50, 0, 150, 255),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
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