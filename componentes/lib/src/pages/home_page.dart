import 'package:componentes/src/modals/setting_modal.dart';
import 'package:componentes/src/services/setingService.dart';
import 'package:flutter/material.dart';

import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icons_string_util.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeSeting homeSetting = HomeSeting(titleSize: 20, fontW: FontWeight.w400);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components'),
        actions: <Widget>[
          MaterialButton(
            // color: Colors.teal[50],s
            onPressed: (() async {
              shouSettingAlert(cont: context, sett: homeSetting)
                  .then((value) => setState(() {}));
            }),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.settings,
                  color: Colors.teal[50],
                  size: 30,
                ),
                Text(
                  'Ajustes',
                  style: TextStyle(color: Colors.teal[50]),
                )
              ],
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
          )
        ],
      ),
      body: _list(),
      backgroundColor: Colors.grey[50],
    );
  }

  Widget _list() {
    return FutureBuilder(
        future: myMenuProv.cargarData(),
        initialData: [],
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) => ListView(
              children: _listItems(lista: snapshot.data, context: context),
            ));
  }

  List<Widget> _listItems({List<dynamic> lista, BuildContext context}) {
    List<Widget> menuList = List<Widget>();

    for (var item in lista) {
      menuList
        ..add(Divider(
          height: 12,
          endIndent: 1000,
        ))
        ..add(Card(
          child: ListTile(
            title: Text(
              item['text'],
              style: TextStyle(
                  fontSize: homeSetting.getTitleSize,
                  fontWeight: homeSetting.getFontW),
            ),
            subtitle: Text(item['description'],
                style: TextStyle(fontSize: homeSetting.getTitleSize - 10)),
            onTap: () {
              Navigator.pushNamed(context, '/${item['route']}');
            },
            leading: getIcon(item['icon']),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          color: Colors.cyan[50],
          elevation: 4,
          margin: EdgeInsets.only(left: 30, top: 5, right: 30),
        ));
    }
    return menuList;
  }
}
