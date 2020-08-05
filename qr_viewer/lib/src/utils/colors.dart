import 'package:flutter/material.dart';

final _whiteMode = <String, Color> {
  "caption" : Color.fromRGBO(214, 211, 203, 0.6),
  "label" : Color.fromRGBO(214, 211, 203, 1.0),
  "secondary": Color.fromRGBO(57, 62, 70, 1.0),
  "primary" : Color.fromRGBO(34, 40, 49, 1.0),
  "p" : Color.fromRGBO(238, 238, 237, 1.0),
  "h1": Color.fromRGBO(13, 174, 181, 1.0),
  "h2": Color.fromRGBO(13, 174, 181, 0.7),
  "h3": Color.fromRGBO(13, 174, 181, 0.5),
  "error" : Colors.redAccent[400],
  "delete":Colors.red[400],
  "warning":Colors.yellowAccent[100]
};

final _darkMode = <String, Color> {
  "caption" : Color.fromRGBO(214, 211, 203, 0.6),
  "label" : Color.fromRGBO(214, 211, 203, 1.0),
  "secondary": Color.fromRGBO(57, 62, 70, 1.0),
  "primary" : Color.fromRGBO(34, 40, 49, 1.0),
  "p" : Color.fromRGBO(238, 238, 237, 1.0),
  "h1": Color.fromRGBO(13, 174, 181, 1.0),
  "h2": Color.fromRGBO(13, 174, 181, 0.7),
  "h3": Color.fromRGBO(13, 174, 181, 0.5),
  "error" : Colors.redAccent[400],
  "delete":Colors.red[400],
  "warning":Colors.yellowAccent[100]
};

String _mode = 'dark';

Color getConfigColor({@required String color}) => _mode == 'dark'?
  _darkMode[color] : _whiteMode[color];