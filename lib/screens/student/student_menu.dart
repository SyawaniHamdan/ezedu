import 'package:ezedu/screens/student/student_bill.dart';
import 'package:ezedu/screens/student/student_chat.dart';
import 'package:ezedu/screens/student/student_enrolled.dart';
import 'package:ezedu/screens/student/student_notes.dart';
import 'package:ezedu/screens/student/student_home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const StudentMenu());
}

class StudentMenu extends StatelessWidget {
  const StudentMenu({Key? key}) : super(key: key);
  static const rightColor = Color(0xFF7f53ac);
  static const leftColor = Color(0xFF647dee);
  static const secondaryColor =
      Color.fromARGB(255, 238, 255, 0); //INDICATOR COLOR
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            title: Row(children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                      'https://i.pinimg.com/474x/76/94/84/769484dafbe89bf2b8a22379658956c4.jpg',
                      height: 50,
                      width: 50)),
              Padding(
                padding: EdgeInsets.only(
                  left: 20,
                ),
                child: Text('Ali Baba'),
              ),

              //STAR RATING FOR LECT
            ]),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [rightColor, leftColor])),
            ),
            bottom: const TabBar(
              indicatorColor: secondaryColor,
              tabs: [
                //FOR STUDENT

                Tab(icon: Icon(Icons.view_list)),
                Tab(icon: Icon(Icons.note)),
                Tab(icon: Icon(Icons.class_)),
                Tab(icon: Icon(Icons.chat)),
                Tab(icon: Icon(Icons.payments)),
              ],
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 238, 238, 238),
          body: TabBarView(
            children: [
              //CALL THE CALSS FROM ANOTHER SCRIPT TO DISPLAY STUFF
              StudentHome(), //refet to this script to edit
              StudentNote(),
              StudentEnrolled(),
              StudentChat(),
              StudentBill(),
            ],
          ),
        ),
      ),
    );
  }
}
