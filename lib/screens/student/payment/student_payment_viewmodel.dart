import 'package:ezedu/app/locator.dart';
import 'package:ezedu/models/studentsubject.dart';
import 'package:ezedu/models/subject.dart';
import 'package:ezedu/models/tutor.dart';
import 'package:ezedu/screens/viewmodel.dart';
import 'package:ezedu/services/studentsubject_service.dart';
import 'package:ezedu/services/subject_service.dart';
import 'package:ezedu/services/tutor_service.dart';

class StudentPaymentViewModel extends ViewModel {
  // view model function here

  final StudentSubjectService _studentsubjectService =
      locator<StudentSubjectService>();
  final SubjectService _subjectService = locator<SubjectService>();
  final TutorService _tutorService = locator<TutorService>();

  bool empty = false;

  List<StudentSubject>? _studentsubjectList;
  get studentsubjectList => _studentsubjectList;

  List<Subject>? _subjectList;
  get subjectList => _subjectList;

  List<Tutor>? _tutorList;
  get tutorList => _tutorList;

  double totalBills = 0.0;

  Future initialise() async {
    setBusy(true);

    _subjectList = await _subjectService.getSubjects();
    _tutorList = await _tutorService.getTutors();
    _studentsubjectList = await _studentsubjectService
        .getApprovedStudentSubjectByStudentId(currentStudent.id!);

    for (StudentSubject studentSubject in studentsubjectList) {
      totalBills += getSubject(studentSubject.subjectId).subjectPrice;
    }

    if (studentsubjectList.length == 0) empty = true;
    setBusy(false);
  }

  Future studentPayment({
    String id = "",
    String status = "",
    String date = "",
    double price = 0,
  }) async {
    setBusy(true);

    await _studentsubjectService.studentPayment(
        id: id, status: status, date: date, price: price);

    setBusy(false);
  }

  String getPaymentSubject(String subjectId) {
    String returnTxt = "pay";

    for (StudentSubject ss in studentsubjectList) {
      if (ss.subjectId == subjectId) {
        returnTxt = ss.status;
      }
    }

    return returnTxt;
  }

  Subject getSubject(String subjectId) =>
      subjectList.firstWhere((subject) => subject.id == subjectId);

  Tutor getTutor(String tutorId) =>
      tutorList.firstWhere((tutor) => tutor.id == tutorId);
}
