import 'package:flutter/material.dart';
import 'package:qr_viewer/src/utils/colors.dart';

getTheme(context) => ThemeData(
  primaryColor: getConfigColor(color: 'primary'),
  textTheme: Theme.of(context).textTheme.copyWith(
    headline4: TextStyle(
      color: getConfigColor(color: 'label'),
      fontWeight: FontWeight.w300,
      wordSpacing: 12
    ),
    bodyText1: TextStyle(
      color: getConfigColor(color: 'secondary'),
      fontWeight: FontWeight.w700
    )
  )
);