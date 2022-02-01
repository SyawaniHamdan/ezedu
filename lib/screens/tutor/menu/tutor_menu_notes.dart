import 'package:ezedu/models/note.dart';
import 'package:ezedu/models/subject.dart';
import 'package:ezedu/screens/tutor/menu/viewmodels/tutor_viewmodel_notes.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class tutorNote extends StatefulWidget {
  @override
  State<tutorNote> createState() => _tutorNote();
}

class _tutorNote extends State<tutorNote> {
  bool _customTileExpanded = false;
  double padding = 5;
  String selectedSubject = "Choose";
  final List<String> subject = [
    'Biology',
    'Biology',
    'Biology',
    'Chemistry',
    'Biology',
    'Chemistry',
    'Chemistry'
  ];
  final List<String> note = [
    'Biology',
    'Biology',
    'Biology',
    'Chemistry',
    'Biology',
    'Chemistry',
    'Chemistry'
  ];
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TutorNotesViewModel>.reactive(
        disposeViewModel: false,
        viewModelBuilder: () => TutorNotesViewModel(),
        onModelReady: (model) {
          model.initialise();
          // print(notes.noteDetail);
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
                        shrinkWrap: true,
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
                                            value: selectedSubject,
                                            underline: Container(
                                              height: 2,
                                              color: Color.fromARGB(
                                                  255, 202, 202, 204),
                                            ),
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                selectedSubject = newValue!;
                                              });
                                            },
                                            items: <String>[
                                              'Choose',
                                              '1 (8.00am - 9.50am)',
                                              '2 (10.00am - 11.50am)',
                                              '3 (12.00am - 1.50am)',
                                              '4 (2.00am - 3.50am)',
                                              '5 (3.00am - 4.50am)'
                                            ].map<DropdownMenuItem<String>>(
                                                (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
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

                                      const TextField(
                                        keyboardType: TextInputType.multiline,
                                        maxLines: null,
                                        minLines: 4,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Add new note..',
                                        ),
                                      ),
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
                                          const Expanded(
                                            child: Text(''),
                                          ),
                                          ElevatedButton(
                                              onPressed: () {},
                                              child: const Text("Send")),
                                          SizedBox(width: 10),
                                        ],
                                      ),

                                      SizedBox(height: 20),

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

                                  trailing: IconButton(
                                    icon: const Icon(Icons.delete),
                                    tooltip: 'Delete Class',
                                    onPressed: () {},
                                    color: Color.fromARGB(255, 255, 8, 8),
                                  ),
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
