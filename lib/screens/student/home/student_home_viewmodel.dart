import 'package:ezedu/app/locator.dart';
import 'package:ezedu/models/studentsubject.dart';
import 'package:ezedu/models/subject.dart';
import 'package:ezedu/models/tutor.dart';
import 'package:ezedu/screens/viewmodel.dart';
import 'package:ezedu/services/studentsubject_service.dart';
import 'package:ezedu/services/subject_service.dart';
import 'package:ezedu/services/tutor_service.dart';

class StudentHomeViewModel extends ViewModel {
  final SubjectService _subjectService = locator<SubjectService>();
  final StudentSubjectService _studentsubjectService =
      locator<StudentSubjectService>();
  final TutorService _tutorService = locator<TutorService>();

  bool empty = false;

  List<Subject>? _subjectList;
  get subjectList => _subjectList;

  List<StudentSubject> _studentsubjectList = [];
  get studentsubjectList => _studentsubjectList;

  List<Tutor>? _tutorList;
  get tutorList => _tutorList;

  Future initialise() async {
    setBusy(true);

    _subjectList = await _subjectService.getSubjects();

    _studentsubjectList = await _studentsubjectService
        .getStudentSubjectByStudentId(currentStudent.id!);

    _tutorList = await _tutorService.getTutors();

    if (subjectList.length == 0) empty = true;

    setBusy(false);
  }

  Future createStudentSubject({
    String studentId = "",
    String subjectId = "",
  }) async {
    setBusy(true);

    StudentSubject studentSubject = StudentSubject(
      date: "",
      price: 0,
      status: "pending",
      studentId: studentId,
      subjectId: subjectId,
    );

    await _studentsubjectService.createStudentSubject(studentSubject);

    setBusy(false);
  }

  String getStudentSubject(String subjectId) {
    String returnTxt = "hire now";

    for (StudentSubject ss in studentsubjectList) {
      if (ss.subjectId == subjectId) {
        returnTxt = ss.status;
      }
    }

    return returnTxt;
  }

  Tutor getTutor(String tutorId) =>
      tutorList.firstWhere((tutor) => tutor.id == tutorId);

  Subject getSubject(String subjectId) =>
      subjectList.firstWhere((subject) => subject.id == subjectId);
}
