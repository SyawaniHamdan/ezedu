import 'package:ezedu/services/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:ezedu/screens/viewmodel.dart';
import 'package:ezedu/app/locator.dart';

class TutorRegisterViewModel extends ViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  Future signUp({
    String name = "",
    String email = "",
    String password = "",
    String phone = "",
    String gender = "",
    String address = "",
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
      type: type,
    );

    setBusy(false);

    if (result is String) {
      print("Register Failed!");
    } else {
      if (result != null) {
        await Future.delayed(Duration(seconds: 1));
        print("Register Success!");
      } else {
        print("Register Failed!");
      }
    }
  }
}
