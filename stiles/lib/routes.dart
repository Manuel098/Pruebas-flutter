import 'package:flutter/material.dart';
import 'package:stiles/src/pages/basic_page.dart';


Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/basic': (BuildContext context) => BasicPage()
  };
}
