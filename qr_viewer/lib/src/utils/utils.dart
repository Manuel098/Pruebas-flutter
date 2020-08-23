import 'package:flutter/material.dart';
import 'package:qr_viewer/src/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

openScan(ScanModel scan, BuildContext cont) async {
  switch (scan.type) {
    case 'mail':
      print('mail');
      break;
    case 'http':
      if (await canLaunch(scan.value)) {
        await launch(scan.value);
      } else {
        throw 'Could not launch ${scan.value}';
      }      
      break;
    case 'geo':
      Navigator.pushNamed(cont, '/map', arguments : scan);
      print('geo');
      break;
    case 'text':
      print('text');
      break;
  }

}
