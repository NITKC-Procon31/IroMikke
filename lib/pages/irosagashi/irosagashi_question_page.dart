import 'package:flutter/material.dart';

class IrosagashiQuestionPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          RaisedButton(
            child: Text('camera test'),
            onPressed: (){
              Navigator.pushNamed(context, '/irosagashi/camera');
            },
          ),
        ],
      ),
    );
  }
}