import 'package:flutter/material.dart';

import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icons_string_util.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Components'),),
      body: _list(),
    );
  }

  Widget _list() {
    return FutureBuilder(
      future: myMenuProv.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List <dynamic>> snapshot) => 
        ListView(children: _listItems(lista : snapshot.data, context:context),)
    );
  }

  List<Widget> _listItems({List<dynamic> lista, BuildContext context}) {
    List<Widget> menuList = List<Widget>();

    for (var item in lista) {
      menuList..add(Divider(height: 12, endIndent: 1000,))..add(
        Card(
          child: ListTile(
            title: Text(item['text']),
            subtitle: Text(item['description']),
            onTap: (){
              Navigator.pushNamed(context, '/${item['route']}');
            },
            leading: getIcon(item['icon']),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          color: Colors.white70,
          elevation: 8,
        )
      );
    }  
    return menuList;
  }
}
