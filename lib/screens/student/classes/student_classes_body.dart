import 'package:ezedu/models/studentsubject.dart';
import 'package:ezedu/models/subject.dart';
import 'package:ezedu/screens/student/classes/student_classes_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:stacked/stacked.dart';

class StudentClassesBody extends StatefulWidget {
  @override
  State<StudentClassesBody> createState() => _StudentClassesBody();
}

class _StudentClassesBody extends State<StudentClassesBody> {
  // mock data
  final subject = ['Mathematics', 'Additional Mathematics', 'Biology'];
  final tutor = ['Lisa Manoban', 'Jennie Jane', 'Rose Khan'];
  final rating = [4.0, 4.5, 5.0];
  final location = [
    'Johor Bahru, Johor',
    'Pasir Mas, Kelantan',
    'Subang Jaya, Selangor'
  ];

  double padding = 10;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StudentClassesViewModel>.reactive(
        disposeViewModel: false,
        viewModelBuilder: () => StudentClassesViewModel(),
        builder: (context, model, child) => Scaffold(
            backgroundColor: Colors.lightBlue[50],
            body: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(padding),
                    child: const Text(
                      "Class Enrolled",
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                            "+ Enroll")), // button direct to UF002-11
                    const Padding(
                      padding: EdgeInsets.only(
                          left: 0, top: 50, right: 30, bottom: 10),
                    )
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: model.studentsubjectList.length,
                      itemBuilder: (context, index) {
                        StudentSubject studentSubject =
                            model.studentsubjectList[index];
                        Subject subject =
                            model.getSubject(studentSubject.subjectId);

                        return Container(
                          //height: 50,
                          width: MediaQuery.of(context).size.width - 100,
                          padding:
                              EdgeInsets.only(left: padding, right: padding),
                          child: Card(
                            child: ListTile(
                              title: Text(model.studentsubjectList),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('KIV'), // starting here belum siapp
                                  RatingBar.builder(
                                    initialRating: rating[index],
                                    minRating: 0,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 20.0,
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 1.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {},
                                  ),
                                  Text(location[index]),
                                  //Text(subtitle[index]),
                                ],
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {},
                                      child: const Text("Rate"))
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            )));
  }
}
