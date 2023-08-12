import 'package:avatar_course2_6_note/core/constants.dart';

class Note {
  late int id;
  late String title;
  late String content;

  Note();

  Note.fillData({
    required this.id,
    required this.title,
    required this.content,
  });

  // read
  /*
  map = {
  'id' : 1,
  'content' : 'This is a note'
  }
  id = map['id']
  content = map['content']
  print(note.id);
  print(note.content);
  */
  Note.fromMap(Map<String, dynamic> map) {
    id = map[Constants.databaseNotesIdColumnName];
    content = map[Constants.databaseNotesContentColumnName];
    title = map[Constants.databaseNotesTitleColumnName];
  }

  // write
  /* object note2 >> id = 2, content = 'This is a note 2'
  map = {}
  map['id'] = id
    map = {
    'id' : 2,
    }
  map['content'] = content
    map = {
    'id' : 2,
    'content' : 'This is a note 2'
    }
    id = 4;
    map['id'] = id;
    map = {
    'id' : 2,
    'content' : 'This is a note 2'
    } // Wrong X

    map = {
    'id' : 4,
    'content' : 'This is a note 2'
    } // Correct
    ----------------------------------------------------------------
      map = {
      'id' : 2,
      'content' : 'This is a note 2'
      };

  */
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      Constants.databaseNotesContentColumnName: content,
      Constants.databaseNotesTitleColumnName: title,
    };
  }
}
