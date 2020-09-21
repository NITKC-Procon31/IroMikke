import 'dart:async';
import 'dart:io';
//package
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
//files
import 'package:iromikke/main.dart';

//やること
//プレビューのレイアウトが簡素なので改良する
//

//Future<void> main() async{
//WidgetsFlutterBinding.ensureInitialized();
//cameras = await availableCameras();
//runApp(
//  MaterialApp(
//theme: ThemeData.dark(),
//home: CameraPage(
//),
//)
//);
//}

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() {
    return _CameraPageState();
  }
}

class _CameraPageState extends State<CameraPage> with WidgetsBindingObserver {
  CameraController controller;
  String imagePath;
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
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: const Text('CameraPage')),
      body: FutureBuilder<void>(
          future: _initializedControllerF,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return CameraPreview(controller);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
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
          imagePath = filePath;
        });
        if (filePath != null) {
          Navigator.pushNamed(
            context,
            '/colorpick',
            arguments: imagePath, //画像を渡す部分
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
