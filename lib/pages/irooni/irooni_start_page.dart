import 'package:flutter/material.dart';

class IrooniStartPage extends StatefulWidget {

  @override
  _IrooniStartPageState createState() => _IrooniStartPageState();

}

class _IrooniStartPageState extends State<IrooniStartPage> {

  @override
  Widget build(BuildContext context) {
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
              return Center(child: Text('ぬる'),);
            }
            return Center(child: Text('せいこう'),);
          } else {
            return Center(child: Text('少し待ってね'),);
          }
        },
      ),
    );
  }

  Future<int> fanc() async {
    return Future.delayed(Duration(seconds: 1)).then((_) => 1);
  }

}