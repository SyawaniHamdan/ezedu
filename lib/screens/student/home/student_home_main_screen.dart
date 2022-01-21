
import 'package:ezedu/screens/student/home/student_home_body.dart';
import 'package:flutter/material.dart';

class StudentHomeMainScreen extends StatelessWidget {
  const StudentHomeMainScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  StudentHomeBody(),
    );
  }
}
