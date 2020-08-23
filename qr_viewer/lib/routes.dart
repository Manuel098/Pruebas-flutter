import 'package:flutter/material.dart';
import 'package:qr_viewer/src/pages/home_page.dart';
import 'package:qr_viewer/src/pages/map_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    '/map' : (BuildContext context) => MapPage(),
  };
}
