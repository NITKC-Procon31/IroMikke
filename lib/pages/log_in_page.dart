import 'dart:async';

import 'package:flutter/material.dart';

import 'package:iromikke/model/user_model.dart';
import 'package:iromikke/network/api/api_client.dart';

import 'package:provider/provider.dart';

class LogInPage extends StatelessWidget {

  final _textFieldcontroller = TextEditingController();
  final int _inputMax = 10;
  bool _buttonAble = false;
  UserModel _model;

  final _controller = StreamController<String>();
  final _validator = StreamTransformer<String, String>.fromHandlers(
    handleData: (value, sink) {
      if (value.length > 10) {
        sink.addError('なまえは10もじまで！');
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
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder(
        future: _checkModel(context),
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
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/Images/iromikke_logo_v2.png'),
                      ),
                    ),
                  ),
                  StreamBuilder<String>(
                    stream: _controller.stream.transform(_validator),
                    builder: (context, snapshot) {
                      return TextField(


                        controller: _textFieldcontroller,
                        onChanged: (String data) {
                          _controller.sink.add(data);
                          // もっとスマートにできそう
                          _buttonAble = (0 < data.length) &&(data.length <= _inputMax );
                        },
                        decoration: InputDecoration(
                          errorText: snapshot.hasError ? snapshot.error : null,
                        ),
                      );
                    },
                  ),
                  GestureDetector(
                    onTap: (){
                      if(this._buttonAble){
                      _registerUser(_textFieldcontroller.text);
                      Navigator.pushNamedAndRemoveUntil(context, '/title', (route) => false);
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 5),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        color: Colors.white,
                      ),
                      child: Text(
                        'けってい',
                        style: TextStyle(
                          fontFamily: 'satsuki', fontWeight: FontWeight.bold, fontSize: 40.0, color: Colors.black,
                        ),
                      ),
                    ),
                  ),
//                  TextField(
//                    maxLength: inputMax,
//                    controller: _TextFieldcontroller,
//                    onChanged: (String data){
//                      _buttonAble = (0 < data.length) &&(data.length <= inputMax );
//                    },
//                  ),
                  // たぶんFutureBuilderなりを使ってデータベース操作に対応するはず
//                  RaisedButton(
//                    child: Text('けってい'),
//                    onPressed: (){
//                      if(this._buttonAble){
//                        _registerUser(_textFieldcontroller.text);
//                        Navigator.pushNamedAndRemoveUntil(context, '/title', (route) => false);
//                      }
//                    }
//                    onPressed: () {
//                      _registerUser(_textFieldcontroller.text);
//                      Navigator.pushNamedAndRemoveUntil(context, '/title', (route) => false);
//                    },
                 // ),
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

  Future<int> _checkModel(BuildContext context) async {
    this._model = Provider.of<UserModel>(context, listen: false);
    while (this._model.isNull) {
      await Future.delayed(Duration(milliseconds: 1));
    }

    return 1;
  }

  void _registerUser(String userName) {
    ApiClient client = ApiClient();
    try {
      client.registerUser(userName, this._model);
    } catch(ex) {
      print('よくわかんないえらー');
    }
  }
}