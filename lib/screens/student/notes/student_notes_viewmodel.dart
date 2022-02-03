import 'package:ezedu/app/locator.dart';
import 'package:ezedu/models/note.dart';
import 'package:ezedu/models/studentsubject.dart';
import 'package:ezedu/models/subject.dart';
import 'package:ezedu/models/tutor.dart';
import 'package:ezedu/screens/viewmodel.dart';
import 'package:ezedu/services/studentsubject_service.dart';
import 'package:ezedu/services/subject_service.dart';
import 'package:ezedu/services/tutor_note_service.dart';
import 'package:ezedu/services/tutor_service.dart';

class StudentNotesViewModel extends ViewModel {
  final StudentSubjectService _studentsubjectService =
      locator<StudentSubjectService>();
  final NoteService _noteService = locator<NoteService>();
  final SubjectService _subjectService = locator<SubjectService>();
  final TutorService _tutorService = locator<TutorService>();

  bool empty = false;

  List<Notes> _notesList = [];
  get notesList => _notesList;

  List<Subject>? _subjectList;
  get subjectList => _subjectList;

  List<Tutor>? _tutorList;
  get tutorList => _tutorList;

  List<StudentSubject> _studentsubjectList = [];
  get studentsubjectList => _studentsubjectList;

  Future initialise() async {
    setBusy(true);

    _subjectList = await _subjectService.getSubjects();
    _tutorList = await _tutorService.getTutors();

    _studentsubjectList = await _studentsubjectService
        .getStudentSubjectByStudentId(currentStudent.id!);

    for (StudentSubject studentSubject in studentsubjectList) {
      List<Notes>? note =
          await _noteService.getNotebySubjectId(studentSubject.subjectId);
      _notesList = _notesList + note;
    }

    if (studentsubjectList.length == 0) empty = true;

    setBusy(false);
  }

  Subject getSubject(String subjectId) =>
      subjectList.firstWhere((subject) => subject.id == subjectId);
  Tutor getTutor(String tutorId) =>
      tutorList.firstWhere((tutor) => tutor.id == tutorId);
}
