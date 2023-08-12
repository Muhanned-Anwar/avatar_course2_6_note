import 'package:avatar_course2_6_note/core/storage/local/database/controller/note_database_controller.dart';
import 'package:avatar_course2_6_note/core/widgets/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../core/storage/local/database/model/note.dart';

class HomeController extends GetxController with Helpers {
  List<Note> notes = [];
  final NoteDatabaseController _noteDatabaseController =
      NoteDatabaseController();

  Note currentNote = Note.fillData(id: 0, title: '', content: '');

  Future<void> read() async {
    notes = await _noteDatabaseController.read();
    notes = notes.reversed.toList();
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

  Future<void> delete(int id, BuildContext context) async {
    if (await _noteDatabaseController.delete(id)) {
      for (int i = 0; i < notes.length; i++) {
        if (notes[i].id == id) {
          notes.removeAt(i);
          update();
          showSnackBar(context: context, message: 'Deleted Note Successfully');
        }
      }
    } else {
      showSnackBar(
          context: context, message: 'Deleted Note Field', error: true);
    }
  }

  @override
  void onInit() {
    super.onInit();
    read();
  }
}
