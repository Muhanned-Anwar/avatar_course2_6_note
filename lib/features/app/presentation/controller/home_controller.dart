import 'package:avatar_course2_6_note/core/storage/local/database/controller/note_database_controller.dart';
import 'package:get/get.dart';
import '../../../../core/storage/local/database/model/note.dart';

class HomeController extends GetxController {
  List<Note> notes = [];
  final NoteDatabaseController _noteDatabaseController =
      NoteDatabaseController();

  Future<void> read() async {
    notes = await _noteDatabaseController.read();
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

  @override
  void onInit() {
    super.onInit();
    read();
  }
}
