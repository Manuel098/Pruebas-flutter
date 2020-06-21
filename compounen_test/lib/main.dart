import 'package:flutter/material.dart';

import 'package:compounen_test/src/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Compounent',
        debugShowCheckedModeBanner: false,
        home: HomePage());
  }
}
