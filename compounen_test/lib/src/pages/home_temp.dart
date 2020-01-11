import 'package:flutter/material.dart';

import '../styles.dart';

class HomePageTemp extends StatelessWidget {
  final TextStyle titleStyle = TexStyle().titleStyle();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compounent App', style: titleStyle,),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('List Title :D'),
            subtitle: Text('In this option you can open a window'),
          ),
          Divider(),
          ListTile(
            title: Text('List Title :D'),
          ),
          Divider(),
          ListTile(
            title: Text('List Title :D'),
          ),
          Divider(),
        ],
      ),
    );
  }
}