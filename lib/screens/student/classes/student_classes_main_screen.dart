
import 'package:ezedu/screens/student/classes/student_classes_body.dart';
import 'package:flutter/material.dart';

class StudentClassesMainScreen extends StatelessWidget{
  const StudentClassesMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StudentClassesBody(),
    );
  }
}