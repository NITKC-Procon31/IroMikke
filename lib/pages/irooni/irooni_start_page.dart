import 'package:flutter/material.dart';

class IrooniStartPage extends StatefulWidget {

  @override
  _IrooniStartPageState createState() => _IrooniStartPageState();

}

class _IrooniStartPageState extends State<IrooniStartPage> {

  @override
  Widget build(BuildContext context) {
    final flag = true;
    return Scaffold(
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
      body: FutureBuilder(
        future: fanc(),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text('エラー'),);
            }
            if (!snapshot.hasData) {
      ;        return Center(child: Text('ぬる'),);
            }
            //return _iroonPlayerModeWidget(context, true);
            return RaisedButton(
              child: Text('てすと'),
              onPressed: () => Navigator.pushNamed(context, '/irooni/oni/colorChoice'),
            );
          } else {
            return Center(
              child: const CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<int> fanc() async {
    return Future.delayed(Duration(seconds: 1)).then((_) => 1);
  }

  Widget _iroonPlayerModeWidget(BuildContext context, bool flag){
    return RaisedButton(
      child: Text('てすと'),
      onPressed: (){
        if(flag){
          Navigator.pushNamed(context, 'irooni/oni/colorChoice');
        } else {
          Navigator.pushNamed(context, 'irooni/nigeru/question');
        }
      },
    );
  }
}