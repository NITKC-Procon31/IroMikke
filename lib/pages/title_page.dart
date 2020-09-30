import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:iromikke/model/user_model.dart';

import 'package:provider/provider.dart';

// タイトル画面
// ---
// todo
// drawerの実装
// タップ時の動作の実装
// 各ボタンにタイトルを追加 ← 8/30実装
// その他いくつかの未実装および修正
// StatefulWidgetにした理由がわからないのでStatelessWidgetへの変更を検討
// ---
// Pixel3を前提としている状態であるため改善が必要
// Material Theming というものでThemeを一括管理できるそうなので活用したい

enum _GameMode {
  irooni,
  irosagashi,
  iroquiz,
  zukan
}

class TitlePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    _initUser(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 173, 173),
      appBar: AppBar(
        title: Text(
          'いろみっけ！',
          style: TextStyle(
            fontFamily: 'satsuki',
            color: Colors.white,
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      drawer: Drawer(),
      body: Center(
        child: Column(
          children: <Widget>[
            _showLogo(context),
            Expanded(
              child: _showGameModeGrid(context),
            ),
          ],
        ),
      ),
    );
  }

  // ロゴを表示
  Container _showLogo(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: const BoxDecoration(
        //color: Colors.greenAccent,
        image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage('assets/Images/iromikke_logo_v2.png'),
        ),
      ),
    );
  }

  // 各モードへのボタンを表示するGridView
  // いいやり方を思いつかなければListViewに変更するかも
  Widget _showGameModeGrid(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        crossAxisCount: 2,
        childAspectRatio: 0.9,
      ),
      primary: false,
      padding: const EdgeInsets.all(10.0),
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        _gameModeGridElement(context, 'assets/Images/irooni.png', 'いろおに', _GameMode.irooni, Color.fromARGB(255, 254, 129, 129)),
        _gameModeGridElement(context, 'assets/Images/irosagashi.png', 'いろさがし', _GameMode.irosagashi, Color.fromARGB(255, 167, 128, 255)),
        _gameModeGridElement(context, 'assets/Images/iroquiz.png', 'いろクイズ', _GameMode.iroquiz, Color.fromARGB(255, 148, 247, 255)),
        _gameModeGridElement(context, 'assets/Images/zukan.png', 'ずかん', _GameMode.zukan, Color.fromARGB(255, 180, 255, 128)),
      ],
    );
  }

  // 各ボタンのContainer
  // Containerの子にGestureDetectorなのか逆なのか
  // タップ時の動作を追加する予定
  Widget _gameModeGridElement(BuildContext context, String imagePath, String title, var gameMode, Color fontColor) {
    return GestureDetector(
      behavior: HitTestBehavior.deferToChild,
      onTap: () => _onGameModeButtonTapped(context, gameMode),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        height: MediaQuery.of(context).size.height * 0.3,
//        width: MediaQuery.of(context).size.width * 0.9,
//        height: MediaQuery.of(context).size.height * 0.5,
//        margin: EdgeInsets.fromLTRB(
//          MediaQuery.of(context).size.width * 0.05,
//          MediaQuery.of(context).size.height * 0.02,
//          MediaQuery.of(context).size.width * 0.1,
//          MediaQuery.of(context).size.height * 0.02
//        ),
        decoration: BoxDecoration(
          //border: Border.all(color: Colors.black, width: 3),
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          boxShadow: const[
            BoxShadow(color: Color.fromARGB(255, 132, 50, 50), blurRadius: 5),
          ],
//          image: DecorationImage(
//            image: AssetImage(imagePath),
//            fit: BoxFit.fitWidth,
//          ),
        ),
        //child: Text(title, style: TextStyle(fontFamily: 'satsuki', fontSize: 35, color: fontColor, fontWeight: FontWeight.bold, letterSpacing: -4),),
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: Image.asset(imagePath),
            ),
            Expanded(
              flex: 2,
              child: Text(title, style: TextStyle(fontFamily: 'satsuki', fontSize: 34, color: fontColor, fontWeight: FontWeight.bold, letterSpacing: -4),),
            ),
          ],
        ),
      ),
    );
  }

  //実際の動作はここに書く予定
  _onGameModeButtonTapped(BuildContext context, var gameMode) {
    switch(gameMode){
      case _GameMode.irooni:
        //ここに追記
        Navigator.pushNamed(
          context,
          '/irooni/title',
        );
        break;
      case _GameMode.irosagashi:
        //ここに追記
        Navigator.pushNamed(
          context,
          '/irosagashi/title'
        );
        break;
      case _GameMode.iroquiz:
        //ここに追記
        Navigator.pushNamed(
          context,
          '/quiz/title',
        );
        break;
      case _GameMode.zukan:
        Navigator.pushNamed(
          context,
          '/zukan/title',
        );
        break;
      default:
        print('title_page.dart/_onGameModeButtonTapped() 無効な値');
    }
  }

  void _initUser(BuildContext context){
    Provider.of<UserModel>(context); // 気持ち悪いけど、Userのフィールドがnullになる対策...
  }

}