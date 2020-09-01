import 'package:flutter/material.dart';
import 'package:iromikke/pages/irozukan/ZukanTitlePage.dart';
import 'package:iromikke/utils/DBProvider.dart';
import 'package:iromikke/utils/DColor.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'dart:async';

import './pages/TitlePage.dart';
import './pages/irozukan/ZukanTitlePage.dart';

//todo
//NavigatorクラスのNamed系メソッドのほうが便利そうなため使用できるように変更
//

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "いろみっけ！",
//      theme: ThemeData(
//        primarySwatch: ,
//      ),
      home: TitlePage(),
    );
  }
}

//class MyApp extends StatelessWidget {
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
//    );
//  }
//}
//
//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  final String title;
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  int _counter = 0;
//
//  void _incrementCounter() {
//    setState(() {
//      _counter++;
//    });
//  }
//
//  Future<void> performance() async{
//    Stopwatch s = Stopwatch();
//    Color testCol = Color(100, 100, 100);
//    s.start();
//    DBProvider provider = DBProvider();
//    Database db = await provider.database;
//    List<Map<String, dynamic>> a =  await db.rawQuery('SELECT * from colors');
//
//    a.forEach((Map<String, dynamic> mp){
//      Color col = Color(mp['red'], mp['green'], mp['blue']);
//      print('${mp['id']} : ${testCol - col}');
//    });
//
//    s.stop();
//    print('${s.elapsed}');
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    performance();
//
//    return Scaffold(
//        appBar: AppBar(
//          title: Text(widget.title),
//        ),
//        body: Center(
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              Text(
//                'You have pushed the button this many times:',
//              ),
//              Text(
//                '$_counter',
//                style: Theme.of(context).textTheme.display1,
//              ),
//            ],
//          ),
//        ),
//        floatingActionButton: FloatingActionButton(
//          onPressed: _incrementCounter,
//          tooltip: 'Increment',
//          child: Icon(Icons.add),
//        )
//    );
//  }
//}
