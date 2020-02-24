// import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
final _MenuProvider myMenuProv = _MenuProvider();
class _MenuProvider{
  List<dynamic> options =[];

  _MenuProvider(){
    cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    final response = await rootBundle.loadString('data/menu-opts.json');
    
    Map dataMap = json.decode(response);
    List<dynamic> options = dataMap['routs'];

    return options;
  }
}