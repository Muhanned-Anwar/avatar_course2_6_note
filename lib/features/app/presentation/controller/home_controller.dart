import 'package:avatar_course2_6_note/core/storage/local/database/controller/note_database_controller.dart';
import 'package:get/get.dart';
import '../../../../core/storage/local/database/model/note.dart';

class HomeController extends GetxController {
  List<Note> notes = [];
  final NoteDatabaseController _noteDatabaseController =
      NoteDatabaseController();

  Note currentNote = Note.fillData(id: 0, title: '', content: '');

  Future<void> read() async {
    notes = await _noteDatabaseController.read();
    update();
  }

  Future<void> show(int noteId) async {
    currentNote = await _noteDatabaseController.show(noteId) ?? Note();
    update();
  }

  Future<bool> create({required Note note}) async {
    int id = await _noteDatabaseController.create(note);
    if (id != 0) {
      note.id = id;
      notes.add(note);
      update();
    }

    return id != 0;
  }

  Future<bool> updateNote({required Note updatedNote}) async {
    bool updated = await _noteDatabaseController.update(updatedNote);
    if (updated) {
      for (int i = 0; i < notes.length; i++) {
        if (notes[i].id == updatedNote.id) {
          update();
          notes[i] = updatedNote;
          return true;
        }
      }
    }

    return false;
  }

  @override
  void onInit() {
    super.onInit();
    read();
  }
}
