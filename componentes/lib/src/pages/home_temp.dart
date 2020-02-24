import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final List<String> options =['uno', 'dos', 'tres', 'cuatro'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My component App'),
      ),
      body: ListView(
        children: _makeShortList(),
      ),
    );
  }

  List<Widget> _makeList(){
    List<Widget> myList = List<Widget>();

    for (String option in options) {
      myList..add(Divider(height: 12, endIndent: 1000,))..add(
        Card(
          child: ListTile(
            title: Text('This is the title of $option'),
            subtitle: Text('This is a test ListTile'),
            onTap: (){
              print('object');
            },
          ),
          color: Colors.white70,
          elevation: 8,
        )
      );
    }
    return myList;
  }
  
  List <Column> _makeShortList() => options.map((object){
    return Column(
      children: <Widget>[
        Divider(height: 12, endIndent: 1000,),
        Card(
          child: ListTile(
            title: Text('This is the title of new $object '),
            subtitle: Text('This is a test ListTile'),
            leading: Icon(Icons.account_circle,size: 33, color: Colors.teal,),
            trailing: Icon(Icons.arrow_forward_ios,size: 33, color: Colors.teal,),
            onTap: (){
              print('$object');
            },
          ),
          color: Colors.white70,
          elevation: 8,
        )
      ],
    );
  }).toList();
}