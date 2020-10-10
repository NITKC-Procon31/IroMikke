import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:io';

import 'package:flutter/rendering.dart';
import 'package:image/image.dart' as img;
import 'package:flutter/services.dart' show rootBundle;
import 'package:iromikke/pages/irosagashi/irosagashi_timer_widget.dart';
import 'package:iromikke/pages/irosagashi/utils/irosagashi_data.dart';

class IrosagashiColorPickPage extends StatefulWidget {

  @override
  _IrosagashiColorPickPageState createState() => _IrosagashiColorPickPageState();

}

class _IrosagashiColorPickPageState extends State<IrosagashiColorPickPage> {
  IrosagashiData _irosagashiData;
  String _imagePath;
  GlobalKey paintKey = GlobalKey();
  bool _isPanDowned = false;
  // Snapshotで実装しています

  bool useSnapshot = true;

  final StreamController<Color> _stateController = StreamController<Color>();
  img.Image photo;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _irosagashiData = ModalRoute.of(context).settings.arguments;
    _imagePath = _irosagashiData.imagePath;
     //画像を渡される
    print(_imagePath);

    Image image = Image.file(File(_imagePath));
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 235, 126, 1),
          title: const Text(
            'いろさがし',
            style: TextStyle(
              fontFamily: 'satsuki',
              fontSize: 40.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Stack(
          children: [
            Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage('assets/Images/irosagashi/irosagashi_background.png')
                ),
              ),
            ),
            StreamBuilder(
                initialData: Colors.green[500],
                stream: _stateController.stream,
                builder: (BuildContext, snapshot) {
                  Color selectedColor = snapshot.data ?? Colors.green;
                  if (!snapshot.hasData) {
                    CircularProgressIndicator(); //取得するまでインジケーター
                  } else {
                    return Column(
                      children: <Widget>[
                        IrosagashiTimerWidget(_irosagashiData),
                        RepaintBoundary(
                          key: paintKey,
                          child: GestureDetector(
                            //タッチ座標部分　ドラッグに対応してます
                            behavior: HitTestBehavior.deferToChild,
                            onPanDown: (details) {
                              //初回タップ時のコール
                              _isPanDowned = true;
                              searchPixel(details.globalPosition);
                            },
                            onPanUpdate: (details) {
                              //位置変化時にコール
                              searchPixel(details.globalPosition);
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.75,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: image.image,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: const Color.fromARGB(255, 235, 126, 1),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                      MediaQuery.of(context).size.width * 0.15,
                                      MediaQuery.of(context).size.height * 0.01,
                                      MediaQuery.of(context).size.width * 0.15,
                                      MediaQuery.of(context).size.height * 0.01
                                  ),
                                  width: MediaQuery.of(context).size.height * 0.1,
                                  height: MediaQuery.of(context).size.height * 0.1,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.white, width: 2.0,),
                                    color: _isPanDowned ? selectedColor : Colors.white,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    _irosagashiData.setUserSelectedColor(selectedColor.red, selectedColor.green, selectedColor.blue);
                                    print(selectedColor.toString());
                                    if(_isPanDowned){
                                      Navigator.pushNamedAndRemoveUntil(context, '/irosagashi/answer', ModalRoute.withName('/irosagashi/title'), arguments: _irosagashiData);
                                    }
                                  },
                                  child: Container(
                                    //width: MediaQuery.of(context).size.width * 0.45,
                                    height: MediaQuery.of(context).size.height * 0.1,
                                    padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 2.0,
                                        ),
                                      ],
                                    ),
                                    child: Text(
                                      'けってい',
                                      style: TextStyle(
                                        fontFamily: 'satsuki',
                                        color: const Color.fromARGB(255, 83, 42, 35),
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: -4.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
//                    Container(
//                      // 色の選択確認部分
//                        margin: EdgeInsets.all(70),
//                        width: 50,
//                        height: 50,
//                        decoration: BoxDecoration(
//                            shape: BoxShape.circle,
//                            color: selectedColor,
//                            border: Border.all(width: 2.0, color: Colors.white),
//                            boxShadow: [
//                              BoxShadow(
//                                  blurRadius: 4, offset: Offset(0, 2)), //影
//                              // 重いようであれば削除
//                            ])),
//                    Positioned(
//                      child: Text('{$selectedColor}',
//                          style: TextStyle(
//                            color: Colors.white,
//                            backgroundColor: Colors.black54,
//                          )),
//                      left: 114,
//                      top: 95,
//                    ),
                      ],
                    );
                  }
                }),
          ],
        ),
    );
  }
  // globalPosition  = アプリ内の絶対座標
  // localPosition = Widget内の相対座標
  // 座標は基本的にdouble型で取得されています

  void searchPixel(Offset globalPosition) async {
    if (photo == null) {
      await loadSnapshotBytes();
    }
    _calculatePixel(globalPosition);
  }

  void _calculatePixel(Offset globalPosition) {
    // currentKeyを参考にwidgetのサイズ、位置(RenderBoxインスタンス)を取得
    RenderBox box = paintKey.currentContext.findRenderObject();
    Offset localPosition = box.globalToLocal(globalPosition); //座標を代入

    double pixelX = localPosition.dx;
    double pixelY = localPosition.dy;

    int pixel32 = photo.getPixelSafe(pixelX.toInt(), pixelY.toInt());
    // int型に変換

    int hex = toArgb(pixel32);
    _stateController.add(Color(hex));
  }

  Future<void> loadImageBundleBytes() async {
    ByteData imageBytes = await rootBundle.load(_imagePath);
    setImageBytes(imageBytes);
  }

  Future<void> loadSnapshotBytes() async {
    // Widgetを画像化
    RenderRepaintBoundary boxPaint = paintKey.currentContext.findRenderObject();
    ui.Image capture = await boxPaint.toImage();
    ByteData imageBytes =
    await capture.toByteData(format: ui.ImageByteFormat.png);
    // pngに圧縮してバイナリデータとして代入？
    setImageBytes(imageBytes);
    capture.dispose();
  }

  void setImageBytes(ByteData imageBytes) {
    List<int> values = imageBytes.buffer.asUint8List();
    photo = null;
    photo = img.decodeImage(values);
  }

  int toArgb(int argbColor) {
    int abgrR = (argbColor >> 16) & 0xFF;
    int abgrB = (argbColor & 0xFF);
    return (argbColor & 0xFF00FF00) | (abgrB << 16) | abgrR;
  } // imageライブラリがKML(#AABBGGRR)を使用しているので通常の#AARRGGBに変換

}