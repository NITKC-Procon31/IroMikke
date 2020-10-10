import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iromikke/model/user_color_model.dart';
import 'package:iromikke/model/user_model.dart';

import 'package:provider/provider.dart';

import 'package:iromikke/model/color_model.dart';

import 'package:iromikke/entity/traditional_color.dart';

// 図鑑画面
// ---
// todo
// 素材を受け取り追加
// 図鑑のリストビューを実装
// データベースへのアクセスが必要になるのでその辺
// 図鑑のデータ量が膨大なため、NestedScrollView等を用いて複数ページにすることを検討
// StatelessWidgetへの変更を検討
// ---

class ZukanPlayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorModel cmodel = Provider.of(context);
    UserModel umodel = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 126, 137, 161),
        title: Text(
          'いろずかん',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'satsuki',
              fontWeight: FontWeight.bold,
              fontSize: 40.0),
        ),
      ),
      body: Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage(
                    'assets/Images/irozukan/irozukan_background_2.png'),
              ),
            ),
          ),
          /*
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
          */
          _iroZukanList(context)
        ],
      ),
    );
  }

  Widget _iroZukanList(BuildContext context) {
    final ColorModel colorModel =
        Provider.of<ColorModel>(context, listen: true);
    final UserColorModel userColorModel =
        Provider.of<UserColorModel>(context, listen: true);
    print(colorModel.length);
    return Scrollbar(
        child: ListView.separated(
      itemCount: colorModel.length,
      itemBuilder: (context, index) {
        final TraditionalColor tColor = colorModel.getById(index + 1);
        Color color =
            Color.fromARGB(255, tColor.rgb.r, tColor.rgb.g, tColor.rgb.b);
        return _iroZukanRow(context, color,
            userColorModel.isFound(index + 1) ? tColor.kana : '？？？', tColor.id);
      },
      separatorBuilder: (context, index) {
        return Container(
          height: 7.0,
          color: Colors.white,
        );
      },
    ));
  }

  Widget _iroZukanRow(BuildContext context, Color color, String name, int id) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: ( _ ){
            return AlertDialog(
              title: Text("この色に変える？"),
              actions: <Widget>[
//                FlatButton(child: Text("うん！"),
//                onPressed: (){
//                    UserModel model = Provider.of(context);
//                    model.uiColor = id;
//                  },
//                ),
                //FlatButton(child: Text("いやだ"),
                //onPressed: 
              //),
              ]
              );
          }
          );

      },
      child: Card(
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
              border: Border.all(
                color: Colors.white,
                width: 4.0,
              ),
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
      ),
    );
  }
}
