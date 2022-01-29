import 'package:ezedu/screens/shared/toastAndDialog.dart';
import 'package:ezedu/screens/student/login/students/student_login_view.dart';
import 'package:ezedu/screens/viewmodel.dart';
import 'package:ezedu/app/locator.dart';
import 'package:ezedu/services/students/student_authentication_service.dart';
import 'package:flutter/material.dart';

class StudentRegisterViewModel extends ViewModel {
  final StudentAuthenticationService _authenticationService =
      locator<StudentAuthenticationService>();

  Future signUp({
    String name = "",
    String email = "",
    String password = "",
    String phone = "",
    String gender = "",
    String address = "",
    String level = "",
    String type = "",
    context,
  }) async {
    setBusy(true);

    var result = await _authenticationService.registerWithEmailAndPassword(
      name: name,
      email: email,
      password: password,
      phone: phone,
      gender: gender,
      address: address,
      level: level,
      type: type,
    );

    setBusy(false);

    if (result is String) {
      print("Register Failed!");
        awesomeSingleDialog(context, 'Alert!', result,
          () => Navigator.of(context, rootNavigator: true).pop());
    } else {
      if (result != null) {
        await Future.delayed(const Duration(seconds: 1));
        await Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => StudentLoginView()));
        print("Register Success!");
      } else {
        print("Register Failed!");
      }
    }
  }
  void navigateToSignIn(context) {
    Navigator.of(context, rootNavigator: true).pushReplacement(
              MaterialPageRoute(builder: (context) => StudentLoginView()));
  }
}
