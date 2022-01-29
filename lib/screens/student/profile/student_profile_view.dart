
import 'package:ezedu/models/student.dart';
import 'package:ezedu/screens/student/profile/student_profile_bar.dart';
import 'package:ezedu/screens/student/profile/student_profile_body.dart';
import 'package:flutter/material.dart';

class StudentProfileMainScreen extends StatelessWidget {
  StudentProfileMainScreen({this.student});
  Student? student;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StudentProfileBar(),
      body: StudentProfileBody(student: student),
    );
  }
}