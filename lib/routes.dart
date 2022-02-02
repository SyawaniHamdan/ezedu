import 'package:ezedu/screens/guest/guest_menu_mainscreen.dart';
import 'package:ezedu/screens/home/main/widgets/home_main_screen.dart';
import 'package:ezedu/screens/student/login/students/student_login_view.dart';
import 'package:ezedu/screens/student/tab/student_tab.dart';
import 'package:ezedu/screens/tutor/login/widgets/login_mvvm_view.dart';
import 'package:ezedu/screens/tutor/login/widgets/tutor_login_main_screen.dart';
import 'package:ezedu/screens/tutor/menu/tutor_menu.dart';
import 'package:ezedu/screens/tutor/menu/tutor_menui_noteUpdate.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic>? createRoute(settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => HomeMainScreen());

      //Navigation for TUTOR================================================================
      case '/tutor':
        return MaterialPageRoute(builder: (context) => TutorLoginMainScreen());
      case '/tutor_login':
        return MaterialPageRoute(builder: (context) => TutorLoginView());
      case '/tutor_home':
        return MaterialPageRoute(builder: (context) => const tutorMainMenu());

      //Navigation for STUDENTS==============================================================
      case '/student':
        return MaterialPageRoute(builder: (context) => StudentLoginView());
      case '/student_tab':
        return MaterialPageRoute(builder: (context) => StudentTab());
      //Navigation for GUEST================================================================
      case '/guest':
        return MaterialPageRoute(builder: (context) => GuestMainScreen());
    }
    return null;
  }

  static tudentLoginMainScreen() {}
}

/* to go to specific page, put Navigator.pushNamed(context, '/path_name'); in button
  to go back to previous page, put Navigator.pop(context); in  button 
  kalau nk popsampai 1st page gune,  Navigator.of(context).popUntil((route) {return route.isFirst; }),
 */