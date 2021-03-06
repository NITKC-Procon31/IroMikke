import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 図鑑タイトル画面
// ---
// todo
// 素材を受け取り追加
// StatefulWidgetである必要性がなさそうなのでStatelessWidgetに変更を検討
// ---

class ZukanTitlePage extends StatelessWidget {

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
                image: AssetImage('assets/Images/irozukan/irozukan_background.png'),
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                _zukanTitle(context),
                GestureDetector(
                  onTapUp: (details){
                    Navigator.pushNamed(context, '/zukan/zukan');
                  },
                  behavior: HitTestBehavior.deferToChild,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.05, 0, MediaQuery.of(context).size.height * 0.05),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      boxShadow: const [
                        BoxShadow(color: Colors.black, blurRadius: 5,),
                      ],
                    ),
                    child: Text(
                      'ずかんをみる',
                      style: TextStyle(
                        color: Color.fromARGB(255, 42, 131, 163),
                        fontSize: 60.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'satsuki',
                        letterSpacing: -8.0,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTapUp: (details){
                    print('にゃーん');
                    //追記予定
                  },
                  behavior: HitTestBehavior.deferToChild,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.05, 0, MediaQuery.of(context).size.height * 0.05),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      boxShadow: const [
                        BoxShadow(color: Colors.black, blurRadius: 5,),
                      ],
                    ),
                    child: Text(
                      'あそびかた',
                      style: TextStyle(
                        color: Color.fromARGB(255, 25, 47, 96),
                        fontSize: 60.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'satsuki',
                        letterSpacing: -8.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _zukanTitle(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.05, 0, MediaQuery.of(context).size.height * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'い',
            style: TextStyle(
              fontSize: 70.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'satsuki',
              color: Color.fromARGB(255, 42, 131, 163),
            ),
          ),
          Text(
            'ろ',
            style: TextStyle(
              fontSize: 70.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'satsuki',
              color: Color.fromARGB(255, 25, 47, 96),
            ),
          ),
          Text(
            'ず',
            style: TextStyle(
              fontSize: 70.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'satsuki',
              color: Color.fromARGB(255, 42, 131, 163),
            ),
          ),
          Text(
            'か',
            style: TextStyle(
              fontSize: 70.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'satsuki',
              color: Color.fromARGB(255, 25, 47, 96),
            ),
          ),
          Text(
            'ん',
            style: TextStyle(
              fontSize: 70.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'satsuki',
              color: Color.fromARGB(255, 42, 131, 163),
            ),
          ),
        ],
      ),
    );
  }
}