import 'dart:async';
import 'dart:io';
//package
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:iromikke/pages/irosagashi/irosagashi_timer_widget.dart';
import 'package:iromikke/pages/irosagashi/utils/irosagashi_data.dart';
import 'package:path_provider/path_provider.dart';
//files
import 'package:iromikke/main.dart';

class IrosagashiCameraPage extends StatefulWidget {

  @override
  _IrosagashiCameraPageState createState() => _IrosagashiCameraPageState();

}

class _IrosagashiCameraPageState extends State<IrosagashiCameraPage> with WidgetsBindingObserver {
  IrosagashiData _irosagashiData;
  CameraController controller;
  String _imagePath;
  Future<void> _initializedControllerF; //なんでエラーなってるかわからないが動く

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
    _irosagashiData = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      key: _scaffoldKey,
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
          Column(
            children: [
              IrosagashiTimerWidget(_irosagashiData),
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
          )
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
          _irosagashiData.imagePath = filePath;
        });
        if (filePath != null) {
          Navigator.pushNamed(
            context,
            '/irosagashi/colorPick',
            arguments: _irosagashiData, //画像を渡す部分
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