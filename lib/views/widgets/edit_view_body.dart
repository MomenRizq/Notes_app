import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/views/widgets/custom_app_bar.dart';
import 'package:note_app/views/widgets/custom_text_field.dart';
import 'package:note_app/views/widgets/edit_note_colors_list_view.dart';

import '../../models/note_model.dart';

class editNoteViewBody extends StatefulWidget {
  const editNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<editNoteViewBody> createState() => _editNoteViewBodyState();
}

class _editNoteViewBodyState extends State<editNoteViewBody> {
  String? title, content;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          customAppBar(title: "Edit Note", icon: Icons.check,onPressed: (){

            widget.note.title = title ?? widget.note.title ;
             widget.note.subTitle = content ?? widget.note.subTitle;
             widget.note.save();
             BlocProvider.of<NotesCubit>(context).fetchAllNotes();
             Navigator.pop(context);
          },),
          const SizedBox(
            height: 50,
          ),
          customTextField(
            initialValue:widget.note.title ,
            hint: widget.note.title,
            onChanged: (value) {

              title = value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          customTextField(
            initialValue:widget.note.subTitle ,
            hint: widget.note.subTitle,
            maxLines: 5,
            onChanged: (value) {
              content = value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
           editNoteColorsList(
            note: widget.note,
          ),
        ],
      ),
    );
  }
}
