import 'package:flutter/material.dart';

import 'package:iromikke/model/color_model.dart';
import 'package:iromikke/model/user_color_model.dart';
import 'package:iromikke/model/user_model.dart';
import 'package:provider/provider.dart';

class LoadPage extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('いろずかん', style: TextStyle(color: Colors.white, fontFamily: 'satsuki', fontWeight: FontWeight.bold, fontSize: 40.0),),
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black12,
          ),
          FutureBuilder(
            future: _getModels(context),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  print('えらー');
                  return Text('えらー');
                } else if (!snapshot.hasData) {
                  print('ぬる');
                  return Text('ぬる');
                }
                UserModel model = Provider.of<UserModel>(context, listen: false);
                return Center(
                  child: RaisedButton(
                    child: Text('てすと'),
                    onPressed: () => model.viewerId == 0 ?
                      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false) :
                      Navigator.pushNamedAndRemoveUntil(context, '/title', (route) => false),
                  ),
                );
              } else {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/Images/iromikke_logo_v2.png'),
                            )
                        ),
                      ),
                      const CircularProgressIndicator(),
                    ],
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
  
  Future<int> _getModels(BuildContext context) async {
    UserModel userModel = Provider.of<UserModel>(context, listen: false);
    ColorModel colorModel = Provider.of<ColorModel>(context, listen: false);
    UserColorModel userColorModel = Provider.of<UserColorModel>(context, listen: false);
    while(userModel.isNull || colorModel.isNull || userColorModel.isNull) {
      await Future.delayed(Duration(milliseconds: 1));
    }
    print(colorModel.length);
    return 1;
  }
}