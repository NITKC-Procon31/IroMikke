import 'package:flutter/material.dart';
import 'dart:async';

class LogInPage extends StatelessWidget{

  bool _buttonAble = false;
  final _controller = StreamController<String>();
  final _validata = StreamTransformer<String, String>.fromHandlers(
    handleData: (value, sink){
      if(value.length > 8){
        sink.addError('なまえは8もじまで！');
      }
      else{
        sink.add(null);
      }
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'いろみっけ！',
          style: TextStyle(
            fontFamily: 'satsuki',
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            StreamBuilder<String>(
              stream: _controller.stream.transform(_validata),
              builder: (context, snapshot){
                return TextField(
                  onChanged: (String data){
                    _controller.sink.add(data);
                    //もっとスマートにできそう
                    _buttonAble = (0 < data.length) &&(data.length < 9);
                  },
                  decoration: InputDecoration(
                    errorText: snapshot.hasError ? snapshot.error : null,
                  ),
                );
              },
            ),

            //たぶんFutureBuilderなりを使ってデータベース操作に対応するはず
            RaisedButton(
              child: Text('けってい'),
              onPressed: () => _buttonAble ? Navigator.pushNamed(
                  context,
                  '/title',
              ) : null,
            ),
          ],
        ),
      ),
    );
  }
}