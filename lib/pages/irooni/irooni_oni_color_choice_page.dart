import 'dart:math' as Math;

import 'package:flutter/material.dart';
import 'package:iromikke/entity/traditional_color.dart';
import 'package:iromikke/model/color_model.dart';
import 'package:provider/provider.dart';

class IrooniOniColorChoicePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final Math.Random random = Math.Random();
    final ColorModel model = Provider.of<ColorModel>(context, listen: true);
    print(model.length);
    List<TraditionalColor> list = List();
    for(int i=0; i<4; i++){
      list.add(model.getById(random.nextInt(model.length) + 1));
    }
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
      body: Center(
        child: Column(
          children: [
            Text(
              'いろをえらんでね',
              style: TextStyle(
                fontFamily: 'satsuki',
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 255, 98, 42),
                fontSize: 40.0,
              ),
            ),
            _ColorChoiceWidget(list),
          ],
        ),
      ),
    );
  }
}

class _ColorChoiceWidget extends StatefulWidget{
  List<TraditionalColor> _list;
  _ColorChoiceWidget(this._list);
  @override
  _ColorChoiceWidgetState createState() => _ColorChoiceWidgetState(_list);
}

class _ColorChoiceWidgetState extends State<_ColorChoiceWidget>{
  @override

  List<TraditionalColor> _list;
  int _selectedIndex = -1;

  _ColorChoiceWidgetState(this._list);

  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _colorContainer(context, 0),
            _colorContainer(context, 1),
            _colorContainer(context, 2),
            _colorContainer(context, 3),
          ],
        ),
        Text(
          _selectedIndex >= 0 ? _list[_selectedIndex].kana : '',
          style: TextStyle(
            fontFamily: 'satsuki',
            fontWeight: FontWeight.bold,
            fontSize: 40.0,
            color: Colors.black,
          ),
        ),
        RaisedButton(
          child: Text('けってい'),
          onPressed: () => print(_list[_selectedIndex].kana),
        ),
      ],
    );
  }

  Widget _colorContainer(BuildContext context, int index){
    return GestureDetector(
      onTap: (){
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.width * 0.2,
        decoration: BoxDecoration(
          border: Border.all(color: _selectedIndex == index ? Colors.yellow : Colors.black, width: 3),
          color: Color.fromARGB(255, _list[index].rgb.r, _list[index].rgb.g, _list[index].rgb.b),
        ),
      ),
    );
  }
}