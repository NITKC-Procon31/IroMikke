import 'dart:async';
import 'dart:io';
//package
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:iromikke/pages/irooni/irooni_timer_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:iromikke/pages/irooni/utils/irooni_data.dart';
//files
import 'package:iromikke/main.dart';

class IrooniNigeruCameraPage extends StatefulWidget {

  @override
  _IrooniNigeruCameraPageState createState() => _IrooniNigeruCameraPageState();

}

class _IrooniNigeruCameraPageState extends State<IrooniNigeruCameraPage> with WidgetsBindingObserver {
  CameraController controller;
  String imagePath;
  Future<void> _initializedControllerF;  //なんでエラーなってるかわからないが動く
  IrooniData _irooniData;  //色探しと同じようにやってしまいたい

  void initState() {
    super.initState();
    controller = CameraController(
        cameras[0], //利用できるカメラリストから特定のカメラを選択。
        ResolutionPreset.medium //解像度
    );
    _initializedControllerF = controller.initialize(); //カメラコントローラを初期化
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    controller.dispose(); //ウィジェットが消えたときコントローラも消滅させる
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (controller == null || !controller.value.isInitialized) {
      return;
    }
    if (state == AppLifecycleState.inactive) {
      controller?.dispose();
    }
  } //アプリが復帰したときに動作するところ。

  //WidgetsBindingObserverとかはこれのためにある。
  //ここらでバグが起きている可能性あり。確認されたし。
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    _irooniData = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 107, 161),
        title: Text(
          'いろおに',
          style: TextStyle(
            fontFamily: 'satsuki',
            fontSize: 40.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          IrooniTimerWidget(_irooniData),
          Expanded(
            child: FutureBuilder<void>(
                future: _initializedControllerF,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return CameraPreview(controller);
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt),
        onPressed: () {
          onCameraButtonPressed(context);
        },
      ),
    );
  }

  void onCameraButtonPressed(BuildContext context) {
    takePicture().then((String filePath) {
      if (mounted) {
        setState(() {
          _irooniData.imagePath = filePath;
//          imagePath = filePath;
        });
        if (filePath != null) {
          Navigator.pushNamed(
            context,
            '/irooni/nigeru/colorPick',
            arguments: this._irooniData, //画像を渡す部分
//            arguments: imagePath,
          );
        }
      }
    });
  }

  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  Future<String> takePicture() async {
    final Directory extDir = await getTemporaryDirectory();
    final String dirPath = '${extDir.path}';
    final String fPath = '$dirPath/${timestamp()}.jpg';
    if (controller.value.isTakingPicture) {
      return null;
    }
    try {
      await controller.takePicture(fPath);
    } on CameraException catch (e) {
      print('$e');
      return null;
    }
    return fPath;
  }
}