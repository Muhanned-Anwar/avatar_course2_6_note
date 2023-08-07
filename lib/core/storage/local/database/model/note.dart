import 'package:avatar_course2_6_note/core/constants.dart';

class Note {
  late int id;
  late String content;

  Note();

  // read
  Note.fromMap(Map<String, dynamic> map) {
    id = map[Constants.databaseNotesIdColumnName];
    content = map[Constants.databaseNotesContentColumnName];
  }

  // write
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      Constants.databaseNotesContentColumnName: content,
    };
  }
}
