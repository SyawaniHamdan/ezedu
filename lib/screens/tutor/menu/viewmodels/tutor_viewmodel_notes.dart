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

  List<Subject>? _subjectList;
  get subjectList => _subjectList;

  Future initialise() async {
    setBusy(true);

    _noteList = await _noteService.getNotebyTutorId(currentTutor.id!);
    _subjectDetails = await _subjectService.getSubjects();
    // _noteDetails = await _noteService.getNotesAll();
    _subjectList = await _subjectService.getSubjectByTutorId(currentTutor.id!);

    if (noteList.length == 0) empty = true;

    setBusy(false);
  }

  Subject getSubject(String subjectId) =>
      subjectDetails.firstWhere((subject) => subject.id == subjectId);
  Subject getSubjectTutorId(String tutorId) =>
      subjectList.firstWhere((subject) => currentTutor.id == tutorId);

  void delete(String noteId) async {
    setBusy(true);

    await _noteService.deleteNote(noteId);

    setBusy(false);
  }

  void createNote({
    noteDetail,
    subjectId,
    tutorId,
  }) async {
    setBusy(true);

    Notes note =
        Notes(noteDetail: noteDetail, subjectId: subjectId, tutorId: tutorId);

    await _noteService.createNote(note);

    setBusy(false);
  }
}
