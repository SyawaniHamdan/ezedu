import 'package:ezedu/screens/shared/toastAndDialog.dart';
import 'package:ezedu/screens/tutor/register/widgets/tutor_register_view.dart';
import 'package:ezedu/screens/tutor/menu/tutor_menu.dart';
import 'package:ezedu/screens/viewmodel.dart';
import 'package:ezedu/app/locator.dart';
import 'package:ezedu/services/authentication_service.dart';
import 'package:flutter/material.dart';

class TutorLoginViewModel extends ViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  Future login({
    String email = '',
    String password = '',
    context,
  }) async {
    setBusy(true);

    var result = await _authenticationService.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    setBusy(false);

    if (result is String) {
      print("Login Failed!");
      awesomeSingleDialog(context, 'Alert!', result,
          () => Navigator.of(context, rootNavigator: true).pop());
    } else {
      if (result != null) {
        await Future.delayed(const Duration(seconds: 1));
        print("Login Success!");
        await Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => tutorMainMenu(0)));
      } else {
        print("Login Failed!");
        awesomeSingleDialog(
            context,
            'Alert!',
            'General sign-in failure. Please try again later',
            () => Navigator.of(context, rootNavigator: true).pop());
      }
    }
  }

  void navigateToRegister(context) {
    Navigator.of(context, rootNavigator: true).pushReplacement(
        MaterialPageRoute(builder: (context) => TutorRegistration()));
  }
}
