import 'package:ezedu/models/subject.dart';
import 'package:ezedu/models/tutor.dart';
import 'package:ezedu/screens/student/home/student_home_viewmodel.dart';
import 'package:ezedu/screens/student/tab/student_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:stacked/stacked.dart';

class StudentHomeBody extends StatefulWidget {
  const StudentHomeBody({Key? key}) : super(key: key);

  @override
  State<StudentHomeBody> createState() => _StudentHomeBody();
}

class _StudentHomeBody extends State<StudentHomeBody> {
  // final subject = ['Science', 'Physics', 'English'];
  // final tutor = ['Joseph Ng', 'Azalina Harun', 'Priyanka Chopra'];
  // final rating = [4.2, 4.3, 3.5];
  // final location = [
  //   'Johor Bahru, Johor',
  //   'Pasir Mas, Kelantan',
  //   'Subang Jaya, Selangor'
  // ];

  double padding = 10;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StudentHomeViewModel>.reactive(
        disposeViewModel: false,
        viewModelBuilder: () => StudentHomeViewModel(),
        onModelReady: (model) => model.initialise(),
        builder: (context, model, child) => model.isBusy
                    ? const Center(child: CircularProgressIndicator())
                    : model.empty
                        ? Column(
                            children: const [
                              Expanded(
                                  child: Center(
                                      child: Text(
                                          'No Subject Offered To Student'))),
                            ],
                          )
                        : Scaffold(
                //appbar
                backgroundColor: Colors.lightBlue[50],
                body: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.all(padding),
                        child: const Text(
                          "Class List",
                          style: TextStyle(
                              fontSize: 21, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: model.subjectList.length,
                          itemBuilder: (context, index) {
                            Subject subject = model.subjectList[index];
                            Tutor tutor = model.getTutor(subject.tutorId);
                            String buttonTxt = model
                                .getStudentSubject(subject.id!)
                                .toUpperCase();

                            Color primaryColor = Colors.blue;

                            if (buttonTxt == "PENDING") {
                              primaryColor = Colors.orange;
                            } else if (buttonTxt == "APPROVE") {
                              primaryColor = Colors.yellow;
                            } else if (buttonTxt == "DECLINE") {
                              primaryColor = Colors.red;
                            } else if (buttonTxt == "COMPLETE") {
                              primaryColor = Colors.green;
                            }

                            return Container(
                              //height: 50,
                              width: MediaQuery.of(context).size.width - 100,
                              padding: EdgeInsets.only(
                                  left: padding, right: padding),
                              child: Card(
                                child: ListTile(
                                  title: Text(subject.subjectName),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(subject.subjectDate),
                                      Text(subject.subjectSlot),
                                      Text("RM " + subject.subjectPrice.toString()),
                                      Text(tutor.name),
                                      // RatingBar.builder(
                                      //   initialRating: rating[index],
                                      //   minRating: 0,
                                      //   direction: Axis.horizontal,
                                      //   allowHalfRating: true,
                                      //   itemCount: 5,
                                      //   itemSize: 20.0,
                                      //   itemPadding: const EdgeInsets.symmetric(
                                      //       horizontal: 1.0),
                                      //   itemBuilder: (context, _) => const Icon(
                                      //     Icons.star,
                                      //     color: Colors.amber,
                                      //   ),
                                      //   onRatingUpdate: (rating) {
                                      //     print(rating);
                                      //   },
                                      // ),
                                      Text(tutor.phone),
                                      Text(tutor.qualification),
                                      //Text(subtitle[index]),
                                    ],
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              primary: primaryColor),
                                          onPressed: () async {
                                            if (buttonTxt == "HIRE NOW") {
                                              model.createStudentSubject(
                                                studentId:
                                                    model.currentStudent.id!,
                                                subjectId: subject.id!,
                                              );

                                              await Future.delayed(
                                                  const Duration(seconds: 1));

                                              Navigator.of(context,
                                                      rootNavigator: true)
                                                  .pushAndRemoveUntil(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              StudentTab()),
                                                      (route) => false);
                                            }
                                          },
                                          child: Text(buttonTxt))
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ));
  }
}
