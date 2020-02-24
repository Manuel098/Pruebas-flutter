import 'package:flutter/material.dart';

import 'package:compounen_test/src/pages/home_page.dart';
import './src/pages/home_temp.dart';
import './src/styles.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Compounent',
      debugShowCheckedModeBanner: false,
      home: HomePage()
    );
  }
}