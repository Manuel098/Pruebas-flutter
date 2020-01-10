import 'package:flutter/material.dart';
import 'package:testude/src/pages/contador.dart';


class MyApp extends StatelessWidget{
  @override
  Widget build( context ){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        // child: HomePage(),
        child: Counter(),
      )
    );
  }
}
