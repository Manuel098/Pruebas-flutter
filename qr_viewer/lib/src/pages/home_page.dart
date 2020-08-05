import 'package:flutter/material.dart';
import 'package:qr_viewer/src/providers/db_provider.dart';
import 'package:qr_viewer/src/pages/address_page.dart';
import 'package:qr_viewer/src/pages/maps_page.dart';
import 'package:qr_viewer/src/utils/colors.dart';
// import 'package:barcode_scan/barcode_scan.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _makeAppBarr('QR Scaner', context),
      bottomNavigationBar: _bottomBar(context),
      floatingActionButton: FloatingActionButton(
        onPressed: _scanQR, 
        child: Icon(Icons.filter_center_focus,size: 35, color: getConfigColor(color: 'secondary')),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Stack(children: <Widget>[
        _background(),
        _callPage(_currentIndex)
      ],)
      
    );
  }

  // Functions
  _scanQR() async {
    // https://pub.dev/packages/barcode_scan
    // geo:40.6096509795937,-74.15151014765628
    // MATMSG:TO:man@mail.com;SUB:resepcion;BODY:Hola compa te mando este email;;
    // WIFI:S:elrayan;T:WPA;P:qpex;;

    dynamic futureString ='https://pub.dev/packages/barcode_scan';
 
    // try {
    //   futureString = await BarcodeScanner.scan();
    // }catch(e){
    //   futureString=e.toString();
    // }

    if(futureString != null){
      final scan = ScanModel(value: futureString );
      DBProvider.db.newScan(scan);
      setState(() {});
    }
  }

  // Widgets
  Widget _callPage(int page){
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

  AppBar _makeAppBarr(String title, BuildContext cont) => AppBar(
    title: Text(title, style: Theme.of(cont).textTheme.headline4,),
    centerTitle: true,
    actions: <Widget>[
      IconButton(icon: Icon(Icons.delete_forever), onPressed: (){
        DBProvider.db.deleteAll();
        setState(() { });
      })
    ],
  );

  Theme _bottomBar(BuildContext cont) => Theme(
    data: Theme.of(cont).copyWith(
      canvasColor: getConfigColor(color: 'primary'),
      primaryColor: getConfigColor(color: 'label'),
      textTheme: Theme.of(cont).textTheme.copyWith(
        caption: TextStyle(color: getConfigColor(color: 'caption'))
      )
    ), 
    child: _makeBottomNavigation()
  );

  Container _background() => Container(
    width: double.infinity,
    height: double.infinity,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [getConfigColor(color: 'h1'), getConfigColor(color: 'h3')],
        begin: FractionalOffset(0.0, 0.4),
        end: FractionalOffset(0.0, 1.0)
      )
    ),
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
