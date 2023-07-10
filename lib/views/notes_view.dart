import 'package:flutter/material.dart';
import 'package:note_app/views/widgets/add_note_bottom_sheet.dart';
import 'package:note_app/views/widgets/notes_view_body.dart';

class notesView extends StatelessWidget {
  const notesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const notesViewBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              context: context,
              builder: (context) {
                return const FractionallySizedBox(
                 // heightFactor: 0.7, // Set the desired height as a fraction of the screen height
                  child: addNoteBottomSheet()
                );
              });
        },
        child: const Icon(Icons.add),
    ));
  }
}
