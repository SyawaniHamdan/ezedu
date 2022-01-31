import 'package:ezedu/models/student.dart';
import 'package:ezedu/models/studentsubject.dart';
import 'package:ezedu/models/subject.dart';
import 'package:ezedu/screens/tutor/payment/tutor_payment_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class TutorPaymentBody extends StatefulWidget {
  @override
  State<TutorPaymentBody> createState() => _TutorPaymentBody();
}

class _TutorPaymentBody extends State<TutorPaymentBody> {
  double padding = 10;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TutorPaymentViewModel>.reactive(
        disposeViewModel: false,
        viewModelBuilder: () => TutorPaymentViewModel(),
        onModelReady: (model) => model.initialise(),
        builder: (context, model, child) => model.isBusy
            ? Center(child: CircularProgressIndicator()) //loading
            : Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Total Earning\nRM " +
                            model.totalBills.toStringAsFixed(2),
                        style: const TextStyle(
                            color: Colors.green,
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
                  const SizedBox(height: 10.0),
                  const Padding(
                      padding: EdgeInsets.only(right: 210),
                      child: Text('Latest Transaction',
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w800))),
                  const SizedBox(height: 10.0),
                  Expanded(
                    child: ListView.builder(
                        itemCount: model.studentsubjectList.length,
                        itemBuilder: (context, index) {
                          StudentSubject studentSubject =
                              model.studentsubjectList[index];

                          Student student =
                              model.getStudent(studentSubject.studentId);
                          Subject subject =
                              model.getSubject(studentSubject.subjectId);

                          return Container(
                              //height: 50,
                              width: MediaQuery.of(context).size.width - 100,
                              padding: EdgeInsets.only(
                                  left: padding, right: padding),
                              child: Card(
                                  child: Row(children: [
                                Container(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50.0),
                                    child: Image.network(
                                        'https://i.pinimg.com/474x/76/94/84/769484dafbe89bf2b8a22379658956c4.jpg',
                                        // width: 300,
                                        height: 50,
                                        fit: BoxFit.fill),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: Text(student.name),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(studentSubject.date),
                                        Text(
                                          "Payment: RM" +
                                              studentSubject.price
                                                  .toStringAsFixed(2),
                                          style: const TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(subject.subjectName),
                                      ],
                                    ),
                                  ),
                                ),
                                
                              ])));
                        }),
                  ),
                ],
              ));
  }
}
