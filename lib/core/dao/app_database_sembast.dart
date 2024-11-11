import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class AppDatabaseSembast {

  static final AppDatabaseSembast _singleton = AppDatabaseSembast._internal();
  static Database? _database;

  AppDatabaseSembast._internal();

  factory AppDatabaseSembast() => _singleton;

  Future<Database> get database async {
    _database ??= await _openDatabase();

    return _database!;

  }  

  Future<Database> _openDatabase() async {
    final directory = await getApplicationDocumentsDirectory();
    final dbPath = '${directory.path}/nutrii_database.db';
    final db = await databaseFactoryIo.openDatabase(dbPath);
    return db;
  }



}