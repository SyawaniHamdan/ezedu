import 'dart:io';
import 'package:ezedu/app/locator.dart';
import 'package:ezedu/models/tutor.dart';
import 'package:ezedu/screens/viewmodel.dart';
import 'package:ezedu/services/tutor_service.dart';

class TutorFeedViewModel extends ViewModel {
  final TutorService _tutorService = locator<TutorService>();

  Future<Tutor> getTutor({String? id = ""}) async {
    setBusy(true);

    Tutor tutor = await _tutorService.getTutor(id: id);
    /* feed
    mcm note tapi more to broadcast? to all kelas yg die ajo
    ade upload notes, link, image and video
    tapi klu xleh buat note and image je la, 
    video dgn link tu sekalikan die copy paste kat note je
    */
    setBusy(false);
    /*feed history, baca balik bende yg lect dh upload,
    rase bace bende yg to all & to note specific class
    */
    return tutor;
  }
}
