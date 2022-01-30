// ignore_for_file: prefer_const_constructors

import 'package:ezedu/screens/tutor/menu/tutor_menu.dart';
import 'package:ezedu/screens/tutor/menu/viewmodels/tutor_viewmodel_feed.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class tutorFeed extends StatefulWidget {
  @override
  State<tutorFeed> createState() => _tutorFeed();
}

class _tutorFeed extends State<tutorFeed> {
  bool _customTileExpanded = false;
  double padding = 5;
  String selectedSubject = "Choose", selectedSlot = "Choose", formatDate = " ";
  DateTime _dateTime = DateTime.now();
  var dateTemp;
  final List<String> subject = [
    'Biology',
    'Biology',
    'Biology',
    'Chemistry',
    'Biology',
    'Chemistry',
    'Chemistry'
  ];
  final List<String> description = [
    'Description',
    'Description',
    'Description',
    'Description',
    'Description',
    'Description',
    'Description',
    'Description'
  ];
  final List<String> slot = ['1', '2', '3', '4', '4', '1', '2', '3'];
  final List<int> priceClass = [20, 20, 20, 20, 20, 20, 20, 20];
  final List<String> date = [
    '4/12/2021',
    '11/12/2021',
    '18/12/2021',
    '1/1/2022',
    '8/1/2022',
    '15/1/2022',
    '22/1/2022',
    '29/1/2022'
  ];

  TextEditingController descController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TutorFeedViewModel>.reactive(
        disposeViewModel: false,
        viewModelBuilder: () => TutorFeedViewModel(),
        // onModelReady: (model) => model.initialise(),
        builder: (context, model, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.lightBlue[50],
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 20.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(padding),
                    child: const Text(
                      "Create Class",
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  child: ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(8.0),
                    children: <Widget>[
                      Card(
                          child: Container(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(children: <Widget>[
                                Row(children: <Widget>[
                                  SizedBox(
                                      width: 120.0,
                                      child: Text(
                                        'Subject',
                                        style: TextStyle(fontSize: 15),
                                      )),
                                  SizedBox(
                                      width: 220,
                                      child: DropdownButton<String>(
                                        value: selectedSubject,
                                        elevation: 16,
                                        underline: Container(
                                          height: 2,
                                          color: Color.fromARGB(
                                              255, 202, 202, 204),
                                        ),
                                        onChanged: (String? newValues) {
                                          setState(() {
                                            selectedSubject = newValues!;
                                          });
                                        },
                                        items: <String>[
                                          'Choose',
                                          'Mathematics',
                                          'Additional Mathematics',
                                          'Bahasa Malaysia',
                                          'English',
                                          'Biology',
                                          'Chemistry'
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      )),
                                ]),
                                Row(children: <Widget>[
                                  SizedBox(
                                      width: 120.0,
                                      child: Text(
                                        'Description',
                                        style: TextStyle(fontSize: 15),
                                      )),
                                  SizedBox(width: 220, child: TextFormField(
                                    controller: descController,
                                  )),
                                  /*
                                  Expanded(
                                      child: TextField(
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                    minLines: 2,
                                  )),
                                  */
                                ]),
                                Row(children: <Widget>[
                                  SizedBox(
                                      width: 120.0,
                                      child: Text(
                                        'Date',
                                        style: TextStyle(fontSize: 15),
                                      )),
                                  IconButton(
                                      icon: Icon(Icons.calendar_today),
                                      onPressed: () {
                                        showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(2021),
                                                lastDate: DateTime(2031))
                                            .then((date) {
                                          setState(() {
                                            _dateTime = date!;
                                            dateTemp = DateTime.parse(
                                                _dateTime.toString());
                                            formatDate =
                                                "${date.day}-${date.month}-${date.year}";
                                          });
                                        });
                                      }),
                                  SizedBox(
                                      width: 80,
                                      // ignore: unnecessary_null_comparison
                                      child: Text(_dateTime == null
                                          ? 'DD/MM/YYYY'
                                          : formatDate)),
                                ]),
                                Row(children: <Widget>[
                                  SizedBox(
                                      width: 120.0,
                                      child: Text(
                                        'Slot',
                                        style: TextStyle(fontSize: 15),
                                      )),
                                  SizedBox(
                                      width: 220,
                                      child: DropdownButton<String>(
                                        value: selectedSlot,
                                        underline: Container(
                                          height: 2,
                                          color: Color.fromARGB(
                                              255, 202, 202, 204),
                                        ),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            selectedSlot = newValue!;
                                          });
                                        },
                                        items: <String>[
                                          'Choose',
                                          '1 (8.00am - 9.50am)',
                                          '2 (10.00am - 11.50am)',
                                          '3 (12.00am - 1.50am)',
                                          '4 (2.00am - 3.50am)',
                                          '5 (3.00am - 4.50am)'
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      )),
                                ]),
                                Row(children: <Widget>[
                                  SizedBox(
                                      width: 120.0,
                                      child: Text(
                                        'Price',
                                        style: TextStyle(fontSize: 15),
                                        
                                      )),
                                      
                                  SizedBox(
                                      width: 220,
                                      child: TextFormField(
                                          controller: priceController,
                                          keyboardType: TextInputType.number,
                                          style:
                                              TextStyle(color: Colors.black))),
                                ]),
                                Container(
                                  height: 30.0,
                                ),
                              ])))
                    ],
                  ),
                ),
                 Container(
                          //height: 50,
                          padding: const EdgeInsets.only(bottom: 40),
                          child: ElevatedButton(
                              onPressed: () async {

                                double newPrice = 0.00;
                                if (priceController.text != '') {
                                  var price = double.parse(priceController.text);
                                  newPrice = price;
                                }
                                model.createSubject(
                                  subjectName: selectedSubject,
                                  subjectDesc: descController.text,
                                  subjectPrice: newPrice,
                                  subjectSlot: selectedSlot,
                                  tutorId: model.currentTutor.id
                                );

                                ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Success add $selectedSubject at $selectedSlot.'),
                                ),
                              );

                                await Future.delayed(Duration(seconds: 2));
                                
                                Navigator.of(context, rootNavigator: true)
                              .pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => tutorMainMenu()),
                                  (route) => false);
                              },
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              child: const Text(
                                'Add Subject',
                                style: TextStyle(
                                    fontSize: 14,
                                    letterSpacing: 2.2,
                                    color: Colors.black),
                              ))),
                Container(
                  height: 20.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: padding),
                    child: const Text(
                      "Sessions",
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(8.0),
                    //height: 1000,
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: subject.length,
                        itemBuilder: (BuildContext context, int index) => Card(
                              child: ListTile(
                                title: Column(children: <Widget>[
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(subject[index],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child:
                                        Text('Desc. : ' + description[index]),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Date   : ' + date[index]),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Slot    : ' + slot[index]),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Price  : RM' +
                                        priceClass[index].toString()),
                                  ),
                                ]),
                                onTap: () {
                                  // print(days[index]);
                                },
                                // elevation: 50,
                              ),
                            )))
              ],
            ),
          ),
        )));
  }
}
