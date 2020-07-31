import 'package:flutter/material.dart';
import 'package:stiles/src/pages/basic_page.dart';
import 'package:stiles/src/pages/scroll_page.dart';
import 'package:stiles/src/pages/buttons_page.dart';


Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/basic': (BuildContext context) => BasicPage(),
    '/withScroll' :(BuildContext context) => ScrollPage(),
    '/buttons' :(BuildContext context) => ButtonsPage()
  };
}
