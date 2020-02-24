import 'package:flutter/material.dart';

import 'package:componentes/src/pages/card_page.dart';
import 'package:componentes/src/pages/home_page.dart';
import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/avatar_page.dart';

Map <String, WidgetBuilder> getApplicationRoutes(){
  return <String, WidgetBuilder>{
    '/' : (BuildContext context) => Home(),
    '/card' : (BuildContext context) => CardPage(),
    '/alert' : (BuildContext context) => AlertPage(),
    '/avatar' : (BuildContext context) => AvatarPage()
  };
}