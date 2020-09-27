import 'package:flutter/material.dart';

import 'dart:async';

import 'package:iromikke/model/user_model.dart';
import 'package:iromikke/network/api/api_client.dart';
import 'package:provider/provider.dart';

class LogInPage extends StatelessWidget {

  final _textFieldcontroller = TextEditingController();
  final int inputMax = 8;
  bool _buttonAble = false;
  UserModel _model;

  final _controller = StreamController<String>();
  final _validator = StreamTransformer<String, String>.fromHandlers(
    handleData: (value, sink) {
      if (value.length > 8) {
        sink.addError('なまえは8もじまで！');
      } else {
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
      body: FutureBuilder(
        future: _fanc(),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              print('えらー');
              return Text('えらー');
            }
            if (!snapshot.hasData) {
              return Text('ぬる');
            }
            return Center(
              child: Column(
                children: [
                  StreamBuilder<String>(
                    stream: _controller.stream.transform(_validator),
                    builder: (context, snapshot) {
                      return TextField(
                        controller: _textFieldcontroller,
                        onChanged: (String data) {
                          _controller.sink.add(data);
                          // もっとスマートにできそう
                          _buttonAble = (0 < data.length) &&(data.length <= inputMax );
                        },
                        decoration: InputDecoration(
                          errorText: snapshot.hasError ? snapshot.error : null,
                        ),
                      );
                    },
                  ),
//                  TextField(
//                    maxLength: inputMax,
//                    controller: _TextFieldcontroller,
//                    onChanged: (String data){
//                      _buttonAble = (0 < data.length) &&(data.length <= inputMax );
//                    },
//                  ),
                  // たぶんFutureBuilderなりを使ってデータベース操作に対応するはず
                  RaisedButton(
                    child: Text('けってい'),
//                    onPressed: () => _buttonAble ? (){
//                      print(_textFieldcontroller.text);
//                      _registerUser(_textFieldcontroller.text);
//                      Navigator.pushNamedAndRemoveUntil(context, '/title', (route) => false);
//                    } : print('ぬるぽ'),
                    onPressed: () {
                      print(_textFieldcontroller.text);
                      _registerUser('てきとう');
                      Navigator.pushNamedAndRemoveUntil(context, '/title', (route) => false);
                    },
                  ),
                ],
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Future<void> _fanc() async {
    _model = UserModel();
    while (!_model.flag) {
      await Future.delayed(Duration(milliseconds: 1));
    }
    return 1;
  }

  void _registerUser(String userName) {
    ApiClient client = ApiClient();
    try {
      client.registerUser(userName, _model);
    } catch(ex) {
      print('よくわかんないえらー');
    }
  }
}