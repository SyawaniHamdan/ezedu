import 'package:ezedu/models/note.dart';
import 'package:ezedu/models/subject.dart';
import 'package:ezedu/screens/tutor/menu/tutor_menu.dart';
import 'package:ezedu/screens/tutor/menu/viewmodels/tutor_viewmodel_notes.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

String noteD = "No";

class tutorNoteUpdate extends StatefulWidget {
  String noteId, noteDetails;
  int index;
  tutorNoteUpdate(this.noteId, this.noteDetails, this.index);

  @override
  State<tutorNoteUpdate> createState() => _tutorNoteUpdate();
}

class _tutorNoteUpdate extends State<tutorNoteUpdate> {
  int once = 0;
  double padding = 5;
  late Notes saved;
  TextEditingController noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TutorNotesViewModel>.reactive(
        disposeViewModel: false,
        viewModelBuilder: () => TutorNotesViewModel(),
        onModelReady: (model) {
          model.initialise();
          noteController = TextEditingController(text: widget.noteDetails);

          // Notes note = model.noteList;
          //saved = model.getNote(widget.noteId);
        },
        builder: (context, model, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                backgroundColor: Colors.lightBlue[50],
                body: SingleChildScrollView(
                    child: Column(
                  children: <Widget>[
                    const SizedBox(height: 20),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(top: 30, left: 10),
                        child: Text(
                          "Upload Note",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      child: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        padding: const EdgeInsets.all(8.0),
                        children: <Widget>[
                          Card(
                              child: Container(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: <Widget>[
                                      const Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Note ID",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Color.fromARGB(
                                                          255, 138, 138, 138))),
                                              child: Text(
                                                widget.noteId,
                                              ))),
                                      SizedBox(height: 20),
                                      const Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Note",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),

                                      TextFormField(
                                        keyboardType: TextInputType.multiline,
                                        maxLines: null,
                                        minLines: 4,
                                        controller: noteController,
                                        decoration: const InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.greenAccent,
                                                width: 1.0),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 255, 0, 0),
                                                width: 1.0),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 15),
                                      Row(
                                        children: <Widget>[
                                          const Expanded(
                                            child: Text(" "),
                                          ),
                                          ElevatedButton(
                                              onPressed: () async {
                                                Notes currentNote = model
                                                    .getNote(widget.noteId);

                                                model.updateNotes(
                                                    id: currentNote.id,
                                                    noteDetail:
                                                        noteController.text,
                                                    subjectId:
                                                        currentNote.subjectId,
                                                    tutorId:
                                                        currentNote.tutorId);

                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                    content: Text(
                                                        'Success deleted note.'),
                                                  ),
                                                );

                                                await Future.delayed(
                                                    Duration(seconds: 2));

                                                Navigator.of(context,
                                                        rootNavigator: true)
                                                    .pushAndRemoveUntil(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                tutorMainMenu()),
                                                        (route) => false);
                                              },
                                              child: const Text("Update")),
                                        ],
                                      ),

                                      SizedBox(height: 5),

                                      //add more stuff tu column
                                    ],
                                  )))
                        ],
                      ),
                    ),
                    Container(
                      height: 20.0,
                    ),
                  ],
                )),
              ),
            ));
  }
}
