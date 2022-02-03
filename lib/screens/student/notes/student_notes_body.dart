import 'package:ezedu/models/note.dart';
import 'package:ezedu/models/studentsubject.dart';
import 'package:ezedu/models/subject.dart';
import 'package:ezedu/models/tutor.dart';
import 'package:ezedu/screens/student/notes/student_notes_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class StudentNotesBody extends StatefulWidget {
  const StudentNotesBody({Key? key}) : super(key: key);

  @override
  State<StudentNotesBody> createState() => _StudentNotesBody();
}

class _StudentNotesBody extends State<StudentNotesBody> {
  // mock data
  final subject = ['Science', 'Additional Mathematics', 'Biology'];
  final tutor = ['Lisa Manoban', 'Jennie Jane', 'Rose Khan'];

  double padding = 10;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StudentNotesViewModel>.reactive(
      disposeViewModel: false,
      viewModelBuilder: () => StudentNotesViewModel(),
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) => model.isBusy
                    ? const Center(child: CircularProgressIndicator())
                    : model.empty
                        ? Column(
                            children: const [
                              Expanded(
                                  child: Center(
                                      child: Text(
                                          'No Notes For Student'))),
                            ],
                          )
                        : Column(
              children: [
                //Card()
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(padding),
                    child: const Text(
                      "Lecture Notes",
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                    child: Card(
                  child: ListView.builder(
                      itemCount: model.studentsubjectList.length,
                      itemBuilder: (context, index) {
                        StudentSubject studentSubject =
                            model.studentsubjectList[index];
                        Subject subject =
                            model.getSubject(studentSubject.subjectId);
                        Tutor tutor = model.getTutor(subject.tutorId);
                        Notes notes = model.notesList[index];
                        return Container(
                            width: MediaQuery.of(context).size.width - 100,
                            padding:
                                EdgeInsets.only(left: padding, right: padding),
                            child: Column(
                              children: <Widget>[
                                ExpansionTile(
                                  backgroundColor: Colors.white,
                                  title: Text(subject.subjectName),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [ 
                                      Text(tutor.name),
                                      Text(subject.subjectDate),
                                    ],
                                  ),   
                                  children: [
                                    ListTile(
                                      title: Text(notes.noteDetail),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [ 
                                          Text(subject.subjectSlot),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ));
                      }),
                )),
              ],
            ),
    );
  }
}
