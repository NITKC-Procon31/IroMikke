import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:io';

import 'package:flutter/rendering.dart';
import 'package:image/image.dart' as img;
import 'package:flutter/services.dart' show rootBundle;

class PickerWidget extends StatefulWidget {
  @override
  _PickerWidgetState createState() => _PickerWidgetState();
}

class _PickerWidgetState extends State<PickerWidget> {
  String imagePath;
  GlobalKey paintKey = GlobalKey();
//Snapshotで実装しています

  bool useSnapshot = true;

  final StreamController<Color> _stateController = StreamController<Color>();
  img.Image photo;

  @override
  void initState() {
    super.initState();
  }

  String _text;
  @override
  Widget build(BuildContext context) {
    imagePath = ModalRoute.of(context).settings.arguments; //画像を渡される
    print(imagePath);

    Image image = Image.file(File(imagePath));
    return Scaffold(
        appBar: AppBar(title: Text("Color picker")),
        body: StreamBuilder(
            initialData: Colors.green[500],
            stream: _stateController.stream,
            builder: (BuildContext, snapshot) {
              Color selectedColor = snapshot.data ?? Colors.green;
              if (!snapshot.hasData) {
                CircularProgressIndicator(); //取得するまでインジケーター
              } else {
                return Stack(
                  children: <Widget>[
                    RepaintBoundary(
                      key: paintKey,
                      child: GestureDetector(
                        //タッチ座標部分　ドラッグに対応してます
                        behavior: HitTestBehavior.deferToChild,
                        onPanDown: (details) {
                          //初回タップ時のコール
                          searchPixel(details.globalPosition);
                        },
                        onPanUpdate: (details) {
                          //位置変化時にコール
                          searchPixel(details.globalPosition);
                        },
                        child: Center(child: image),
                      ),
                    ),
                    Container(
                        //色の選択確認部分
                        margin: EdgeInsets.all(70),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: selectedColor,
                            border: Border.all(width: 2.0, color: Colors.white),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 4, offset: Offset(0, 2)), //影
                              //重いようであれば削除
                            ])),
                    Positioned(
                      child: Text('$selectedColor}',
                          style: TextStyle(
                            color: Colors.white,
                            backgroundColor: Colors.black54,
                          )),
                      left: 114,
                      top: 95,
                    ),
                  ],
                );
              }
            }));
  }
  //globalPosition  = アプリ内の絶対座標
  //localPosition = Widget内の相対座標
  //座標は基本的にdouble型で取得されています

  void searchPixel(Offset globalPosition) async {
    if (photo == null) {
      await loadSnapshotBytes();
    }
    _calculatePixel(globalPosition);
  }

  void _calculatePixel(Offset globalPosition) {
    //curretnKeyを参考にwidgetのサイズ、位置(RenderBoxインスタンス)を取得
    RenderBox box = paintKey.currentContext.findRenderObject();
    Offset localPosition = box.globalToLocal(globalPosition); //座標を代入

    double pixelX = localPosition.dx;
    double pixelY = localPosition.dy;

    int pixel32 = photo.getPixelSafe(pixelX.toInt(), pixelY.toInt());
    //int型に変換

    int hex = toArgb(pixel32);
    _stateController.add(Color(hex));
  }

  Future<void> loadImageBundleBytes() async {
    ByteData imageBytes = await rootBundle.load(imagePath);
    setImageBytes(imageBytes);
  }

  Future<void> loadSnapshotBytes() async {
    //Widgetを画像化
    RenderRepaintBoundary boxPaint = paintKey.currentContext.findRenderObject();
    ui.Image capture = await boxPaint.toImage();
    ByteData imageBytes =
        await capture.toByteData(format: ui.ImageByteFormat.png);
    //pngに圧縮してバイナリデータとして代入？
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
  } //imageライブラリがKML(#AABBGGRR)を使用しているので通常の#AARRGGBに変換

}
