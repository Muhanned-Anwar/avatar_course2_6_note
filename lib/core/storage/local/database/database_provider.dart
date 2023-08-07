import 'dart:io';

import 'package:avatar_course2_6_note/core/constants.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  static final DatabaseProvider _instance = DatabaseProvider._internal();
  late Database _database;

  DatabaseProvider._internal();

  factory DatabaseProvider() {
    return _instance;
  }

  Database get database => _database;

  Future<void> initDatabase() async {
    // path
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, Constants.databaseName);
    // Build Schema
    _database = await openDatabase(
      path,
      version: Constants.databaseFirstVersion,
      onCreate: (database, version) async {
        database.execute('CREATE TABLE '
            '${Constants.databaseNotesTableName}('
            '${Constants.databaseNotesIdColumnName} INTEGER PRIMARY KEY AUTOINCREMENT,'
            '${Constants.databaseNotesContentColumnName} TEXT)');
      },
      onOpen: (database) {},
      onUpgrade: (database, oldVersion, newVersion) {},
      onDowngrade: (database, oldVersion, newVersion) {},
    );
  }
}
