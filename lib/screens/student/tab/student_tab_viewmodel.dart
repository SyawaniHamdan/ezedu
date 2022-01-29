
import 'package:ezedu/app/locator.dart';
import 'package:ezedu/models/student.dart';
import 'package:ezedu/screens/student/login/students/student_login_view.dart';
import 'package:ezedu/screens/viewmodel.dart';
import 'package:ezedu/services/students/student_service.dart';
import 'package:flutter/material.dart';

class StudentTabViewModel extends ViewModel{
   final StudentService _studentService = locator<StudentService>();

  Future<Student> getStudent({String? id = ""}) async {
    setBusy(true);

    Student student = await _studentService.getStudent(id: id);

    setBusy(false);

    return student;
  }

  void signOut(context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => StudentLoginView()),
        (route) => false);
  }
}