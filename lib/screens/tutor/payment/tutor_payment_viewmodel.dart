import 'package:ezedu/app/locator.dart';
import 'package:ezedu/models/student.dart';
import 'package:ezedu/models/studentsubject.dart';
import 'package:ezedu/models/subject.dart';
import 'package:ezedu/screens/viewmodel.dart';
import 'package:ezedu/services/students/student_service.dart';
import 'package:ezedu/services/studentsubject_service.dart';
import 'package:ezedu/services/subject_service.dart';

class TutorPaymentViewModel extends ViewModel {
  final StudentSubjectService _studentsubjectService =
      locator<StudentSubjectService>();
  final SubjectService _subjectService = locator<SubjectService>();
  final StudentService _studentService = locator<StudentService>();

  bool empty = false;

  List<StudentSubject>? _studentsubjectList;
  get studentsubjectList => _studentsubjectList;

  List<Subject>? _subjectList;
  get subjectList => _subjectList;

  List<Student>? _studentList;
  get studentList => _studentList;

  Future initialise() async {
    setBusy(true);

    _subjectList = await _subjectService.getSubjectByTutorId(currentTutor.id!);

    for (Subject subject in subjectList) {
      List<StudentSubject>? ss = await _studentsubjectService
          .getStudentSubjectBySubjectId(subject.id!);
      _studentsubjectList = studentsubjectList + ss;
    }

    _studentList = await _studentService.getStudents();

    if (studentsubjectList.length == 0) empty = true;

    setBusy(false);
  }

  Subject getSubject(String subjectId) =>
      subjectList.firstWhere((subject) => subject.id == subjectId);

  Student getStudent(String studentId) =>
      studentList.firstWhere((student) => student.id == studentId);
}
