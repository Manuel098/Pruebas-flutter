import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _width = 50, _heigth = 50;
  Color _color = Colors.pink;

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(50);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page Animated'),),
      body: Center(child: AnimatedContainer(
        duration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,

        width: _width,
        height: _heigth,
        decoration: BoxDecoration(
          borderRadius: _borderRadius,
          color: _color
        ),
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_circle_outline, size: 35,),
        onPressed: _changeForm
      ),
    );
  }
  void _changeForm(){
    final Random random = Random();

    _width = random.nextInt(300).toDouble();
    _heigth = random.nextInt(350).toDouble();
    _color = Color.fromARGB(255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
    setState(() {});
  }
}