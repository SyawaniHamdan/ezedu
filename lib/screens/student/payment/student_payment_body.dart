// ignore_for_file: deprecated_member_use

import 'package:ezedu/models/studentsubject.dart';
import 'package:ezedu/models/subject.dart';
import 'package:ezedu/models/tutor.dart';
import 'package:ezedu/screens/student/payment/student_payment_viewmodel.dart';
import 'package:ezedu/screens/student/tab/student_tab.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

class StudentPaymentBody extends StatefulWidget {
  @override
  State<StudentPaymentBody> createState() => _StudentPaymentBody();
}

class _StudentPaymentBody extends State<StudentPaymentBody> {
  double padding = 10;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StudentPaymentViewModel>.reactive(
        disposeViewModel: false,
        viewModelBuilder: () => StudentPaymentViewModel(),
        onModelReady: (model) => model.initialise(),
        builder: (context, model, child) => model.isBusy
            ? const Center(child: CircularProgressIndicator())
            : model.empty
                ? Column(
                    children: const [
                      Expanded(
                          child: Center(child: Text('No Subject Need To Pay'))),
                    ],
                  )
                : Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Total Outstanding\nRM " +
                                model.totalBills.toStringAsFixed(2),
                            style: const TextStyle(
                                color: Colors.red,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                                left: 0, top: 100, right: 0, bottom: 100),
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
                              Tutor tutor = model.getTutor(subject.tutorId);
                              String buttonTxt = model
                                  .getPaymentSubject(subject.id!)
                                  .toUpperCase();

                              String cdate = DateFormat("dd-MM-yyyy")
                                  .format(DateTime.now());

                              Color primaryColor = Colors.blue;

                              if (buttonTxt == "COMPLETE") {
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
                                        Text(tutor.name),
                                        Text(subject.subjectDate),
                                        Text(subject
                                            .subjectSlot), // tutor and subject takda connection lagi
                                        Text(
                                          "\nOutstanding: RM" +
                                              subject.subjectPrice
                                                  .toStringAsFixed(2),
                                          style: const TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: primaryColor),
                                            onPressed: () async {
                                              if (buttonTxt == "APPROVE") {
                                                model.studentPayment(
                                                    id: studentSubject.id!,
                                                    status: "complete",
                                                    date: cdate,
                                                    price:
                                                        subject.subjectPrice);

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
                                              return showDialog(
                                                  context: context,
                                                  builder: (ctx) => AlertDialog(
                                                        title: const Text(
                                                            "Alert!"),
                                                        content: const Text(
                                                            "Payment successful!"),
                                                        actions: <Widget>[
                                                          FlatButton(
                                                            onPressed: () {
                                                              Navigator.of(ctx)
                                                                  .pop();
                                                            },
                                                            child: const Text(
                                                                "Ok"),
                                                          ),
                                                        ],
                                                      ));
                                            },
                                            child: const Text("PAY"))
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ));
  }
}
