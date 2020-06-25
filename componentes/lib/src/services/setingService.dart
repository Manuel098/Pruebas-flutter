import 'package:flutter/material.dart';

class HomeSeting {
  double titleSize;
  FontWeight fontW;

  HomeSeting({@required this.titleSize, this.fontW = FontWeight.bold});

  get getTitleSize => titleSize;
  set setTitleSize(double vara) => titleSize = vara;
  get getFontW => fontW;
}
