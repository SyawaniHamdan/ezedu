import 'dart:io';
import 'package:ezedu/app/locator.dart';
import 'package:ezedu/models/tutor.dart';
import 'package:ezedu/screens/home/main/widgets/home_main_screen.dart';
import 'package:ezedu/screens/tutor/login/widgets/login_mvvm_view.dart';
import 'package:ezedu/screens/viewmodel.dart';
import 'package:ezedu/services/tutor_service.dart';
import 'package:flutter/material.dart';

class TutorMenuViewModel extends ViewModel {
  final TutorService _tutorService = locator<TutorService>();

  Future<Tutor> getTutor({String? id = ""}) async {
    setBusy(true);

    Tutor tutor = await _tutorService.getTutor(id: id);

    setBusy(false);

    return tutor;
  }

  void signOut(context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomeMainScreen()),
        (route) => false);
  }
}
