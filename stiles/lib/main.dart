import 'package:flutter/material.dart';
import 'package:stiles/routes.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños',
      initialRoute: '/basic',
      routes: getApplicationRoutes(),
    );
  }
}