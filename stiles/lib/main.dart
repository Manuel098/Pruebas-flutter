import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stiles/routes.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Color.fromARGB(0, 0, 0, 0)
    ));
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños',
      initialRoute: '/withScroll',
      routes: getApplicationRoutes(),
    );
  }
}