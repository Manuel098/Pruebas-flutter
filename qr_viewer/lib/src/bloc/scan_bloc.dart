import 'dart:async';
import 'package:qr_viewer/src/providers/db_provider.dart';

class ScansBloc{
  static final ScansBloc _singleton = ScansBloc._();
  final _scansController = StreamController<List<ScanModel>>.broadcast();

  factory ScansBloc(){
    return _singleton;
  } 

  ScansBloc._(){
    // GET Scans from the DB
  }

  Stream <List<ScanModel>> get scanStream => _scansController.stream;

  dispose(){
    _scansController?.close();
  }

  postScan(ScanModel scan) async{
    DBProvider.db.newScan(scan);
    getScans();
  }

  getScans() async {
    _scansController.sink.add( await DBProvider.db.getAllScans() );
  }

  deleteScan(int id) async{
    await DBProvider.db.deleteScan(id);
    getScans();
  }

  deleteAll() async{
    await DBProvider.db.deleteAll();
    getScans();
  }
}