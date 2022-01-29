import 'dart:io';

import 'package:ezedu/app/locator.dart';
import 'package:ezedu/models/tutor.dart';
import 'package:ezedu/services/authentication_service.dart';
import 'package:ezedu/services/tutor_service.dart';
import 'package:ezedu/screens/viewmodel.dart';

class TutorProfileViewModel extends ViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final TutorService _tutorService = locator<TutorService>();

  void updateTutor(
      {String? id = '',
      String name = '',
      String phone = '',
      String address = '',
      String qualification = '',
      String gender = '',
      String about = ''}) async {
    setBusy(true);

    Tutor tutor = Tutor(
        id: id,
        name: name,
        phone: phone,
        address: address,
        qualification: qualification,
        gender: gender,
        about: about);

    await _tutorService.updateTutor(tutor);

    currentTutor.name = name;
    currentTutor.phone = phone;
    currentTutor.address = address;
    currentTutor.qualification = qualification;
    currentTutor.gender = gender;
    currentTutor.about = about;

    setBusy(false);
  }
}
