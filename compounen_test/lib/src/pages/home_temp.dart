import 'package:flutter/material.dart';

import '../styles.dart';

class HomePageTemp extends StatelessWidget {
  final TextStyle _titleStyle = TexStyle().titleStyle();
  final Color lime = Background().limeStyle();
  final List<String> _options = [
    'one',
    'two',
    'trhee',
    'for',
    'five',
    'six',
    'seven',
    'eight',
    'nine',
    'teen'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Compounent App',
          style: _titleStyle,
        ),
        backgroundColor: lime,
      ),
      body: ListView(
          // children: _makeItems()
          children: _makeShortItems()),
    );
  }

  List<Widget> _makeShortItems() {
    return _options.map((item) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text('el numero es $item'),
            subtitle: Text('This is the subtitle of $item'),
            leading: Icon(
              Icons.assessment,
              color: lime,
              size: 44,
            ),
            trailing: Icon(Icons.arrow_forward_ios, color: lime),
            onTap: () {
              print('Hello');
            },
            onLongPress: () {
              print('Long');
            },
          ),
          Divider(color: lime, indent: 15, endIndent: 15)
        ],
      );
    }).toList();
  }
}
