import 'package:flutter/material.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/widgets/edit_view_body.dart';


class editNoteView extends StatelessWidget {
  const editNoteView({Key? key, required this.note}) : super(key: key);
  final NoteModel note;

  //final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: editNoteViewBody(note: note,)
    );
  }
}