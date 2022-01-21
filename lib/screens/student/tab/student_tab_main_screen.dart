
import 'package:ezedu/screens/student/home/student_home_main_screen.dart';
import 'package:ezedu/screens/student/tab/student_tab.dart';
import 'package:flutter/material.dart';

class StudentTabMainScreen extends StatelessWidget {
  const StudentTabMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: StudentTab(),
      ),
      body: StudentHomeMainScreen(),
    );
  }
}
