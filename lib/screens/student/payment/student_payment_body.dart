import 'package:ezedu/screens/student/chat/student_chat_Viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class StudentPaymentBody extends StatefulWidget {
  @override
  State<StudentPaymentBody> createState() => _StudentPaymentBody();
}

class _StudentPaymentBody extends State<StudentPaymentBody> {
  // mock data
  final subject = ['Mathematics', 'Additional Mathematics', 'Biology'];
  final tutor = ['Lisa Manoban', 'Jennie Jane', 'Rose Khan'];
  final bill = [40.00, 40.00, 40.00];

  double padding = 10;
  double totalBills = 120.00;
  String header = "Total Outstanding \n RM ";

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        disposeViewModel: false,
        viewModelBuilder: () => StudentChatViewModel(),
        builder: (context, model, child) => Scaffold(
            backgroundColor: Colors.lightBlue[50],
            body: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Total Outstanding\nRM " + totalBills.toStringAsFixed(2),
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
                      itemCount: tutor.length,
                      itemBuilder: (context, index) {
                        return Container(
                          //height: 50,
                          width: MediaQuery.of(context).size.width - 100,
                          padding:
                              EdgeInsets.only(left: padding, right: padding),
                          child: Card(
                            child: ListTile(
                              title: Text(subject[index]),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(tutor[index]),
                                  Text(
                                    "\nOutstanding: RM" +
                                        bill[index].toStringAsFixed(2),
                                    style: const TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  ),
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
