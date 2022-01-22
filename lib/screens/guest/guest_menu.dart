import 'package:ezedu/screens/student/chat/student_chat_main_screen.dart';
import 'package:ezedu/screens/student/classes/student_classes_main_screen.dart';
import 'package:ezedu/screens/student/home/student_home_main_screen.dart';
import 'package:ezedu/screens/student/notes/student_notes_main_screen.dart';
import 'package:ezedu/screens/student/payment/student_payment_main_screen.dart';
import 'package:ezedu/screens/student/tab/student_tab_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'guest_menu_list.dart';

class GuestMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GuestMain();
}

class _GuestMain extends State<GuestMain> {
  static const rightColor = Color(0xFF7f53ac);
  static const leftColor = Color(0xFF647dee);
  static const secondaryColor =
      Color.fromARGB(255, 238, 255, 0); //INDICATOR COLOR

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
                      title: Row(children: const <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                          ),
                          child: Text('Welcome, Guest'),
                        ),
                      ]),
                      actions: <Widget>[
                        IconButton(
                          icon: const Icon(
                            Icons.logout,
                            color: Colors.white,
                          ),
                          onPressed: () => Navigator.pop(context),
                        )
                      ],
                      flexibleSpace: Container(
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [rightColor, leftColor])),
                      ),
                    ),
                    backgroundColor: Color.fromARGB(255, 238, 238, 238),
                    body: const GuestList(),
                  ),
                ),
              ),
            ));
  }
  //Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
