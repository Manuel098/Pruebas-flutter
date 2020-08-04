import 'package:flutter/material.dart';
import 'package:qr_viewer/routes.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QRReader',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: getApplicationRoutes(),
      theme: ThemeData(
        primaryColor: Color.fromRGBO(31, 31, 31, 1.0),
      ),
    );
  }
}