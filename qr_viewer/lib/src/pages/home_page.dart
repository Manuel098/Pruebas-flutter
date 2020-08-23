import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_viewer/src/bloc/scan_bloc.dart';
import 'package:qr_viewer/src/models/scan_model.dart';
import 'package:qr_viewer/src/pages/address_page.dart';
import 'package:qr_viewer/src/pages/maps_page.dart';
import 'package:qr_viewer/src/utils/colors.dart';
import 'package:qr_viewer/src/utils/utils.dart' as utils;
import 'package:barcode_scan/barcode_scan.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scansBloc = ScansBloc();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _makeAppBarr('QR Scaner', context),
      bottomNavigationBar: _bottomBar(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _scanQR(context), 
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
  _scanQR(BuildContext cont) async {
    // https://pub.dev/packages/barcode_scan
    // geo:40.6096509795937,-74.15151014765628
    // MATMSG:TO:man@mail.com;SUB:resepcion;BODY:Hola compa te mando este email;;
    // WIFI:S:elrayan;T:WPA;P:qpex;;

    // ScanResult futureResult;
    String futureResult="asd";
 
    // try {
    //   futureResult = await BarcodeScanner.scan();
    // }catch(e){
    //   print(e.toString());
    // }

    if(futureResult != null){
      // final scan = ScanModel(value: futureResult.rawContent );
      final scan = ScanModel(value: "geo:40.6096509795937,-74.15151014765628");
      scansBloc.postScan(scan);
      
      Platform.isIOS?
        Future.delayed(Duration(milliseconds : 750),(){
          utils.openScan(scan, cont);
        }): utils.openScan(scan, cont);
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
      IconButton(icon: Icon(Icons.delete_forever), onPressed: scansBloc.deleteAll)
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
