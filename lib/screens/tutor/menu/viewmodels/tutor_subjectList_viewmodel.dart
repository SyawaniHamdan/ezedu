import 'dart:io';
import 'package:ezedu/app/locator.dart';
import 'package:ezedu/models/subject.dart';
import 'package:ezedu/models/tutor.dart';
import 'package:ezedu/screens/viewmodel.dart';
import 'package:ezedu/services/subject_service.dart';
import 'package:ezedu/services/tutor_service.dart';

class TutorSubjectListViewModel extends ViewModel {

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

    //_tutorList = (await _tutorService.getTutor()) as List<Tutor>?;

    if (_subjectList!.isEmpty) empty = true;

    setBusy(false);
  }

  Tutor getSubjectTutor(String tutorId) =>
      tutorList.firstWhere((tutor) => tutor.id == tutorId);
  
  Subject getSubject(String subjectId) =>
      subjectList.firstWhere((subject) => subject.id == subjectId);

}
