import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_viewer/src/models/scan_model.dart';
export 'package:qr_viewer/src/models/scan_model.dart';


class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if(_database != null) return _database;
    
    _database = await _initDB();
    return _database;
  }

  Future<Database> _initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ScansDB.db'); 
    return await openDatabase(
      path,
      version: 1,
      onOpen: (Database db){},
      onCreate: (Database db, int version) async{
        await db.execute(
          'CREATE TABLE Scans (id INTEGER PRIMARY KEY, type VARCHAR(255), value  VARCHAR(255))'
        );
      }
    );
  }

  // POST

  Future<int> newScanRaw(ScanModel newScan) async{
    final Database db = await database;

    final res = await db.rawInsert(
      "INSERT INTO Scans (id, type, value) VALUES ( ${newScan.id}, '${newScan.type}', '${newScan.value}' )"
    );
    return res;
  }
  
  Future<int> newScan( ScanModel newScan ) async{
    final Database db = await database;

    final res = await db.insert('Scans', newScan.toJson());
    return res;
  }

  // GET
  Future<ScanModel> getScanID( int id) async{
    final Database db = await database;

    final res = await db.query('Scans', where: 'id = ?', whereArgs: [id]);

    return res.isNotEmpty ?  ScanModel.fromJson(res.first) : null;
  }

  Future<List<ScanModel>> getAllScans() async{
    final Database db = await database;

    final res = await db.query('Scans');

    List<ScanModel> list = res.isNotEmpty ? 
      res.map((e) => ScanModel.fromJson(e)).toList() : [];

    return list;
  }

  Future<List<ScanModel>> getScansForType(String type) async{
    final Database db = await database;

    final res = await db.rawQuery("SELECT * FROM Scans WHERE type = '$type'");
    
    List<ScanModel> list = res.isNotEmpty ? 
      res.map((e) => ScanModel.fromJson(e)).toList() : [];

    return list;
  }

  // PUSH

  Future<int> pushScan(ScanModel newScan) async {
    final Database db = await database;
    final res = await db.update('Scans', newScan.toJson(), where: 'id = ?', whereArgs: [newScan.id]);

    return res;
  }

  // DELETE
  Future<int> deleteScan(int id) async {
    final Database db = await database;

    final res = await db.delete('Scans', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  Future<int> deleteAll() async {
    final Database db = await database;

    final res = await db.rawDelete("DELETE FROM Scans");
    return res;
  }
}