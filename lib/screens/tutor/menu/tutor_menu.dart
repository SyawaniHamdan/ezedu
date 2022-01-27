import 'package:ezedu/models/tutor.dart';
import 'package:ezedu/screens/tutor/menu/tutor_menu_chatList.dart';
import 'package:ezedu/screens/tutor/menu/tutor_menu_feed.dart';
import 'package:ezedu/screens/tutor/menu/tutor_menu_notes.dart';
import 'package:ezedu/screens/tutor/menu/tutor_menu_studentList.dart';
import 'package:ezedu/screens/tutor/menu/tutor_menu_viewmodel.dart';
import 'package:ezedu/screens/tutor/payment/tutor_payment_main_screen.dart';
import 'package:ezedu/screens/tutor/profile/widgets/tutor_profile_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../data/student_list.dart';

class tutorMainMenu extends StatefulWidget {
  const tutorMainMenu({Key? key}) : super(key: key);

  // static const rightColor = Color(0xFF36d1dc);
  //static const leftColor = Color(0xFF5b86e5);
  static const rightColor = Color(0xFF7f53ac);
  static const leftColor = Color(0xFF647dee);
  static const secondaryColor = Color.fromARGB(255, 238, 255, 0);
  @override
  State<tutorMainMenu> createState() => _tutorMainMenuState();
}

class _tutorMainMenuState extends State<tutorMainMenu> {
  //INDICATOR COLOR
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TutorMenuViewModel>.reactive(
        disposeViewModel: false,
        viewModelBuilder: () => TutorMenuViewModel(),
        // onModelReady: (model) => model.initialise(),
        builder: (context, model, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              home: DefaultTabController(
                length: 5,
                child: Scaffold(
                  appBar: AppBar(
                    toolbarHeight: 80,
                    title: Row(children: <Widget>[
                      GestureDetector(
                        onTap: () async {
                          Tutor tutor =
                              await model.getTutor(id: model.currentTutor.id);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  TutorProfileMainScreen(tutor: tutor),
                            ),
                          );
                        }, // Image tapped
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Image.network(
                              'https://i.pinimg.com/474x/76/94/84/769484dafbe89bf2b8a22379658956c4.jpg',
                              height: 50,
                              width: 50),
                        ),
                      ),
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
                        onPressed: () =>
                            Navigator.of(context).popUntil((route) {
                          return route.isFirst;
                        }),
                      )
                    ],
                    flexibleSpace: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                            tutorMainMenu.rightColor,
                            tutorMainMenu.leftColor
                          ])),
                    ),
                    bottom: const TabBar(
                      indicatorColor: tutorMainMenu.secondaryColor,
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
                      const TutorPaymentMainScreen(),
                    ],
                  ),
                ),
              ),
            ));
  }
}
