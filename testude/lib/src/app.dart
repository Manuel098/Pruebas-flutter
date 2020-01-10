import 'package:flutter/material.dart';
import 'package:testude/src/pages/home.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build( context ){
    return MaterialApp(
      home: Center(
        child: HomePage(),
      )
    );
  }
}
