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
  double padding = 10;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TutorStudentListViewModel>.reactive(
        disposeViewModel: false,
        viewModelBuilder: () => TutorStudentListViewModel(),
        onModelReady: (model) => model.initialise(widget.subjectId!),
        builder: (context, model, child) => model.isBusy
            ? const Center(child: CircularProgressIndicator())
            : MaterialApp(
                debugShowCheckedModeBanner: false,
                home: Scaffold(
                    backgroundColor: Colors.lightBlue[50],
                    appBar: AppBar(
                        backgroundColor: const Color(0xFF006064),
                        centerTitle: true,
                        title: const Text('Student List'),
                        leading: IconButton(
                          icon: const Icon(Icons.arrow_back_outlined),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const tutorMainMenu(),
                              ),
                            );
                          },
                        ),
                        flexibleSpace: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                Colors.purple.shade700,
                                Colors.deepPurple.shade700
                              ])),
                        )),
                    body: Column(
                      children: [
                        const SizedBox(height: 15),
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
                                        .name,
                                        style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.w600),),
                                        subtitle: Container(
                                              padding: const EdgeInsets.only(
                                                  top: 4.0, bottom: 4.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(model.getStudent(studentSubject.studentId).level,
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13.5,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  Text(
                                                    model.getStudent(studentSubject.studentId).phone,
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13.5,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  const SizedBox(height: 8.5),
                                                ],
                                              ),
                                            ),
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
                                                          const Duration(seconds: 1));

                                                      Navigator.of(context,
                                                              rootNavigator:
                                                                  true)
                                                          .pushAndRemoveUntil(
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          const tutorMainMenu()),
                                                              (route) => false);
                                                    },
                                                    child:const Icon(Icons.check)),
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
                                                          const Duration(seconds: 1));

                                                      Navigator.of(context,
                                                              rootNavigator:
                                                                  true)
                                                          .pushAndRemoveUntil(
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                        const tutorMainMenu()),
                                                              (route) => false);
                                                    },
                                                    child: const Icon(
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
