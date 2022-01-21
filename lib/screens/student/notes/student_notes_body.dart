import 'package:ezedu/screens/student/chat/student_chat_Viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class StudentNotesBody extends StatefulWidget {
  const StudentNotesBody({Key? key}) : super(key: key);

  @override
  State<StudentNotesBody> createState() => _StudentNotesBody();
}

class _StudentNotesBody extends State<StudentNotesBody> {

  // mock data
  final subject = ['Mathematics', 'Additional Mathematics', 'Biology'];
  final tutor = ['Lisa Manoban', 'Jennie Jane', 'Rose Khan'];

  double padding = 10;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        disposeViewModel: false,
        viewModelBuilder: () => StudentChatViewModel(),
        builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.lightBlue[50],
          body: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                      padding: EdgeInsets.all(padding),
                      child: const Text("Lecture Notes",
                        style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                      ),
                    ),
              ),
              Expanded(
                  child: ListView.builder(  
                      itemCount: tutor.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Column(
                          children: <Widget>[
                            ExpansionTile(
                              backgroundColor: Colors.white,
                              title: Text(tutor[index]),
                              subtitle: Text(subject[index]),
                              children: const [
                                ListTile(title: Text("Notes Example"),)
                              ],)
                          ],
                        )
                        );
                      })),
            ],
          ),
        ));
  }
}
