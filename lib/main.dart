
//import 'package:ez_edu/templates/templateMenu.dart';
import 'package:ezedu/screens/home/main/widgets/home_main_screen.dart';
import 'package:ezedu/screens/tutor/login/widgets/tutor_login_main_screen.dart';
import 'package:ezedu/screens/tutor/profile/widgets/tutor_profile_main_screen.dart';
import 'package:ezedu/templates/templateMenu.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const primaryColor = Color.fromARGB(255, 94, 255, 0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PROJECT',
      theme: ThemeData(
        primaryColor: primaryColor,
      ),

      home: HomeMainScreen(),

    );
  }
}
