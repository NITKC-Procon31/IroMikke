import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iromikke/pages/irozukan/ZukanTitlePage.dart';

import '../main.dart';
import './irozukan/ZukanTitlePage.dart';

//タイトル画面
//---
// todo
//drawerの実装
//タップ時の動作の実装
//各ボタンにタイトルを追加 ← 8/30実装
//その他いくつかの未実装および修正
//---
//Pixel3を前提としている状態であるため改善が必要
//Material Theming というものでThemeを一括管理できるそうなので活用したい

class TitlePage extends StatefulWidget{

  @override
  _TitlePageState createState() => _TitlePageState();
}

enum _GameMode {irooni, irosagashi, iroquiz, zukan}

class _TitlePageState extends State<TitlePage>{



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 173, 173),
      appBar: AppBar(
        title: Text('いろみっけ！', style: TextStyle(fontFamily: 'Haranyan')),
        backgroundColor: Colors.black,
      ),
      drawer: Drawer(),
      body: Center(
        child: Column(
          children: <Widget>[
            _showLogo(),
            Expanded(
              child: _showGameModeGrid(context),
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
  GridView _showGameModeGrid(BuildContext context){
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
        _gameModeGridElement(context, 'assets/Images/irooni.png', 'いろおに', _GameMode.irooni, Color.fromARGB(255, 254, 129, 129)),
        _gameModeGridElement(context, 'assets/Images/irosagashi.png', 'いろさがし', _GameMode.irosagashi, Color.fromARGB(255, 167, 128, 255)),
        _gameModeGridElement(context, 'assets/Images/iroquiz.png', 'いろクイズ', _GameMode.iroquiz, Color.fromARGB(255, 148, 247, 255)),
        _gameModeGridElement(context, 'assets/Images/zukan.png', 'ずかん', _GameMode.zukan, Color.fromARGB(255, 180, 255, 128)),
      ],
    );
  }

  //各ボタンのContainer
  //Containerの子にGestureDetectorなのか逆なのか
  //タップ時の動作を追加する予定
  Widget _gameModeGridElement(BuildContext context, String imagePath, String title, var gameMode, Color fontColor){
    return GestureDetector(
      behavior: HitTestBehavior.deferToChild,
      onTap: () => _onGameModeButtonTapped(context, gameMode),
      child: Container(
        width: 100,
        height: 150,
        decoration: BoxDecoration(
          //border: Border.all(color: Colors.black, width: 3),
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          boxShadow: const[
            BoxShadow(color: Color.fromARGB(255, 132, 50, 50), blurRadius: 5,),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 10.0),
              child: Image.asset(imagePath),
            ),
            Text(title, style: TextStyle(fontFamily: 'Haranyan', fontSize: 25, color: fontColor),),
          ],
        ),
      ),
    );
  }

  //実際の動作はここに書く予定
  _onGameModeButtonTapped(BuildContext context, var gameMode){
    switch(gameMode){
      case _GameMode.irooni:
        //ここに追記
        break;
      case _GameMode.irosagashi:
        //ここに追記
        break;
      case _GameMode.iroquiz:
        //ここに追記
        break;
      case _GameMode.zukan:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context){
              return ZukanTitlePage();
            }
          ),
        );
        break;
      default:
        print('TitlPage.dart/_onGameModeButtonTapped() 無効な値');
    }
  }
}