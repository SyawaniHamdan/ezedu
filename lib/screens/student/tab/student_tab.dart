import 'package:ezedu/models/student.dart';
import 'package:ezedu/screens/student/home/student_home_main_screen.dart';
import 'package:ezedu/screens/student/notes/student_notes_main_screen.dart';
import 'package:ezedu/screens/student/payment/student_payment_main_screen.dart';
import 'package:ezedu/screens/student/profile/student_profile_view.dart';
import 'package:ezedu/screens/student/tab/student_tab_viewmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ezedu/screens/shared/toast.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class StudentTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StudentTab();
}

class _StudentTab extends State<StudentTab> {
  static const rightColor = Color(0xFF7f53ac);
  static const leftColor = Color(0xFF647dee);
  static const secondaryColor =
      Color.fromARGB(255, 238, 255, 0); //INDICATOR COLOR

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StudentTabViewModel>.reactive(
      disposeViewModel: false,
      viewModelBuilder: () => StudentTabViewModel(),
      builder: (context, model, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 80,
              title: Row(children: <Widget>[
                GestureDetector(
                  onTap: () async {
                    Student student =
                        await model.getStudent(id: model.currentStudent.id);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            StudentProfileMainScreen(student: student),
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
                const Text("  "),
                Text(model.currentStudent.name),

                //STAR RATING FOR LECT
              ]),
              actions: <Widget>[
                IconButton(
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      try {
                        model.signOut(context);
                        myToast('Signed Out');
                        return await _auth.signOut();
                      } catch (e) {
                        print(e.toString());
                      }
                    }
                    //  Navigator.of(context).popUntil((route) { return route.isFirst; }),
                    )
              ],
              flexibleSpace: Container(
                decoration: const BoxDecoration(
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
                StudentPaymentMainScreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }
  //Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
