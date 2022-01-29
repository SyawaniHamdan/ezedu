import 'dart:io';
import 'package:ezedu/app/locator.dart';
import 'package:ezedu/models/tutor.dart';
import 'package:ezedu/screens/viewmodel.dart';
import 'package:ezedu/services/tutor_service.dart';

class TutorMenuViewModel extends ViewModel {
  final TutorService _tutorService = locator<TutorService>();

  Future<Tutor> getTutor({String? id = ""}) async {
    setBusy(true);

    Tutor tutor = await _tutorService.getTutor(id: id);

    setBusy(false);

    return tutor;
  }
}
