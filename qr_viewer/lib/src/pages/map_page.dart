import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:qr_viewer/src/models/scan_model.dart';
import 'package:qr_viewer/src/utils/keys.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    final ScanModel _scan = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Cordenadas QR"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.my_location),
            onPressed: (){}
          )
        ],
      ),
      body: _createFlutterMap(_scan)
    );
  }
  FlutterMap _createFlutterMap(_scan)=> FlutterMap(
    options: MapOptions(
      center: _scan.getLatLng(),
      zoom: 10
    ),
    layers: [_makeMap()],
  );

  TileLayerOptions _makeMap() => TileLayerOptions(
    urlTemplate: 'https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
    additionalOptions: {
    'accessToken':getKey('mapBox'),
    'id': 'mapbox.mapbox-streets-v8'
    }
  );
}