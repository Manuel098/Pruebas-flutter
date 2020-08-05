import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_viewer/routes.dart';
import 'package:qr_viewer/src/utils/theme.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent
    ));
    return MaterialApp(
      title: 'QRReader',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: getApplicationRoutes(),
      theme: getTheme(context),
    );
  }
}