import 'package:ezedu/screens/tutor/menu/tutor_menu_chatList.dart';
import 'package:ezedu/screens/tutor/menu/tutor_menu_feed.dart';
import 'package:ezedu/screens/tutor/menu/tutor_menu_notes.dart';
import 'package:ezedu/screens/tutor/menu/tutor_menu_studentList.dart';
import 'package:ezedu/templates/templateCallTabBody.dart';
import 'package:ezedu/templates/templateList.dart';
import 'package:flutter/material.dart';

import '../../../data/student_list.dart';

void main() {
  runApp(const tutorMainMenu());
}

class tutorMainMenu extends StatelessWidget {
  const tutorMainMenu({Key? key}) : super(key: key);

  // static const rightColor = Color(0xFF36d1dc);
  //static const leftColor = Color(0xFF5b86e5);
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
              Text("  "),
              Text("ALI BABA"),

              //STAR RATING FOR LECT
            ]),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.of(context).popUntil((route) {
                  return route.isFirst;
                }),
              )
            ],
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
                Tab(icon: Icon(Icons.dynamic_feed)),
                Tab(icon: Icon(Icons.note)),
                Tab(icon: Icon(Icons.wc)),
                Tab(icon: Icon(Icons.chat)),
                Tab(icon: Icon(Icons.payments)),
              ],
            ),
          ),
          backgroundColor: Color.fromARGB(255, 238, 238, 238),
          body: TabBarView(
            children: [
              tutorFeed(),
              tutorNote(),
              tutorStudentList(data: studentList),
              tutorChat(),
              const Text(
                'payment',
                style: TextStyle(fontSize: 21),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
