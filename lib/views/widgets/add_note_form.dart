import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/views/widgets/colors_list_view.dart';
import 'package:note_app/views/widgets/custom_button.dart';
import 'package:note_app/views/widgets/custom_text_field.dart';

import '../../cubits/add_note_cubit/add_note_cubit.dart';
import '../../models/note_model.dart';

class addNoteForm extends StatefulWidget {
  const addNoteForm({
    super.key,
  });

  @override
  State<addNoteForm> createState() => _addNoteFormState();
}

class _addNoteFormState extends State<addNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            customTextField(
              hint: "Title",
              onSaved: (value) {
                title = value;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            customTextField(
              hint: "content",
              onSaved: (value) {
                subTitle = value;
              },
              maxLines: 5,
            ),
            const SizedBox(
              height: 32,
            ),
            ColorsListView(),
            BlocBuilder<AddNoteCubit, AddNoteState>(
              builder: (context, state) {
                return customButton(
                  
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      var currentDate = DateTime.now();
                    var formattedCurrentDate =
                        DateFormat.yMd().format(currentDate);
                      print("Success");
                      var noteModel = NoteModel(
                          title: title!,
                          subTitle: subTitle!,
                          date:formattedCurrentDate,
                          color: Colors.blue.value);
                      BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                      print("Failed");
                    }
                  },
                  isLoading: state is AddNoteLoading ? true : false ,
                );
              },
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
