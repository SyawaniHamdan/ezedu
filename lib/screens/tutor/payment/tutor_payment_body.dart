import 'package:ezedu/screens/student/chat/student_chat_Viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class TutorPaymentBody extends StatefulWidget {
  @override
  State<TutorPaymentBody> createState() => _TutorPaymentBody();
}

class _TutorPaymentBody extends State<TutorPaymentBody> {
  // mock data
  final student = ['Minzy', 'CL', 'Sandra Park'];
  final datebill = ['2.10.2021', '5.11.2021', '29.11.2021'];
  final bill = [40.00, 40.00, 40.00];

  double padding = 10;
  double totalBills = 120.00;
  String header = "Total Earning \n RM ";

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
                      "Total Earning\nRM " + totalBills.toStringAsFixed(2),
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
                    padding: EdgeInsets.only(
                          right: 210),
                    child: Text('Latest Transaction',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w800))),
                const SizedBox(height: 10.0),
                Expanded(
                  child: ListView.builder(
                      itemCount: datebill.length,
                      itemBuilder: (context, index) {
                        return Container(
                            //height: 50,
                            width: MediaQuery.of(context).size.width - 100,
                            padding:
                                EdgeInsets.only(left: padding, right: padding),
                            child: Card(
                                child: Row(children: [
                              Container(
                                padding: EdgeInsets.only(left: 20),
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
                                  title: Text(student[index]),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(datebill[index]),
                                      Text(
                                        "Payment: RM" +
                                            bill[index].toStringAsFixed(2),
                                        style: const TextStyle(
                                            color: Colors.green,
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
                                          child: const Text("Invoice"))
                                    ],
                                  ),
                                ),
                              ),
                            ])));
                      }),
                ),
              ],
            )));
  }
}
