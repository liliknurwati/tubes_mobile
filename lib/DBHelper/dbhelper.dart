import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:tubes_mobile/Models/laporanharian.dart';
import 'package:tubes_mobile/Models/pegawai.dart';

class DbHelper {
  static DbHelper _dbHelper;
  static Database _database;
  DbHelper._createObject();

  Future<Database> initDb() async{

    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'pegawai.db';

    var pegawaiDatabase =  openDatabase(path, version: 4, onCreate: _createDb);

    return pegawaiDatabase ;
  }

  Future<Database> initDbLaporan() async{

    Directory directory = await getApplicationDocumentsDirectory();
    String laporanPath = directory.path + 'laporan.db';

    var pegawaiDatabase =  openDatabase(laporanPath, version: 4, onCreate: _createDbLaporan);

    return pegawaiDatabase ;
  }

    void _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE pegawai (
        id INTEGER PRIMARY KEY,
        name TEXT,
        posisi TEXT,
        phone TEXT
      )
    ''');

  }

  void _createDbLaporan(Database db, int version) async {
    await db.execute('''
      CREATE TABLE pegawai (
        id INTEGER PRIMARY KEY,
        date TEXT,
        keterangan TEXT
      )
    ''');

  }

   Future<List<Map<String, dynamic>>> select() async {
    Database db = await this.initDb();
    var mapList = await db.query('pegawai', orderBy: 'name');
    return mapList;
   }

   Future<List<Map<String, dynamic>>> selectLaporan() async {
    Database db = await this.initDbLaporan();
    var mapList = await db.query('laporan', orderBy: 'date');
    return mapList;
   }

   Future<int> insert(Pegawai object) async {
    Database db = await this.initDb();
    int count = await db.insert('pegawai', object.toMap());
    return count;
   }

   Future<int> insertLaporan(Laporan object) async {
    Database db = await this.initDbLaporan();
    int count = await db.insert('laporan', object.toMap());
    return count;
   }

   Future<int> update(Pegawai object) async {
    Database db = await this.initDb();
    int count = await db.update('pegawai', object.toMap(),
                                where: 'id=?',
                                whereArgs: [object.id]);
    return count;
   }

   Future<int> updateLaporan(Pegawai object) async {
    Database db = await this.initDbLaporan();
    int count = await db.update('laporan', object.toMap(),
                                where: 'id=?',
                                whereArgs: [object.id]);
    return count;
   }

   Future<int> delete(int id) async {
    Database db = await this.initDb();
    int count = await db.delete('pegawai',
                              where: 'id=?',
                              whereArgs: [id]);
   return count;
   }

   Future<int> deleteLaporan(int id) async {
    Database db = await this.initDbLaporan();
    int count = await db.delete('laporan',
                              where: 'id=?',
                              whereArgs: [id]);
   return count;
   }

   Future<List<Pegawai>> getPegawaiList() async {
      var pegawaiMapList = await select();
      int count = pegawaiMapList.length;
      List<Pegawai> pegawaiList = List<Pegawai>();
      for (int i=0; i<count; i++) {
        pegawaiList.add(Pegawai.fromMap(pegawaiMapList[i]));
      }
     return pegawaiList;
   }

   Future<List<Laporan>> getLaporanList() async {
      var laporanMapList = await select();
      int count = laporanMapList.length;
      List<Laporan> laporanList = List<Laporan>();
      for (int i=0; i<count; i++) {
        laporanList.add(Laporan.fromMap(laporanMapList[i]));
      }
     return laporanList;
   }

   factory DbHelper() {
    if (_dbHelper == null) {
    _dbHelper = DbHelper._createObject();
    }
    return _dbHelper;
   }

    Future<Database> get database async {
      if (_database == null) {
      _database = await initDb();
      }
      return _database;
    }

}