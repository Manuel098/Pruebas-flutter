import 'package:flutter/material.dart';

import 'package:componentes/routes.dart';
import 'package:componentes/src/pages/alert_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Components',
      debugShowCheckedModeBanner: false,
      // home: Home(),
      initialRoute: '/',
      routes: getApplicationRoutes(),
      onGenerateRoute: (setings){
        return MaterialPageRoute(
          builder: (BuildContext context) => AlertPage()
        );
      },
    );
  }
}
