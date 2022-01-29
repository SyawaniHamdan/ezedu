import 'dart:io';

import 'package:ezedu/models/student.dart';
import 'package:ezedu/screens/student/login/students/student_login_view.dart';
import 'package:ezedu/services/students/student_authentication_service.dart';
import 'package:ezedu/services/students/student_service.dart';
import 'package:flutter/material.dart';
import 'package:ezedu/app/locator.dart';
import 'package:ezedu/screens/viewmodel.dart';

class StudentProfileViewModel extends ViewModel {
  final StudentAuthenticationService _studentauthenticationService =
      locator<StudentAuthenticationService>();
  final StudentService _studentService = locator<StudentService>();

  void updateStudent(
      {String? id = '',
      String name = '',
      String phone = '',
      String address = '',
      String level = '',
      String gender = ''}) async {
    setBusy(true);

    Student student = Student(
        id: id,
        name: name,
        phone: phone,
        address: address,
        level: level,
        gender: gender
      );

    await _studentService.updateStudent(student);

    currentStudent.name = name;
    currentStudent.phone = phone;
    currentStudent.address = address;
    currentStudent.level = level;
    currentStudent.gender = gender;

    setBusy(false);
  }

  void signOut(context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => StudentLoginView()),
        (route) => false);
  }
}
