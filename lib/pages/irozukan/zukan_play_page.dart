import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import 'package:iromikke/service/color_database.dart';

//図鑑画面
//---
//todo
//素材を受け取り追加
//図鑑のリストビューを実装
//データベースへのアクセスが必要になるのでその辺
//図鑑のデータ量が膨大なため、NestedScrollView等を用いて複数ページにすることを検討
//StatelessWidgetへの変更を検討
//---

class ZukanPlayPage extends StatelessWidget{

  ColorDatabase _provider;
  Database _database;
  List<Map<String, dynamic>> _zukan;

  Future<int> _initZukan() async{
    _provider = ColorDatabase();
    _database = await _provider.database;
    _zukan = await _database.rawQuery('SELECT * FROM colors');
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 126, 137, 161),
        title: Text('いろずかん', style: TextStyle(color: Colors.white, fontFamily: 'satsuki', fontWeight: FontWeight.bold, fontSize: 40.0),),
      ),
      body: Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage('assets/Images/irozukan/irozukan_background_2.png'),
              ),
            ),
          ),
          FutureBuilder(
            future: _initZukan(),
            builder: (context, snapshot){
              if(snapshot.connectionState == ConnectionState.done){
                if(snapshot.hasError){
                  return Center(
                    child: Text('エラーがはっせいしました', style: TextStyle(fontSize: 45.0, color: Colors.black, fontFamily: 'Haranyan'),),
                  );
                }
                if(!snapshot.hasData){
                  return Center(
                    child: Text('データをしゅとくできませんでした', style: TextStyle(fontSize: 45.0, color: Colors.black, fontFamily: 'Haranyan'),),
                  );
                }
                return _iroZukanList(context);
              }
              else{
                return const CircularProgressIndicator();
              }
            },
          ),
          //_iroZukanList(context),
        ],
      ),
    );
  }

  Widget _iroZukanList(BuildContext context){
    return Scrollbar(
        child: ListView.separated(
          itemCount: _zukan.length,
          itemBuilder: (context, index){
            Color color = Color.fromARGB(255, _zukan[index]['red'], _zukan[index]['green'], _zukan[index]['blue']);
            return _iroZukanRow(context, color, _zukan[index]['kana']);
          },
          separatorBuilder: (context, index){
            return Container(
              height: 7.0,
              color: Colors.white,
            );
          },
        )
    );
  }

  Widget _iroZukanRow(BuildContext context, Color color, String name){
    return Card(
      elevation: 0,
      color: Color.fromARGB(100, 255, 255, 255),
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
        title: Text(
          name,
          style: TextStyle(
            fontSize: 38.0,
            fontFamily: 'satsuki',
            fontWeight: FontWeight.bold,
            letterSpacing: -8.0,
          ),
        ),
      ),
    );
  }
}