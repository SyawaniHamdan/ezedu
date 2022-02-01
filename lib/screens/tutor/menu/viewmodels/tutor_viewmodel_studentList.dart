import 'dart:io';
import 'package:ezedu/app/locator.dart';
import 'package:ezedu/models/student.dart';
import 'package:ezedu/models/studentsubject.dart';
import 'package:ezedu/models/tutor.dart';
import 'package:ezedu/screens/viewmodel.dart';
import 'package:ezedu/services/students/student_service.dart';
import 'package:ezedu/services/studentsubject_service.dart';
import 'package:ezedu/services/tutor_service.dart';

class TutorStudentListViewModel extends ViewModel {
  final StudentSubjectService _studentSubjectService =
      locator<StudentSubjectService>();
  final StudentService _studentService = locator<StudentService>();

  bool empty = false;

  List<StudentSubject>? _studentsubjectList;
  get studentsubjectList => _studentsubjectList;

  List<Student>? _studentList;
  get studentList => _studentList;

  Future initialise(String? subjectId) async {
    setBusy(true);

    _studentsubjectList =
        await _studentSubjectService.getStudentSubjectBySubjectId(subjectId!);

    _studentList = await _studentService.getStudents();

    if (studentsubjectList.length == 0) empty = true;

    setBusy(false);
  }

  Future studentApproval({
    String id = "",
    String status = "",
  }) async {
    setBusy(true);

    await _studentSubjectService.studentApproval(id: id, status: status);

    setBusy(false);
  }

  Student getStudent(String studentId) =>
      studentList.firstWhere((student) => student.id == studentId);
}
