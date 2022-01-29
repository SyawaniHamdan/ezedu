import 'dart:io';
import 'package:ezedu/app/locator.dart';
import 'package:ezedu/models/tutor.dart';
import 'package:ezedu/screens/viewmodel.dart';
import 'package:ezedu/services/tutor_service.dart';

class TutorStudentListViewModel extends ViewModel {
  final TutorService _tutorService = locator<TutorService>();

  Future<Tutor> getTutor({String? id = ""}) async {
    setBusy(true);

    Tutor tutor = await _tutorService.getTutor(id: id);
    /* student list
      bace balik nama dak2 yg dlm list tu
    */
    setBusy(false);
    /*patot bole tekan budak tu pstu die lead kat page budak tu, 
    kt situ leh tgk, or tekan chat, idk..*/
    return tutor;
  }
}
