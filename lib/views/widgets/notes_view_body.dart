import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/views/widgets/custom_app_bar.dart';

import 'notes_list_view.dart';
class notesViewBody extends StatefulWidget {
  const notesViewBody({Key? key}) : super(key: key);

  @override
  State<notesViewBody> createState() => _notesViewBodyState();
}

class _notesViewBodyState extends State<notesViewBody> {

   @override
  void initState() {
   BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          customAppBar(
            title: 'Notes',
            icon: Icons.search,
          ),
          Expanded(
            child: notesListView(),
          ),
        ],
      ),
    );
  }
}
