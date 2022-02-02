import 'package:ezedu/models/note.dart';
import 'package:ezedu/models/subject.dart';
import 'package:ezedu/screens/tutor/menu/tutor_menu.dart';
import 'package:ezedu/screens/tutor/menu/tutor_menui_noteUpdate.dart';
import 'package:ezedu/screens/tutor/menu/viewmodels/tutor_viewmodel_notes.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class tutorNote extends StatefulWidget {
  @override
  State<tutorNote> createState() => _tutorNote();
}

class _tutorNote extends State<tutorNote> {
  int once = 0;
  double padding = 5;
  String _selectedSubjectId = "none";

  List<Subject> subjectStored = [
    Subject(
        id: "none",
        subjectName: "Choose",
        subjectDesc: "none",
        subjectPrice: 0.0,
        subjectDate: "-",
        subjectSlot: "-",
        tutorId: "none"),
  ];
  List<Subject> uniqueStored = [];
  TextEditingController noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TutorNotesViewModel>.reactive(
        disposeViewModel: false,
        viewModelBuilder: () => TutorNotesViewModel(),
        onModelReady: (model) {
          model.initialise();
        },
        builder: (context, model, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                backgroundColor: Colors.lightBlue[50],
                body: SingleChildScrollView(
                    child: Column(
                  children: <Widget>[
                    Container(
                      height: 20.0,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.all(padding),
                        child: const Text(
                          "Upload Note",
                          style: TextStyle(
                              fontSize: 21, fontWeight: FontWeight.bold),
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
                                          "Select class group",
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
                                          child: DropdownButton<String>(
                                            dropdownColor: const Color.fromARGB(
                                                255, 211, 198, 247),
                                            value: _selectedSubjectId,
                                            onChanged:
                                                (String? selectedSubject) {
                                              setState(() {
                                                _selectedSubjectId =
                                                    selectedSubject!;

                                                //print(_selectedSubjectId);
                                              });
                                            },
                                            items: subjectStored
                                                .map<DropdownMenuItem<String>>(
                                                    (Subject value) {
                                              return DropdownMenuItem<String>(
                                                value: value.id,
                                                child: Text(value.subjectName +
                                                    "\nDate:" +
                                                    value.subjectDate +
                                                    " | Slot:" +
                                                    value.subjectSlot),
                                              );
                                            }).toList(),
                                          )),
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
                                          border: OutlineInputBorder(),
                                          hintText: 'Add new note..',
                                        ),
                                      ),
                                      SizedBox(height: 15),
                                      Row(
                                        children: <Widget>[
                                          /*
                                  IconButton(
                                      icon: Icon(Icons.insert_link),
                                      onPressed: () {}),
                                  IconButton(
                                      icon: Icon(Icons.image_outlined),
                                      onPressed: () {}),
                                  IconButton(
                                      icon: Icon(Icons.videocam),
                                      onPressed: () {}),
                                      */
                                          Expanded(
                                            child: Text(" "),
                                          ),
                                          ElevatedButton(
                                              onPressed: () async {
                                                model.createNote(
                                                    noteDetail:
                                                        noteController.text,
                                                    subjectId:
                                                        _selectedSubjectId,
                                                    tutorId:
                                                        model.currentTutor.id);

                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content:
                                                        Text('Note Added.'),
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
                                              child: const Text("Add")),
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
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: padding),
                        child: const Text(
                          "Sessions",
                          style: TextStyle(
                              fontSize: 21, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                        height: 0.1,
                        child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: (model.noteList == null)
                                ? 0
                                : model.subjectList.length,
                            itemBuilder: (BuildContext context, int index) {
                              Subject subject = model.subjectList[index];
                              if (once < model.subjectList.length) {
                                int duplicate = 0;
                                for (int i = 0; i < subjectStored.length; i++) {
                                  // print(
                                  //    "${subjectStored[i].id} and ${subject.id}");
                                  if (subjectStored[i].id == subject.id) {
                                    duplicate++;
                                  }
                                }
                                if (duplicate == 0) {
                                  subjectStored.add(subject);
                                }

                                once++;
                              }
                              return Text(" ");
                            })),
                    Container(
                        padding: const EdgeInsets.all(8.0),
                        //height: 1000,
                        child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: (model.noteList == null)
                                ? 0
                                : model.noteList.length,
                            itemBuilder: (BuildContext context, int index) {
                              Notes noteDetails = model.noteList[index];

                              Subject subject =
                                  model.getSubject(noteDetails.subjectId);
                              return Card(
                                child: ListTile(
                                  title: Column(children: <Widget>[
                                    SizedBox(height: 10),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(subject.subjectName,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20)),
                                    ),
                                    SizedBox(height: 10),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Date : ' + subject.subjectDate,
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Slot : ' + subject.subjectSlot,
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                    const Divider(
                                      height: 20,
                                      color: Colors.black,
                                    ),
                                    SizedBox(height: 2),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Note : ' + noteDetails.noteDetail,
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                  ]),

                                  trailing: Column(children: <Widget>[
                                    Expanded(
                                        child: IconButton(
                                      icon: const Icon(Icons.create),
                                      tooltip: 'Update Class',
                                      onPressed: () {
                                        print("Sent " + noteDetails.noteDetail);
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        tutorNoteUpdate(
                                                            noteDetails.id!,
                                                            noteDetails
                                                                .noteDetail,
                                                            index)),
                                                (route) => false);
                                      },
                                      color: Color.fromARGB(255, 0, 68, 255),
                                    )),
                                    Expanded(
                                        child: IconButton(
                                      icon: const Icon(Icons.delete),
                                      tooltip: 'Delete Class',
                                      onPressed: () async {
                                        // print(noteDetails.id);
                                        model.delete(noteDetails.id!);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text('Note Deleted.'),
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
                                      color: Color.fromARGB(255, 255, 8, 8),
                                    )),
                                  ]),
                                  // elevation: 50,
                                ),
                              );
                            }))
                  ],
                )),
              ),
            ));
  }
}
