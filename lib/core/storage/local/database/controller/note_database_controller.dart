import 'package:avatar_course2_6_note/core/constants.dart';
import 'package:avatar_course2_6_note/core/extension/extensions.dart';
import 'package:avatar_course2_6_note/core/storage/local/database/model/note.dart';
import 'package:avatar_course2_6_note/core/storage/local/database/provider/database_operations.dart';
import 'package:avatar_course2_6_note/core/storage/local/database/provider/database_provider.dart';
import 'package:sqflite/sqflite.dart';

class NoteDatabaseController extends DatabaseOperations<Note> {
  Database database = DatabaseProvider().database;

  @override
  Future<int> create(Note object) async {
    return await database.insert(
      Constants.databaseNotesTableName,
      object.toMap(),
    );
  }

  @override
  Future<bool> delete(int id) async {
    int countItemsDeleted = await database.delete(
      Constants.databaseNotesTableName,
      where: '${Constants.databaseNotesIdColumnName} = ?',
      whereArgs: [id],
    );

    return countItemsDeleted > 0;
  }

  @override
  Future<List<Note>> read() async {
    List<Map<String, Object?>> data =
        await database.query(Constants.databaseNotesTableName);

    // List<Note> notes = [];
    // for (Map<String, Object?> note in data) {
    //   notes.add(Note.fromMap(note));
    // }
    // return notes;

    return data.map((row) => Note.fromMap(row)).toList();
  }

  @override
  Future<Note?> show(int id) async {
    List<Map<String, Object?>> data = await database.query(
      Constants.databaseNotesTableName,
      where: '${Constants.databaseNotesIdColumnName} = ?',
      whereArgs: [id],
    );
    if (data.isNotEmpty) {
      return Note.fromMap(data.first);
    }

    return null;
  }

  Future<List<Note>?> searchByNameOrId(int? id, String? content) async {
    List<Map<String, Object?>> data = await database.query(
      Constants.databaseNotesTableName,
      where:
          '${Constants.databaseNotesIdColumnName} = ? or ${Constants.databaseNotesContentColumnName} = ?',
      whereArgs: [id.onNull(), content.onNull()],
    );

    if (data.isNotEmpty) {
      return data.map((row) => Note.fromMap(row)).toList();
    }

    return null;
  }

  @override
  Future<bool> update(Note object) async {
    int countOfRowsUpdated = await database.update(
      Constants.databaseNotesTableName,
      object.toMap(),
      where: '${Constants.databaseNotesIdColumnName} = ?',
      whereArgs: [object.id]
    );

    return countOfRowsUpdated > 0;
  }
}
