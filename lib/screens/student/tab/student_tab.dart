import 'package:ezedu/screens/student/chat/student_chat_main_screen.dart';
import 'package:ezedu/screens/student/classes/student_classes_main_screen.dart';
import 'package:ezedu/screens/student/home/student_home_main_screen.dart';
import 'package:ezedu/screens/student/notes/student_notes_main_screen.dart';
import 'package:ezedu/screens/student/payment/student_payment_main_screen.dart';
import 'package:ezedu/screens/student/tab/student_tab_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class StudentTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StudentTab();
}

class _StudentTab extends State<StudentTab> {
  static const primaryColor =
      Color.fromARGB(255, 28, 100, 196); //BACKGROUNDCOLOR
  static const secondaryColor =
      Color.fromARGB(255, 255, 0, 0); //INDICATOR COLOR

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StudentTabViewModel>.reactive(
        disposeViewModel: false,
        viewModelBuilder: () => StudentTabViewModel(),
        builder: (context, model, child) => Scaffold(
          body: MaterialApp(
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
                    const Padding(padding:
                        EdgeInsets.only(left: 20,),
                        child: Text('Ali Baba'),
                        ),

                    //STAR RATING FOR LECT
                  ]),
                  backgroundColor: primaryColor,
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
                body: const TabBarView(
                  children: [
                    //CALL THE CALSS FROM ANOTHER SCRIPT TO DISPLAY STUFF
                    StudentHomeMainScreen(), //refet to this script to edit
                    StudentNotesMainScreen(),
                    StudentClassesMainScreen(),
                    StudentChatMainScreen(),
                    StudentPaymentMainScreen(),
                  ],
                ),
              ),
            ),
          ), 
        ));
  }
  //Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
