import 'package:ezedu/models/studentsubject.dart';
import 'package:ezedu/screens/tutor/menu/tutor_menu.dart';
import 'package:ezedu/screens/tutor/menu/viewmodels/tutor_viewmodel_studentList.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class tutorStudentList extends StatefulWidget {
  const tutorStudentList({this.subjectId});
  final String? subjectId;

  @override
  State<tutorStudentList> createState() => _tutorStudentList();
}

class _tutorStudentList extends State<tutorStudentList> {
  static const primaryColor = Color.fromARGB(255, 202, 201, 201);
  double padding = 10;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TutorStudentListViewModel>.reactive(
        disposeViewModel: false,
        viewModelBuilder: () => TutorStudentListViewModel(),
        onModelReady: (model) => model.initialise(widget.subjectId!),
        builder: (context, model, child) => model.isBusy
            ? Center(child: CircularProgressIndicator())
            : MaterialApp(
                debugShowCheckedModeBanner: false,
                home: Scaffold(
                    backgroundColor: Colors.lightBlue[50],
                    body: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.all(padding),
                            child: const Text(
                              "Student List",
                              style: TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: model.studentsubjectList.length,
                            itemBuilder: (context, index) {
                              StudentSubject studentSubject =
                                  model.studentsubjectList[index];

                              Color myColor = Colors.blue;

                              if (studentSubject.status.toUpperCase() ==
                                  "PENDING") {
                                myColor = Colors.orange;
                              } else if (studentSubject.status.toUpperCase() ==
                                  "APPROVE") {
                                myColor = Colors.yellow;
                              } else if (studentSubject.status.toUpperCase() ==
                                  "DECLINE") {
                                myColor = Colors.red;
                              } else if (studentSubject.status.toUpperCase() ==
                                  "COMPLETE") {
                                myColor = Colors.green;
                              }

                              return Container(
                                //height: 50,
                                width: MediaQuery.of(context).size.width - 100,
                                padding: EdgeInsets.only(
                                    left: padding, right: padding),
                                child: Card(
                                  child: ListTile(
                                    title: Text(model
                                        .getStudent(studentSubject.studentId)
                                        .name),
                                    trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: (studentSubject.status
                                                    .toUpperCase() ==
                                                "PENDING")
                                            ? [
                                                ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            primary:
                                                                Colors.green),
                                                    onPressed: () async {
                                                      model.studentApproval(
                                                        id: studentSubject.id!,
                                                        status: "approve",
                                                      );

                                                      await Future.delayed(
                                                          Duration(seconds: 1));

                                                      Navigator.of(context,
                                                              rootNavigator:
                                                                  true)
                                                          .pushAndRemoveUntil(
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          tutorMainMenu()),
                                                              (route) => false);
                                                    },
                                                    child: Icon(Icons.check)),
                                                const SizedBox(
                                                  width: 10.0,
                                                ),
                                                ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            primary:
                                                                Colors.red),
                                                    onPressed: () async {
                                                      model.studentApproval(
                                                        id: studentSubject.id!,
                                                        status: "decline",
                                                      );

                                                      await Future.delayed(
                                                          Duration(seconds: 1));

                                                      Navigator.of(context,
                                                              rootNavigator:
                                                                  true)
                                                          .pushAndRemoveUntil(
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          tutorMainMenu()),
                                                              (route) => false);
                                                    },
                                                    child: Icon(
                                                        Icons.not_interested))
                                              ]
                                            : [
                                                ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            primary: myColor),
                                                    onPressed: () async {},
                                                    child: Text(studentSubject
                                                        .status
                                                        .toUpperCase()))
                                              ]),
                                  ),
                                ),
                              );
                            },
                            /* FOR MAKING LINE BETWEEN LIST 
                       separatorBuilder: (context, index) {
                        return Divider();
                         },
                     */
                          ),
                        ),

                        //FOR MAKING LINE BETWEEN LIST return ListView.separated(
                      ],
                    ))));
  }
}
