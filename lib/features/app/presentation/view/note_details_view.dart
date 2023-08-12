import 'package:avatar_course2_6_note/core/constants.dart';
import 'package:avatar_course2_6_note/core/resources/manager_icon_sizes.dart';
import 'package:avatar_course2_6_note/core/storage/local/database/model/note.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_font_sizes.dart';
import '../../../../core/resources/manager_height.dart';
import '../../../../core/resources/manager_width.dart';
import '../controller/home_controller.dart';

class NoteDetailsView extends StatefulWidget {
  const NoteDetailsView({Key? key}) : super(key: key);

  @override
  State<NoteDetailsView> createState() => _NoteDetailsViewState();
}

class _NoteDetailsViewState extends State<NoteDetailsView> {
  late TextEditingController _textEditingController;
  final HomeController _controller = Get.find<HomeController>();
  late int noteId;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ModalRoute modalRoute = ModalRoute.of(context)!;
    if (modalRoute != null &&
        modalRoute.settings != null &&
        modalRoute.settings.arguments != null) {
      Map<String, dynamic> args =
          modalRoute.settings.arguments as Map<String, dynamic>;
      noteId = args[Constants.databaseNotesIdColumnName];
    }
    return GetBuilder<HomeController>(builder: (controller) {
      controller.show(noteId); // 0.1 second
      return Scaffold(
        appBar: AppBar(
          backgroundColor: ManagerColors.transparent,
          elevation: Constants.appBarElevation,
          title: Text(
            'Note $noteId ${controller.currentNote.title}',
            style: TextStyle(
              fontSize: ManagerFontSizes.s20,
              color: ManagerColors.white,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                perFormUpdate();
              },
              icon: Icon(
                Icons.save,
                color: ManagerColors.white,
                size: ManagerIconSizes.s36,
              ),
            ),
          ],
        ),
        extendBodyBehindAppBar: true,
        body: Container(
          padding: const EdgeInsets.symmetric(
            vertical: ManagerHeight.h14,
            horizontal: ManagerWidth.w14,
          ),
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ManagerColors.primaryColor,
                ManagerColors.secondaryColor,
              ],
            ),
          ),
          child: Container(
            margin: const EdgeInsetsDirectional.only(
              top: ManagerHeight.h100,
              bottom: ManagerHeight.h16,
              start: ManagerWidth.w16,
              end: ManagerWidth.w16,
            ),
            height: double.infinity,
            child: TextField(
                controller: _textEditingController
                  ..text = controller.currentNote.content,
              enabled: true,
              style: TextStyle(color: Colors.white),
              minLines: 1,
              maxLines: 50,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  perFormUpdate() {
    if (checkData()) {
      update();
    }
  }

  bool checkData() {
    if (_textEditingController.text.isNotEmpty) {
      return true;
    }

    return false;
  }

  update() {
    Note note = _controller.currentNote;
    note.content = _textEditingController.text;
    _controller.updateNote(updatedNote: note);
  }
}
