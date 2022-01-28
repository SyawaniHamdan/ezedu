import 'dart:io';
import 'package:ezedu/app/locator.dart';
import 'package:ezedu/models/tutor.dart';
import 'package:ezedu/screens/viewmodel.dart';
import 'package:ezedu/services/tutor_service.dart';

class TutorNotesViewModel extends ViewModel {
  final TutorService _tutorService = locator<TutorService>();

  Future<Tutor> getTutor({String? id = ""}) async {
    setBusy(true);

    Tutor tutor = await _tutorService.getTutor(id: id);
    /* note
      upload note sama mcm feed, tpi die aim to specific class
      ade upload notes, link, image and video
    tapi klu xleh buat note and image je la, 
    kire video dgn link tu sekalikan die copy paste kat note je
    */
    setBusy(false);
    return tutor;
  }
}
