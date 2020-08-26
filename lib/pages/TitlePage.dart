import 'package:flutter/material.dart';

//タイトル画面
//---
// todo
//drawerの実装
//タップ時の動作の実装
//各ボタンにタイトルを追加
//その他いくつかの未実装および修正
//---
//Pixel3を前提としている状態であるため改善が必要

class TitlePage extends StatefulWidget{

  @override
  _TitlePageState createState() => _TitlePageState();
}

class _TitlePageState extends State<TitlePage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 173, 173),
      appBar: AppBar(
        title: Text('いろみっけ'),
      ),
      drawer: Drawer(),
      body: Center(
        child: Column(
          children: <Widget>[
            _showLogo(),
            Expanded(
              child: _showGameModeGrid(),
            ),
          ],
        ),
      ),
    );
  }

  //ロゴを表示
  Container _showLogo(){
    return Container(
      height: 185,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        //color: Colors.greenAccent,
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          image: AssetImage('assets/Images/iromikke_logo.png'),
        ),
      ),
    );
  }

  //各モードへのボタンを表示するGridView
  GridView _showGameModeGrid(){
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 20,
        crossAxisSpacing: 30,
        crossAxisCount: 2,
        childAspectRatio: 0.7,
      ),
      primary: false,
      padding: const EdgeInsets.all(32.0),
        physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        _gameModeGridRow('assets/Images/irooni.png', 'いろおに', 0),
        _gameModeGridRow('assets/Images/irosagashi.png', 'いろさがし', 1),
        _gameModeGridRow('assets/Images/iroquiz.png', 'いろクイズ', 2),
        _gameModeGridRow('assets/Images/zukan.png', 'ずかん', 3),
      ],
    );
  }

  //各ボタンのContainer
  //タップ時の動作を追加する予定
  Container _gameModeGridRow(String imagePath, String title, int number){
    return Container(
      //alignment: Alignment.center,
      width: 100,
      height: 150,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 3),
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          image: AssetImage(imagePath),
        ),
      ),
    );
  }
}