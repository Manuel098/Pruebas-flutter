import 'package:flutter/material.dart';
import 'package:movie_galery/src/pages/bottom_bar.dart';
import 'package:movie_galery/src/pages/home_page.dart';
import 'package:movie_galery/src/pages/movie_info.dart';
import 'package:movie_galery/src/pages/auth/SignIn.dart';
import 'package:movie_galery/src/pages/auth/signUp.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/' : (BuildContext context) => SignIn(),
    '/signUp' : (BuildContext context) => SignUp(),
    '/bottom' : (BuildContext context) => BottomBarC(),
    '/home': (BuildContext context) => HomePage(),
    '/info': (BuildContext context) => MovieInfo(),
  };
}
