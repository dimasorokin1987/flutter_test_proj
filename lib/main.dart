import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(new MainWidget());

class MainWidget extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return new MaterialApp(
      title: 'flutter test project',
      home: new MainPage()
    );
  }
}

class MainPage extends StatefulWidget{
  @override
  State createState()=>new MainState();
}

class MainState extends State<MainPage>{
  //final Random _random = new Random();
  Color _color = Colors.white;
  int _state = DateTime.now().millisecondsSinceEpoch;

  int rand(){
    _state = _state * 1664525 + 1013904223;
    _state %= 256*256*256*256;
    return _state>>24;
  }

  void processTap(){
    setState(() {
      _color = Colors.red;
      int r = rand();
      int g = rand();
      int b = rand();
      print(_state);
      _color = new Color.fromRGBO(r,g,b,1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: _color,
      body: new InkWell(
        child: Align(
          alignment: Alignment.center,
          child: Text(
            "Hey there",
            textDirection: TextDirection.ltr,
            style: TextStyle(color: Colors.black)
          )
        ),
        onTap: processTap
      ),
    );
  }
}