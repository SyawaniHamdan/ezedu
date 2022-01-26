
import 'dart:io';

import 'package:ezedu/app/locator.dart';
import 'package:ezedu/screens/tutor/login/widgets/login_mvvm_view.dart';
import 'package:ezedu/services/authentication_service.dart';
import 'package:ezedu/services/tutor_profile.dart';
import 'package:flutter/material.dart';
import 'package:ezedu/screens/viewmodel.dart';

class TutorProfileViewModel extends ViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final TutorProfileService _profileService = locator<TutorProfileService>();

  void updateProfile({
    String name = '',
    String phone = ''
  }) async {
    setBusy(true);

  }


  void signOut(context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => TutorLoginView()),
        (route) => false);
  }
}