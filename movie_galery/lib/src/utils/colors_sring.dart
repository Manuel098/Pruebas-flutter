import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// ESTA DICCIONARO LO VAMOS A MODIFICAR SEGUN LAS PREFERENCIAS DEL USUARIO 'isDarkMode' de la clase
/// ConfigInternal.dart

final _c = <String, Color>{
  'white_normal' : Color.fromARGB(255, 255, 255, 255),  //Esto no funciona
  'blancoOpaco': Color.fromARGB(255, 245, 245, 245),
  'Background': Color.fromARGB(255, 245, 245, 245), // aqui haremos un ternario, si DarkMode es true, cambiamos blanco a obscuro
  'azulTitle': Color.fromARGB(255, 96, 124, 236),
  'negroSeniso': Color.fromARGB(255, 54, 54, 54),
  'otroGris': Color.fromARGB(255, 178, 193, 198),
  'negroCarbon': Color.fromARGB(240, 0, 0, 0),
  'gris': Color.fromARGB(200, 255, 255, 255),
  'verde': Color.fromARGB(255, 64, 220, 133),
  'transparent': Color.fromARGB(0, 0, 0, 0),

  // Gradients
  'Gr1': Color.fromARGB(255, 126, 207, 147),
  'Gr2': Color.fromARGB(255, 126, 207, 187),
  'Gr3': Color.fromARGB(255, 39, 232, 177),

  'Re1': Color.fromARGB(255, 207, 64, 88),
  'Re2': Color.fromARGB(255, 207, 64, 131),
  'Re3': Color.fromARGB(255, 207, 0, 79),
  'Re4': Color.fromARGB(255, 255, 64, 137),

  'Or1': Color.fromARGB(255, 207, 114, 64),
  'Or2': Color.fromARGB(255, 207, 152, 64),
  'Or3': Color.fromARGB(255, 252, 194, 3),
  'Or4': Color.fromARGB(255, 230, 175, 48),
};
Color getColor({@required String color}) => _c[color];

String _mode = 'white';

enum ColorType {
  background, 
  edit,
  delete
}

final _whiteMode = <String, Color> {
  "main_theme" : Colors.blue[400],
  "background" : Colors.white,
  'buttons': Color.fromARGB(255, 178, 193, 198),
  "h1": Colors.black,
  "h2": Colors.black87,
  "h3": Colors.black54,
  "p" : Colors.black45,
  "navbar": Colors.black87,
  "label" : Colors.black54,
  "hintText" : Colors.black45,
  "inputBackground": Color(0XFFEFF3F6),  
  "iconButton": Color.fromARGB(255, 178, 193, 198),
  "icon":Colors.black87,
  "focussed" : Colors.black45,
  "contrastText":Colors.white,
  "contrastIcon":Colors.white70,
  "navbarIcon":Color.fromARGB(220, 255, 255, 255),
  "navbarColor": Color.fromARGB(200, 0, 0, 0),
  "error" : Colors.redAccent[400],
  "delete":Colors.red[400],
  "warning":Colors.yellowAccent[100]
};

final _darkMode = <String, Color> {
  "main_theme" : Colors.blue[200],
  "background" : Colors.black54,
  'buttons': Color.fromARGB(255, 178, 193, 198),
  "h1": Colors.white70,
  "h2": Colors.white60,
  "h3": Colors.white54,
  "p" : Colors.white38,
  "navbar": Colors.black45,
  "label" : Colors.white60,
  "hintText" : Colors.white30,
  "inputBackground": Color(0XFFEFF3F6),  
  "iconButton": Color.fromARGB(255, 178, 193, 198),
  "icon":Colors.white,
  "focussed" : Colors.white38,
  "contrastText":Colors.black87,
  "contrastIcon":Colors.black87,
  "navbarIcon":Color.fromARGB(220, 255, 255, 255),
  "navbarColor": Color.fromARGB(200, 0, 0, 0),
  "error" : Colors.redAccent[400],
  "delete":Colors.red[400],
  "warning":Colors.yellowAccent[100]
};

Color getConfigColor({@required String color}) => _mode == 'dark'?
  _darkMode[color] : _whiteMode[color];
