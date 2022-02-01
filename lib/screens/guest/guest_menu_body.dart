import 'package:ezedu/models/subject.dart';
import 'package:ezedu/models/tutor.dart';
import 'package:ezedu/screens/guest/guest_menu_viewmodel.dart';
import 'package:ezedu/screens/student/login/students/student_login_mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:stacked/stacked.dart';

class GuestMenuBody extends StatefulWidget {
  const GuestMenuBody({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GuestMenuBody();
}

class _GuestMenuBody extends State<GuestMenuBody> {
  double padding = 10;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GuestMenuViewModel>.reactive(
        disposeViewModel: false,
        viewModelBuilder: () => GuestMenuViewModel(),
        onModelReady: (model) => model.initialise(),
        builder: (context, model, child) => model.isBusy
            ? const Center(child: CircularProgressIndicator())
            : Scaffold(
                backgroundColor: Colors.lightBlue[50],
                body: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.all(padding),
                        child: const Text(
                          "Subject List Offered to Student",
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
                                        Text(tutor.name),
                                        Text(tutor.phone),
                                        Text(tutor.qualification),
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
                                                await Future.delayed(
                                                    const Duration(seconds: 1));
                                                Navigator.of(context,
                                                        rootNavigator: true)
                                                    .pushAndRemoveUntil(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                StudentLoginMainScreen()),
                                                        (route) => false);
                                              }
                                            },
                                            child: Text(buttonTxt))
                                      ],
                                    ),
                                  ),
                                ));
                          }),
                    ),
                  ],
                ),
              ));
  }
}
