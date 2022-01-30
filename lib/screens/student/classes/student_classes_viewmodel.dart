import 'package:ezedu/app/locator.dart';
import 'package:ezedu/models/studentsubject.dart';
import 'package:ezedu/models/subject.dart';
import 'package:ezedu/models/tutor.dart';
import 'package:ezedu/screens/viewmodel.dart';
import 'package:ezedu/services/studentsubject_service.dart';
import 'package:ezedu/services/subject_service.dart';
import 'package:ezedu/services/tutor_service.dart';

class StudentClassesViewModel extends ViewModel {
  final StudentSubjectService _studentSubjectService =
      locator<StudentSubjectService>();
  final SubjectService _subjectService = locator<SubjectService>();
  final TutorService _tutorService = locator<TutorService>();

  bool empty = false;

  List<StudentSubject> _studentsubjectList = [];
  get studentsubjectList => _studentsubjectList;

  List<Subject>? _subjectList;
  get subjectList => subjectList;

  List<Tutor>? _tutorList;
  get tutorList => _tutorList;

  Future initialise() async {
    setBusy(true);

    // belum buat!! subjectList/subjectService ??
    //_studentSubjectService = await _studentSubjectService.getStudentSubject();
  }

  Subject getSubject(String subjectId) =>
      subjectList.firstWhere((subject) => subject.id == subjectId);
}
