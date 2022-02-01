import 'dart:io';
import 'package:ezedu/app/locator.dart';
import 'package:ezedu/models/note.dart';
import 'package:ezedu/models/subject.dart';
import 'package:ezedu/screens/viewmodel.dart';
import 'package:ezedu/services/subject_service.dart';
import 'package:ezedu/services/tutor_note_service.dart';

class TutorNotesViewModel extends ViewModel {
  final NoteService _noteService = locator<NoteService>();
  final SubjectService _subjectService = locator<SubjectService>();

  bool empty = false;

  List<Notes>? _noteList;
  get noteList => _noteList;

  List<Subject>? _tutorNoteSubjectList;
  get tutorNoteSubjectList => _tutorNoteSubjectList;

  List<Subject>? _subjectDetails;
  get subjectDetails => _subjectDetails;

  Future initialise() async {
    setBusy(true);

    _noteList = await _noteService.getNotebyTutorId(currentTutor.id!);
    _subjectDetails = await _subjectService.getSubjects();
    // _noteDetails = await _noteService.getNotesAll();

    if (noteList.length == 0) empty = true;

    setBusy(false);
  }

  Subject getSubject(String subjectId) =>
      subjectDetails.firstWhere((subject) => subject.id == subjectId);
}
