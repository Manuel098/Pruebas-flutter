import 'package:flutter/material.dart';
import 'package:qr_viewer/src/pages/address_page.dart';
import 'package:qr_viewer/src/pages/maps_page.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _makeAppBarr('QR Scaner'),
      bottomNavigationBar: _bottomBar(context),
      floatingActionButton: FloatingActionButton(
        onPressed: (){}, 
        child: Icon(Icons.filter_center_focus,size: 35, color: Color.fromRGBO(246, 243, 233, 1.0)),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: _callPage(_currentIndex)
    );
  }

  _callPage(int page){
    switch (page) {
      case 0:
        return MapsPage();
        break;
      case 1:
        return AddressPage();
        break;
      default:
        return MapsPage();
        break;
    }
  }

  AppBar _makeAppBarr(String title) => AppBar(
    title: Text(title),
    centerTitle: true,
    actions: <Widget>[
      IconButton(icon: Icon(Icons.delete_forever), onPressed: (){})
    ],
  );

  Theme _bottomBar(BuildContext cont) => Theme(
    data: Theme.of(cont).copyWith(
      canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
      primaryColor: Color.fromRGBO(246, 243, 233, 1.0),
      textTheme: Theme.of(cont).textTheme.copyWith(
        caption: TextStyle(color: Color.fromRGBO(214, 211, 203, 0.6))
      )
    ), 
    child: _makeBottomNavigation()
  );

  BottomNavigationBar _makeBottomNavigation() => BottomNavigationBar(
    items: [
      BottomNavigationBarItem(icon: Icon(Icons.map), title: Text('Maps')),
      BottomNavigationBarItem(icon: Icon(Icons.brightness_5), title: Text('Directions'))
    ],
    currentIndex: _currentIndex,
    onTap: (index){
      setState(() {
        _currentIndex = index;
      });
    },
  );
}
