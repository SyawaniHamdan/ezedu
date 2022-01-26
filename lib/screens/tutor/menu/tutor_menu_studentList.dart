import 'package:flutter/material.dart';

import '../../../data/classes/student.dart';

class tutorStudentList extends StatelessWidget {
  tutorStudentList({required this.data});
  final List<Student> data;

  static const primaryColor = Color.fromARGB(255, 202, 201, 201);
  double padding = 10;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.lightBlue[50],
            body: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(padding),
                    child: Text(
                      "Student List",
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                Expanded(
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Container(
                        //height: 50,
                        width: MediaQuery.of(context).size.width - 100,
                        padding: EdgeInsets.only(left: padding, right: padding),
                        child: Card(
                          child: ListTile(
                            title: Text(data[index].name),
                            onTap: () {
                              // print(days[index]);
                            },
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
            )));
  }
}
