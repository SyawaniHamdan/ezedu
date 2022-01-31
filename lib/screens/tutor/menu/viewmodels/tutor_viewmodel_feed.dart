import 'dart:io';
import 'package:ezedu/app/locator.dart';
import 'package:ezedu/models/subject.dart';
import 'package:ezedu/models/tutor.dart';
import 'package:ezedu/screens/viewmodel.dart';
import 'package:ezedu/services/authentication_service.dart';
import 'package:ezedu/services/subject_service.dart';
import 'package:ezedu/services/tutor_service.dart';

class TutorFeedViewModel extends ViewModel {
  final AuthenticationService _authenticationService =
    locator<AuthenticationService>();

  final SubjectService _subjectService = locator<SubjectService>();
  final TutorService _tutorService = locator<TutorService>();
  
  bool empty = false;

  List<Subject>? _subjectList;
  get subjectList => _subjectList;

  List<Tutor>? _tutorList;
  get tutorList => _tutorList;

  Future initialise() async {
    setBusy(true);

    _subjectList = await _subjectService.getSubjectByTutorId(currentTutor.id!);

    _tutorList = (await _tutorService.getTutor()) as List<Tutor>?;

    if (_subjectList?.length == 0) empty = true;

    setBusy(false);
  }

  void createSubject(
      {subjectName, subjectDesc, subjectPrice, subjectSlot, tutorId}) async {
    setBusy(true);

    Subject subject = Subject(
        subjectName: subjectName,
        subjectDesc: subjectDesc,
        subjectPrice: subjectPrice,
        subjectSlot: subjectSlot,
        tutorId: tutorId);

    await _subjectService.createSubject(subject);

    setBusy(false);
  }

  Tutor getSubjectTutor(String tutorId) =>
      tutorList.firstWhere((tutor) => tutor.id == tutorId);
  
  Subject getSubject(String subjectId) =>
      subjectList.firstWhere((subject) => subject.id == subjectId);

}
