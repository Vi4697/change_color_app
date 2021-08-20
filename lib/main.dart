import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyPage()));
}

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final Random _random = Random();

  Color _color = Color(0xFFFFFFFF);

  void changeColor() {
    setState(() {
      _color = Color.fromRGBO(
        _random.nextInt(255),
        _random.nextInt(255),
        _random.nextInt(255),
        _random.nextDouble(),
      );
    });
  }

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: InkWell(
          onTap: () {
            changeColor();
            _incrementCounter();
          },
          child: Stack(children: [
            Container(
              color: _color,
              child: Center(
                child: Text(
                  'Hey there',
                  style: TextStyle(color: Colors.black, fontSize: 30),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Positioned(bottom: 350, left: 58,
                child: Text('You have $_counter bonuses!',
                  style: TextStyle(color: Colors.black, fontSize: 30), textAlign: TextAlign.center,),
                )
          ]),
        ));
  }
}
